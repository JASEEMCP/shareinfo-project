import 'package:shareinfo/application/happening/event_occurred_cubit/event_occurred_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/event_list_card_widget.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';

class ScreenEventOccurred extends StatelessWidget {
  const ScreenEventOccurred({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<EventOccurredCubit>().getOccurredEvent();
      },
    );
    return BlocBuilder<EventOccurredCubit, EventOccurredState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          empty: () => NotFound(
            onRefresh: () {
              context.read<EventOccurredCubit>().refreshOccurredEvent();
            },
            errorText: 'There is No Happenings to\nShow Here!',
          ),
          error: (e) => NetWorkError(
            onRefresh: () {
              context.read<EventOccurredCubit>().refreshOccurredEvent();
            },
          ),
          loading: () => const EventListLoading(),
          success: (model) => RefreshIndicator(
            onRefresh: () async {
              context.read<EventOccurredCubit>().refreshOccurredEvent();
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
    );
  }
}
