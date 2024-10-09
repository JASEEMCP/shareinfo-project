import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shareinfo/application/auth/token_cubit/token_cubit.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/main_screen/main_screen.dart';
import 'package:shareinfo/presentation/root_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/views/padding.dart';
import 'package:shareinfo/router/router_path.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    super.key,
    this.onRefresh,
    this.padding,
  });
  final Function? onRefresh;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: padding ?? const EdgeInsets.only(top: kToolbarHeight + 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/gif/network_error.gif",
                height: 176,
                width: 200,
              ),
              Gap($style.insets.sm),
              Text(
                'Page Not Found',
                textScaler: const TextScaler.linear(1),
                style: $style.text.textBold26.copyWith(
                  color: context.theme.imiotDarkPurple,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: $style.insets.md),
                child: Text(
                  "We couldn't find the page you were looking for. It may have been moved or deleted.",
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.center,
                  style: $style.text.textBold12.copyWith(
                    color: context.theme.shareinfoOrange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: CustomElevatedButton(
          buttonName: 'Close',
          width: ElevatedButtonWidth.large,
          onPressed: () {
            tabChangeNotifier.value = 0;
            tokenCubit.state.isInitial
                ? context.go(ScreenPath.home)
                : context.go(ScreenPath.login);
          },
        ),
      ),
    );
  }
}
