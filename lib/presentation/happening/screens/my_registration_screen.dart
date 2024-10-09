import 'package:shareinfo/application/happening/registered_event_cubit/registered_event_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/event_list_card_widget.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';

class ScreenMyRegistration extends StatelessWidget {
  const ScreenMyRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<RegisteredEventCubit>().getRegisteredEvent();
      },
    );
    return BlocBuilder<RegisteredEventCubit, RegisteredEventState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          empty: () => NotFound(
            errorText: 'There is No Registered Happening\nRight Now!',
            onRefresh: () {
              context.read<RegisteredEventCubit>().refreshRegisteredEvent();
            },
          ),
          error: (e) => NetWorkError(
            onRefresh: () {
              context.read<RegisteredEventCubit>().refreshRegisteredEvent();
            },
          ),
          loading: () => const EventListLoading(),
          success: (model) => RefreshIndicator(
            onRefresh: () async {
              context.read<RegisteredEventCubit>().refreshRegisteredEvent();
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
