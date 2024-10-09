import 'package:shareinfo/application/practice/enroll_practice_cubit/enroll_practice_cubit.dart';
import 'package:shareinfo/application/practice/practice_detail_cubit/practice_detail_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';

class ScreenPracticeDetail extends StatelessWidget {
  const ScreenPracticeDetail({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final text = $style.text;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<PracticeDetailCubit>().getPracticeDetail(id.toString());
      },
    );
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        enableSuffixIcon: false,
        title: 'UI Engineer Competition',
      ),
      body: BlocBuilder<PracticeDetailCubit, PracticeDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e) => NetWorkError(
              onRefresh: () => context
                  .read<PracticeDetailCubit>()
                  .getPracticeDetail(id.toString()),
            ),
            success: (m) => SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(inset.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: context.theme.shareinfoMidBlue,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      height: 150,
                      width: context.w * 100,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          topRight: Radius.circular(21),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        m.bannerImage ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(inset.sm),
                    Padding(
                      padding: EdgeInsets.only(left: inset.xs, right: inset.xs),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m.practiceTask ?? '',
                            style: text.textBold16.copyWith(
                              color: context.theme.imiotDarkPurple,
                            ),
                          ),
                          Text(
                            m.description ?? '',
                            style: text.textSBold12.copyWith(
                              color: context.theme.imiotDarkPurple,
                            ),
                          ),
                          Gap(inset.xs),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: [
                              SmoothBorderChip(
                                text: m.category ?? '',
                                bgColor: context.theme.shareinfoBlue,
                                textColor: context.theme.shareinfoWhite,
                              ),
                              SmoothBorderChip(
                                text: '20 Perks',
                                bgColor: context.theme.shareinfoBlue,
                                textColor: context.theme.shareinfoWhite,
                              ),
                            ],
                          ),
                          Gap(inset.xs),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: [
                              for (String itm in m.subCategories ?? [])
                                SmoothBorderChip(
                                  text: itm,
                                ),
                            ],
                          ),
                          Gap(inset.lg),
                          _buildTitleAndContent(
                            context,
                            title: 'Objective',
                            content: m.objective,
                          ),
                          _buildTitleAndContent(context,
                              title: 'Assessment', content: m.overview),
                          for (int index = 0; index < m.steps!.length; index++)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Step ${index + 1}',
                                  style: text.textBold14.copyWith(
                                    color: context.theme.shareinfoGrey,
                                  ),
                                ),
                                Text(
                                  m.steps?[index].stepName ?? '',
                                  style: text.textBold12.copyWith(
                                    color: context.theme.imiotDarkPurple,
                                  ),
                                ),
                                for (String step
                                    in m.steps?[index].stepDescription ?? [])
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\u2022",
                                        style: $style.text.textSBold10.copyWith(
                                          color: context.theme.imiotDarkPurple,
                                        ),
                                      ),
                                      Gap(inset.xs),
                                      Expanded(
                                        child: Text(
                                          step,
                                          style:
                                              $style.text.textSBold10.copyWith(
                                            color:
                                                context.theme.imiotDarkPurple,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          Gap(inset.sm),
                          BlocConsumer<EnrollPracticeCubit,
                              EnrollPracticeState>(
                            listener: (context, state) {
                              if (state.isEnrolled) {
                                context.pop();
                              }
                            },
                            builder: (context, state) {
                              return CustomElevatedButton(
                                buttonName: 'Enroll Now!',
                                width: ElevatedButtonWidth.large,
                                onPressed: () {
                                  showSubmissionAlert(
                                    context,
                                    isLoading: state.isEnrolling,
                                    onSubmit: () {
                                      context
                                          .read<EnrollPracticeCubit>()
                                          .enrollPractice(m.id.toString());
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Gap(inset.sm)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column _buildTitleAndContent(BuildContext context,
      {String? title, String? content}) {
    final text = $style.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: text.textBold14.copyWith(
            color: context.theme.imiotDarkPurple,
          ),
        ),
        Text(
          content ?? '',
          style: text.textSBold12.copyWith(
            color: context.theme.imiotDarkPurple,
          ),
        ),
        Gap($style.insets.lg),
      ],
    );
  }
}
