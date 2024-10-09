import 'package:shareinfo/application/happening/saved_happening_cubit/saved_happening_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/event_list_card_widget.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';

class ScreenSavedEvents extends StatelessWidget {
  const ScreenSavedEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<SavedHappeningCubit>().getSavedEvent();
      },
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Hero(
              tag: 'saved_event',
              child: Material(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: context.theme.shareinfoGrey,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Saved Happenings',
                style: $style.text.textBold18.copyWith(
                  color: context.theme.imiotDarkPurple,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<SavedHappeningCubit, SavedHappeningState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            empty: () => NotFound(
              onRefresh: () {
                context.read<SavedHappeningCubit>().refreshSavedEvent();
              },
              errorText: 'No Saved Event',
            ),
            error: (e) => NetWorkError(
              onRefresh: () {
                context.read<SavedHappeningCubit>().refreshSavedEvent();
              },
            ),
            loading: () => const EventListLoading(),
            success: (model) => RefreshIndicator(
              onRefresh: () async {
                context.read<SavedHappeningCubit>().refreshSavedEvent();
              },
              child: GridView.builder(
                padding: EdgeInsets.only(
                    left: inset.sm, right: inset.sm, bottom: inset.lg),
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
