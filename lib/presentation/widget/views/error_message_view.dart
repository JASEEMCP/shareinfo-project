import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class CustomErrorTextView extends StatelessWidget {
  const CustomErrorTextView({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35 * context.h),
      child: Center(
        child: Text(
          content,
          style: $style.text.textBold18.copyWith(
            color: context.theme.imiotDarkPurple,
          ),
        ),
      ),
    );
  }
}

class CustomErrorTextViewC extends StatelessWidget {
  const CustomErrorTextViewC({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        content,
        style: $style.text.textBold18.copyWith(
          color: context.theme.imiotDarkPurple,
        ),
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35 * context.h),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class CustomCircularProgressIndicatorC extends StatelessWidget {
  const CustomCircularProgressIndicatorC({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
