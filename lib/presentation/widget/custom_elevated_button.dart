import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

enum ElevatedButtonWidth {
  medium,
  large,
  custom,
}

extension ElevatedButtonSize on ElevatedButtonWidth {
  int get percentage {
    switch (this) {
      case ElevatedButtonWidth.medium:
        return 40;
      case ElevatedButtonWidth.large:
        return 100;
      case ElevatedButtonWidth.custom:
        return 60;
      default:
        return 80;
    }
  }
}

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.buttonName,
    this.backgroundColor,
    this.buttonTextColor,
    required this.width,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.progress,
  });
  final String buttonName;
  final Color? backgroundColor;
  final Color? buttonTextColor;
  final ElevatedButtonWidth width;
  final Function onPressed;
  final bool? isLoading;
  final bool? disable;
  final double? progress;
  final Debouncer _debouncerBtn = Debouncer(const Duration(milliseconds: 200));
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (disable!) {
          return;
        }
        _debouncerBtn.call(
          () {
            ///Handle user pressing multiple time while calling api
            isLoading != null
                ? isLoading!
                    ? () {}
                    : onPressed()
                : onPressed();
          },
        );
      },
      style: ButtonStyle(
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        maximumSize: WidgetStatePropertyAll(Size(
            width == ElevatedButtonWidth.custom
                ? 300
                : width.percentage * context.w,
            48)),
        minimumSize: WidgetStatePropertyAll(Size(
            width == ElevatedButtonWidth.custom
                ? 300
                : width.percentage * context.w,
            48)),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? context.theme.shareinfoBlue,
        ),
      ),
      child: isLoading!
          ? CircularProgressIndicator(
              value: progress,
              color: context.theme.shareinfoWhite,
            )
          : Text(
              buttonName,
              style: $style.text.textBold14.copyWith(
                overflow: TextOverflow.ellipsis,
                color: buttonTextColor ?? context.theme.shareinfoWhite,
              ),
            ),
    );
  }
}
