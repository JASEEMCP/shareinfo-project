import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
    required this.items,
  });

  final List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: context.theme.imiotDarkPurple,
            width: 1.5,
          ),
        ),
      ),
      child: Drawer(
        shape: InputBorder.none,
        backgroundColor: context.theme.shareinfoWhite,
        surfaceTintColor: Colors.transparent,
        width: 190,
        child: ListView(
          children: [
            Image.asset(
              ImagePaths.shareInfoLogo1,
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: items,
            ),
            Gap(30 * context.h),
          ],
        ),
      ),
    );
  }
}

class CustomStatusButton extends StatelessWidget {
  const CustomStatusButton({
    super.key,
    required this.backgroundColor,
    required this.statusName,
    required this.textColor,
    required this.onPressed,
    required this.buttonId,
    required this.selectedItem,
  });

  final Color backgroundColor;
  final String statusName;
  final Color textColor;
  final Function(int) onPressed;
  final int buttonId;
  final int selectedItem;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 30,
      duration: const Duration(milliseconds: 150),
      width: selectedItem == buttonId ? 180 : 170,
      child: ElevatedButton(
        onPressed: () {
          onPressed(buttonId);
        },
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          elevation: 0,
          side: selectedItem == buttonId
              ? BorderSide(color: textColor, width: 1)
              : null,
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        child: Text(
          statusName,
          textScaler: const TextScaler.linear(1),
          style: $style.text.textBold10.copyWith(
            color: textColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
