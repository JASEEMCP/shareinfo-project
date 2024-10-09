import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'institute_selection_screen.dart';

class ScreenExpertise extends StatefulWidget {
  ScreenExpertise({
    super.key,
  });

  final List<String> expertiseList = [
    "Software Developer and Designer",
    "Accounting and Finance",
    "Marketing",
    "Content Writing and Documentation",
    "Management",
    "Media/Design/Creatives",
    "Architecture and Engineering",
  ];

  @override
  State<ScreenExpertise> createState() => _ScreenExpertiseState();
}

class _ScreenExpertiseState extends State<ScreenExpertise> {
  final ValueNotifier<int> selectedItemNotifier = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: buildCustomAppBar(context, title: "", enableSuffixIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: inset.lg,
            right: inset.lg,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'What is your Expertise ?',
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: $style.text.textBold30.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
                Text(
                  'Please select your field of expertise',
                  textAlign: TextAlign.center,
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textSBold12.copyWith(
                    color: context.theme.shareinfoGrey,
                  ),
                ),
                Gap(inset.sm),
                Divider(
                  color: context.theme.shareinfoGreyLite,
                ),
                Gap(inset.lg),
                for (int index = 0;
                    index < widget.expertiseList.length;
                    index++)
                  _buildExpertiseCheckBox(
                    context,
                    index,
                    title: widget.expertiseList[index],
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: inset.sm),
            child: ValueListenableBuilder(
              valueListenable: selectedItemNotifier,
              builder: (context, index, _) {
                return CustomElevatedButton(
                  buttonName: 'Continue',
                  width: ElevatedButtonWidth.custom,
                  onPressed: () {
                    ///preventing user does not choosing expertise
                    if (index == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          showSnackBar('Please fill your expertise field'));
                      return;
                    }

                    ///Adding expertise data into pre profile model
                    preProfileModel.expertise = widget.expertiseList[index];

                    ///Navigate to institute selection screen
                    context.go(ScreenPath.aspirations());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _buildExpertiseCheckBox(
    BuildContext context,
    int itemIndex, {
    required String title,
  }) {
    final inset = $style.insets;
    return Container(
      margin: EdgeInsets.only(bottom: inset.md),
      padding: EdgeInsets.all(inset.xxs + 1),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.theme.shareinfoGrey,
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: context.theme.shareinfoGreyLite,
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
        borderRadius: BorderRadius.circular(inset.md),
        border: Border.all(color: context.theme.shareinfoGreyLite),
        color: context.theme.shareinfoWhite,
      ),
      child: ValueListenableBuilder(
          valueListenable: selectedItemNotifier,
          builder: (context, index, _) {
            return CheckboxListTile(
              checkColor: context.theme.shareinfoWhite,
              activeColor: context.theme.shareinfoGrey,
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              value: itemIndex == index,
              onChanged: (value) {
                if (index == itemIndex) {
                  selectedItemNotifier.value = -1;
                  return;
                }
                selectedItemNotifier.value = itemIndex;
              },
              contentPadding: EdgeInsets.only(left: inset.sm, right: inset.sm),
              title: Text(
                title,
                textScaler: const TextScaler.linear(1),
                style: $style.text.textSBold14
                    .copyWith(color: context.theme.imiotDarkPurple),
                textAlign: TextAlign.start,
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    selectedItemNotifier.dispose();
    super.dispose();
  }
}
