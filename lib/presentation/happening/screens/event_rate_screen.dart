import 'package:shareinfo/application/happening/feedback_submission_cubit/feedback_submission_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';

class ScreenEventRating extends StatefulWidget {
  const ScreenEventRating({super.key, required this.eventId});
  final String eventId;
  @override
  State<ScreenEventRating> createState() => _ScreenEventRatingState();
}

class _ScreenEventRatingState extends State<ScreenEventRating> {
  int _rating = 0;
  final _feedbackTextController = generateTextController();
  final _formKey = generateFormKey();
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.theme.shareinfoGrey,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: inset.md),
          child: SizedBox(
            width: 600,
            child: ListView(
              children: [
                Image.asset(
                  'assets/gif/feedback_sent.gif',
                  height: 170,
                ),
                Gap(inset.sm),
                Text(
                  'Thank You !',
                  textScaler: const TextScaler.linear(1),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: $style.text.textBold20.copyWith(
                    color: context.theme.shareinfoBlue,
                  ),
                ),
                Text(
                  'For Your Participation',
                  textAlign: TextAlign.center,
                  textScaler: const TextScaler.linear(1),
                  maxLines: 1,
                  style: $style.text.textSBold18.copyWith(
                    color: context.theme.shareinfoTextDark,
                  ),
                ),
                Gap(inset.xs),
                Text(
                  'We\'re happy to Hear from You!',
                  textAlign: TextAlign.center,
                  textScaler: const TextScaler.linear(1),
                  maxLines: 1,
                  style: $style.text.textSBold14.copyWith(
                    color: context.theme.shareinfoTextDark,
                  ),
                ),
                Gap(inset.lg),
                Text(
                  'Rate the Event',
                  textAlign: TextAlign.left,
                  textScaler: const TextScaler.linear(1),
                  maxLines: 1,
                  style: $style.text.textBold12.copyWith(
                    color: context.theme.shareinfoTextDark,
                  ),
                ),
                Gap(inset.md),
                Row(
                  children: [
                    Gap(inset.xs),
                    for (int index = 0; index < 5; index++)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                        icon: index < _rating
                            ? const Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            : const Icon(Icons.star_border),
                      )
                  ],
                ),
                Gap(inset.lg),
                Form(
                  key: _formKey,
                  child: MultiLineTextField(
                    validate: true,
                    controller: _feedbackTextController,
                    maxLine: 10,
                    label: 'Feedback',
                    hintText:
                        'Brief Your feedback here!\nOur Community Development will Definitely care About each Feedback from you end,and definitely improve our Happenings and Platform Experience',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<FeedbackSubmissionCubit, FeedbackSubmissionState>(
        listener: (context, state) {
          if (state.isSubmitted) {
            return context.go(ScreenPath.feedbackSuccess(widget.eventId));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: customPaddingBottom(),
            child: CustomElevatedButton(
              isLoading: state.isSubmitting,
              buttonName: 'Submit',
              width: ElevatedButtonWidth.large,
              onPressed: () {
                /// Submitting feedback
                if (_formKey.currentState!.validate() && _rating != 0) {
                  context.read<FeedbackSubmissionCubit>().submitFeedback(
                        widget.eventId,
                        _feedbackTextController.text.trim(),
                        _rating,
                      );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
