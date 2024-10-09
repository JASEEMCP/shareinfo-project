import 'package:shareinfo/presentation/authentication/screens/institute_selection_screen.dart';
import 'package:shareinfo/presentation/authentication/widget/shareinfo_logo_widget.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenStatusSelection extends StatefulWidget {
  ScreenStatusSelection({
    super.key,
  });
  final _statusList = ["Student", "Fresher", "Professional", "Entrepreneur"];

  @override
  State<ScreenStatusSelection> createState() => _ScreenStatusSelectionState();
}

class _ScreenStatusSelectionState extends State<ScreenStatusSelection> {
  final ValueNotifier<int> selectedItemNotifier = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: inset.md,
                  top: inset.lg,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: inset.lg,
                  right: inset.lg,
                  top: inset.offset,
                ),
                child: Column(
                  children: [
                    buildShareInfoLogo(context),
                    Text(
                      'Choose your current status!',
                      textScaler: const TextScaler.linear(1),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: $style.text.textBold26.copyWith(
                        color: context.theme.imiotDarkPurple,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        '''"Select your current status effortlessly, whether you're a student, professional, entrepreneur, or in transition. Customize your profile to reflect your journey and aspirations with ease."''',
                        textAlign: TextAlign.center,
                        textScaler: const TextScaler.linear(1),
                        style: $style.text.textSBold12.copyWith(
                          color: context.theme.shareinfoGrey,
                        ),
                      ),
                    ),
                    Gap(inset.lg),
                    StatusCategoryWidget(
                      selectedItemNotifier: selectedItemNotifier,
                      id: 0,
                      id2: 1,
                      imagePath: ImagePaths.studentIcon,
                      txtColor: context.theme.statusPurpleAccentDark,
                      innerColor: context.theme.statusPurple,
                      statusName: widget._statusList[0],
                      imagePath1: ImagePaths.fresherIcon,
                      txtColor1: context.theme.statusGreenAccentDark,
                      innerColor1: context.theme.statusGreen,
                      statusName1: widget._statusList[1],
                    ),
                    Gap(inset.lg),
                    StatusCategoryWidget(
                      selectedItemNotifier: selectedItemNotifier,
                      id: 2,
                      id2: 3,
                      imagePath: ImagePaths.professionalIcon,
                      txtColor: context.theme.statusRedAccentDark,
                      innerColor: context.theme.statusRed,
                      statusName: widget._statusList[2],
                      imagePath1: ImagePaths.entrepreneurIcon,
                      txtColor1: context.theme.statusYellowAccentDark,
                      innerColor1: context.theme.statusYellow,
                      statusName1: widget._statusList[3],
                    ),
                    Gap(inset.lg),
                    Padding(
                      padding: customPaddingBottom(),
                      child: ValueListenableBuilder(
                        valueListenable: selectedItemNotifier,
                        builder: (context, index, _) {
                          return CustomElevatedButton(
                            buttonName: 'Continue',
                            width: ElevatedButtonWidth.custom,
                            onPressed: () {
                              if (index == -1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    showSnackBar(
                                        'Please select your current status'));
                                return;
                              }

                              ///Adding status data into pre profile model
                              preProfileModel.currentStatus =
                                  widget._statusList[index];

                              context.go(ScreenPath.expertise());
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    selectedItemNotifier.dispose();
  }
}

class StatusCategoryWidget extends StatelessWidget {
  const StatusCategoryWidget({
    super.key,
    required this.statusName,
    required this.imagePath,
    required this.txtColor,
    required this.innerColor,
    required this.statusName1,
    required this.imagePath1,
    required this.txtColor1,
    required this.innerColor1,
    required this.id,
    required this.id2,
    required this.selectedItemNotifier,
  });
  final String statusName;
  final String imagePath;
  final Color txtColor;
  final Color innerColor;
  final String statusName1;
  final String imagePath1;
  final Color txtColor1;
  final Color innerColor1;
  final int id;
  final int id2;

  final ValueNotifier<int> selectedItemNotifier;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final clrGrey = context.theme.shareinfoGreyLite;
    return ValueListenableBuilder(
      valueListenable: selectedItemNotifier,
      builder: (context, index, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                selectedItemNotifier.value = id;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 130,
                decoration: BoxDecoration(
                  color: context.theme.shareinfoWhite,
                  borderRadius: BorderRadius.circular(inset.xl),
                  border: Border.all(
                    color: index == id ? txtColor : clrGrey,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(inset.md),
                    Container(
                      padding: EdgeInsets.all(inset.sm),
                      decoration: BoxDecoration(
                        color: innerColor,
                        borderRadius: BorderRadius.circular(inset.md),
                      ),
                      child: Image.asset(
                        imagePath,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        statusName,
                        textScaler: const TextScaler.linear(1),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: $style.text.textBold18.copyWith(
                          color: txtColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Gap(inset.md),
                  ],
                ),
              ),
            ),
            Gap(inset.sm),
            GestureDetector(
              onTap: () {
                selectedItemNotifier.value = id2;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 130,
                decoration: BoxDecoration(
                  color: context.theme.shareinfoWhite,
                  borderRadius: BorderRadius.circular(inset.xl),
                  border: Border.all(
                    color: index == id2 ? txtColor1 : clrGrey,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(inset.md),
                    Container(
                      padding: EdgeInsets.all(inset.sm),
                      decoration: BoxDecoration(
                        color: innerColor1,
                        borderRadius: BorderRadius.circular(inset.md),
                      ),
                      child: Image.asset(
                        imagePath1,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Text(
                      statusName1,
                      textScaler: const TextScaler.linear(1),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: $style.text.textBold18.copyWith(
                        color: txtColor1,
                      ),
                    ),
                    Gap(inset.md),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
