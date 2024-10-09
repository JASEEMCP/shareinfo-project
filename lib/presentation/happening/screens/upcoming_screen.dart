import 'package:shareinfo/application/happening/happening_list_cubit/happening_list_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/event_list_card_widget.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';

class ScreenUpcoming extends StatelessWidget {
  const ScreenUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<HappeningListCubit>().getUpcomingEvent();
      },
    );
    return Scaffold(
      body: BlocBuilder<HappeningListCubit, HappeningListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            error: (e) => NetWorkError(
              onRefresh: () async {
                context.read<HappeningListCubit>().refreshUpcomingEvent();
              },
            ),
            empty: () => NotFound(
              errorText: 'There is No Happenings\nRight Now!',
              onRefresh: () {
                context.read<HappeningListCubit>().refreshUpcomingEvent();
              },
            ),
            loading: () => const EventListLoading(),
            success: (model) => RefreshIndicator(
              onRefresh: () async {
                context.read<HappeningListCubit>().refreshUpcomingEvent();
              },
              child: GridView.builder(
                padding: EdgeInsets.only(
                  left: inset.sm,
                  right: inset.sm,
                  bottom: 100,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                      ? 1
                      : (context.w * 100) ~/ 300,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent:
                      ResponsiveWidget.isSmallScreen(context) ? 310 : 310,
                ),
                itemCount: model.length,
                itemBuilder: (ctx, index) {
                  return EventListCardWidget(
                    model: model,
                    index: index,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
