import 'dart:ui';

import 'package:shareinfo/presentation/core/common_lib.dart';

AppBar buildCustomAppBar(BuildContext context,
    {required String title,
    bool? enableSuffixIcon = true,
    PreferredSize? bottom,
    bool? disableBackButton = false,
    Function? onPop,
    Function? onSuffixIconPressed,
    final bool? absorbing = true,
    Color? background,
    bool? centerTitle,
    List<Widget>? action}) {
  return AppBar(
      backgroundColor: background ?? context.theme.shareinfoWhite,
      titleSpacing: $style.insets.xs,
      automaticallyImplyLeading: disableBackButton ?? true,
      bottom: bottom,
      centerTitle: centerTitle,
      title: Row(
        children: [
          IconButton(
            onPressed: onPop == null
                ? () {
                    context.pop();
                  }
                : () {
                    onPop();
                  },
            icon: const Icon(
              Icons.arrow_back_outlined,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: $style.text.textBold16.copyWith(
                color: context.theme.imiotDarkPurple,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      actions: enableSuffixIcon!
          ? [
              AbsorbPointer(
                absorbing: absorbing!,
                child: Padding(
                  padding: EdgeInsets.only(right: $style.insets.sm),
                  child: IconButton(
                    onPressed: () {
                      onSuffixIconPressed != null
                          ? onSuffixIconPressed()
                          : () {};
                    },
                    icon: Icon(Icons.delete_outline,
                        color: context.theme.shareinfoRed),
                  ),
                ),
              ),
            ]
          : action ?? [const SizedBox.shrink()]);
}

Widget customChipWidget(BuildContext context,
    {required String skillTitle, required Function onTap}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: $style.insets.xs,
          vertical: $style.insets.xxs,
        ),
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(
              color: context.theme.shareinfoBlue,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillTitle,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textSBold10,
            ),
            Icon(
              Icons.close,
              color: context.theme.shareinfoRed,
              size: 18,
            )
          ],
        ),
      ),
    ),
  );
}

Future<dynamic> showCustomAlertBox(BuildContext context,
    {required String content, Function? onSubmit}) {
  final inset = $style.insets;
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: PopScope(
          canPop: false,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            alignment: Alignment.center,
            contentPadding: EdgeInsets.only(
              top: inset.xxl,
              bottom: inset.sm,
              left: inset.xl,
              right: inset.xl,
            ),
            backgroundColor: context.theme.shareinfoWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            surfaceTintColor: Colors.transparent,
            content: Text(
              content,
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textN16.copyWith(
                color: context.theme.shareinfoRed,
                fontFamily: 'Cascadia',
              ),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: context.theme.shareinfoRed,
                      ),
                    ),
                  ),
                  splashFactory: NoSplash.splashFactory,
                  padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                  maximumSize: const WidgetStatePropertyAll(Size(100, 40)),
                  minimumSize: const WidgetStatePropertyAll(Size(85, 40)),
                  surfaceTintColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  backgroundColor:
                      WidgetStatePropertyAll(context.theme.shareinfoWhite),
                ),
                child: Text(
                  ' no, keep ',
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textN16.copyWith(
                    color: context.theme.shareinfoRed,
                    fontFamily: 'Cascadia',
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                  maximumSize: const WidgetStatePropertyAll(Size(100, 40)),
                  minimumSize: const WidgetStatePropertyAll(Size(85, 40)),
                  surfaceTintColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  backgroundColor: WidgetStatePropertyAll(
                    context.theme.shareinfoRed,
                  ),
                ),
                onPressed: () {
                  onSubmit != null ? onSubmit() : () {};
                },
                child: Text(
                  'Yes',
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textN16.copyWith(
                    color: context.theme.shareinfoWhite,
                    fontFamily: 'Cascadia',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
