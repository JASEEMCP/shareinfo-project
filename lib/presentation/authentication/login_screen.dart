import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:shareinfo/application/auth/login_cubit/login_cubit.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/authentication/widget/shareinfo_logo_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'widget/_auth_textfield_custom.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

enum ViewType {
  onBoardView,
  loginView,
  signUpView,
}

//This is Login screen of your application
class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final ValueNotifier<ViewType> viewNotifier =
      ValueNotifier<ViewType>(ViewType.onBoardView);

  final List<GlobalKey<FormState>> _formKey =
      List.generate(3, (index) => GlobalKey<FormState>());

  final ValueNotifier<double> axisYController = ValueNotifier<double>(70.0);
  final ValueNotifier<bool> visibilityNotifier = ValueNotifier<bool>(true);
  final Debouncer _debounceBtn = Debouncer(const Duration(milliseconds: 200));

  ///generate login textfield controller
  List<TextEditingController> loginController = List.generate(
    2,
    (index) => TextEditingController(),
  );

  ///Generate sign up textfield controller
  List<TextEditingController> signUpController = List.generate(
    3,
    (index) => TextEditingController(),
  );

  var dataList = [
    ['or', "Don't have an account?", ' Sign up'],
    ['or continue with', 'Already have an account?', ' Sign in']
  ];
  Widget selectView(type) {
    switch (type) {
      case ViewType.loginView:
        return _buildLoginViewArea(context);
      case ViewType.signUpView:
        return _buildSignUpViewArea(context);
      default:
        return _buildAccountSelectionViewArea(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Login and sign in view',
      mixed: true,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: 95 * context.h,
              child: ValueListenableBuilder(
                valueListenable: viewNotifier,
                builder: (context, viewType, _) {
                  return Stack(
                    children: [
                      Stack(
                        children: [
                          Visibility(
                            visible: viewType != ViewType.onBoardView,
                            child: Padding(
                              padding: EdgeInsets.only(left: $style.insets.xs),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  ///Roll back to initial view
                                  viewNotifier.value = ViewType.onBoardView;
                                  axisYController.value = 70;
                                },
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 600),
                            transitionBuilder: (child, animation) =>
                                FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                            child: selectView(viewType),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Semantics _buildForgotPwdButton(
      ViewType viewType, double shortWidth, BuildContext context) {
    return Semantics(
      button: true,
      label: 'Navigating into forgot password screen',
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity:
            viewType == ViewType.onBoardView || viewType == ViewType.signUpView
                ? 0
                : 1,
        child: TextButton(
          onPressed: viewType == ViewType.onBoardView ||
                  viewType == ViewType.signUpView
              ? null
              : () {
                  context.go(ScreenPath.forgotPassword());
                },
          child: Text(
            'Forgot the Password?',
            style: $style.text.textBold14.copyWith(
              color: context.theme.shareinfoBlue,
            ),
          ),
        ),
      ),
    );
  }

  Semantics _buildTextButton(
      double shortWidth, ViewType viewType, BuildContext context) {
    return Semantics(
      button: true,
      label: 'Text button',
      child: GestureDetector(
        onTap: () {
          _debounceBtn.call(
            () {
              if (viewType == ViewType.onBoardView) {
                axisYController.value = 47;
                viewNotifier.value = ViewType.signUpView;
              } else if (viewType == ViewType.loginView) {
                viewNotifier.value = ViewType.signUpView;
              } else {
                viewNotifier.value = ViewType.loginView;
              }
            },
          );
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: viewType == ViewType.onBoardView ||
                        viewType == ViewType.loginView
                    ? dataList[0][1]
                    : dataList[1][1],
                style: $style.text.textSBold12.copyWith(
                  color: context.theme.shareinfoGrey,
                  fontFamily: 'Nunito',
                ),
              ),

              ///change button name depending on its view
              TextSpan(
                text: viewType == ViewType.onBoardView ||
                        viewType == ViewType.loginView
                    ? dataList[0][2]
                    : dataList[1][2],
                style: $style.text.textBold14.copyWith(
                  color: context.theme.shareinfoBlue,
                  fontFamily: 'Nunito',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Semantics _buildButton(double shortWidth, ViewType viewType) {
    final inset = $style.insets;
    return Semantics(
      button: true,
      label: 'Button to navigate different screen',
      child: ValueListenableBuilder(
        valueListenable: axisYController,
        builder: (context, axis, _) {
          return AnimatedContainer(
            alignment: Alignment(0, shortWidth * axis * context.h),
            padding: EdgeInsets.symmetric(horizontal: inset.xl),
            duration: const Duration(milliseconds: 550),
            child: BlocConsumer<LoginCubit, LoginState>(
              listenWhen: (previous, current) =>
                  previous.isLoading || previous.isSigningUp,
              listener: (context, state) {
                state.maybeWhen(
                  //Navigate to home screen when auth success
                  authorized: () {
                    TextInput.finishAutofillContext();
                    context.go(ScreenPath.home);
                  },

                  ///Navigate to otp verification screen
                  signUpSuccess: () =>
                      context.go(ScreenPath.verifyOtp(), extra: {
                    'email': signUpController[0].text.trim(),
                    'phone_no': signUpController[1].text.trim(),
                    'first_name': signUpController[2].text.trim(),
                  }),
                  //state is auth exception
                  ///Redirect to pre profile screen
                  redirectToPreProfile: () =>
                      context.go(ScreenPath.appendWithSignUp),
                  authError: (e) => ScaffoldMessenger.of(context).showSnackBar(
                    showSnackBar(
                      e.errorDescription,
                    ),
                  ),

                  //Nothing todo
                  orElse: () => null,
                );
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  ///Checking state is login or signingUp
                  isLoading: state.isLoading || state.isSigningUp,
                  key: UniqueKey(),
                  buttonName: viewType == ViewType.onBoardView
                      ? "Continue As an Aspirant"
                      : viewType == ViewType.loginView
                          ? 'Sign in'
                          : 'Verify',
                  backgroundColor: context.theme.shareinfoBlue,
                  width: ElevatedButtonWidth.custom,
                  onPressed: () async {
                    if (state.isLoading || state.isSigningUp) {
                      return;
                    }

                    //Trigger to move button to up
                    if (viewType == ViewType.onBoardView) {
                      viewNotifier.value = ViewType.loginView;
                      axisYController.value = 47;
                    } else if (viewType == ViewType.loginView) {
                      ///Login event
                      ///Validating login textfield
                      if (_formKey[0].currentState!.validate()) {
                        context.read<LoginCubit>().login(
                              loginController[0].text.trim(),
                              loginController[1].text.trim(),
                            );
                      }
                    } else {
                      /// Sign up event
                      /// Validating text field
                      if (_formKey[1].currentState!.validate()) {
                        context.read<LoginCubit>().signUp(
                              signUpController[0].text.trim(),
                              signUpController[1].text.trim(),
                              signUpController[2].text.trim(),
                            );
                      }
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Login
  Form _buildLoginViewArea(BuildContext context) {
    final inset = $style.insets;
    return Form(
      key: _formKey[0],
      child: AutofillGroup(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Build Logo
            Semantics(
              readOnly: true,
              image: true,
              label: 'Shareinfo logo',
              child: buildShareInfoLogo(context),
            ),
            Padding(
              padding: EdgeInsets.all(inset.sm),
              child: Text(
                'Login to your Account',
                textScaler: const TextScaler.linear(1),
                overflow: TextOverflow.ellipsis,
                style: $style.text.textBold20.copyWith(
                  color: context.theme.imiotDarkPurple,
                ),
              ),
            ),
            Semantics(
              textField: true,
              label: 'Email field',
              child: AuthTextFieldWidget(
                controller: loginController[0],
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
                autoFillHints: const [AutofillHints.username],
              ),
            ),
            Gap(inset.xs),
            Semantics(
              textField: true,
              label: 'Password field',
              child: ValueListenableBuilder(
                valueListenable: visibilityNotifier,
                builder: (context, visible, _) {
                  return AuthTextFieldWidget(
                    obscureText: visible,
                    autoFillHints: const [AutofillHints.password],
                    controller: loginController[1],
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility_off),
                    onSuffixTap: () {
                      visibilityNotifier.value = !visible;
                    },
                    validator: (value) {
                      if (loginController.isAllEmpty()) {
                        return ''.fieldNotEmpty;
                      }
                      if (loginController.isItemEmpty(0)) {
                        return ''.emailNotEmpty;
                      }
                      if (loginController.isItemEmpty(1)) {
                        return ''.passwordNotEmpty;
                      } else {
                        return null;
                      }
                    },
                  );
                },
              ),
            ),
            Gap(inset.lg),
            _buildButton((1 / 100 * context.h), ViewType.loginView),
            Gap(inset.lg),

            ///Forgot password text
            _buildForgotPwdButton(
                ViewType.loginView, (1 / 100 * context.h), context),
            Gap(inset.lg),
            _buildTextButton(
                (1 / 100 * context.h), ViewType.loginView, context),
            Gap(inset.sm),
            GestureDetector(
              onTap: () {
                contactUs();
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Facing issue while Creating Account? ',
                      style: $style.text.textSBold10.copyWith(
                        color: context.theme.shareinfoGrey,
                        fontFamily: 'Nunito',
                      ),
                    ),

                    ///change button name depending on its view
                    TextSpan(
                      text: '\nContact us!',
                      style: $style.text.textBold10.copyWith(
                        color: context.theme.shareinfoBlue,
                        fontFamily: 'Nunito',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Sign up
  Form _buildSignUpViewArea(BuildContext context) {
    final inset = $style.insets;
    return Form(
      key: _formKey[1],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Build Logo
          Semantics(
            readOnly: true,
            image: true,
            label: 'Shareinfo logo',
            child: buildShareInfoLogo(context),
          ),
          Padding(
            padding: EdgeInsets.all(inset.sm),
            child: Text(
              'Create New Account',
              textScaler: const TextScaler.linear(1),
              overflow: TextOverflow.ellipsis,
              style: $style.text.textBold26.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
          ),
          Semantics(
            textField: true,
            label: 'Email field',
            child: AuthTextFieldWidget(
              keyboardType: TextInputType.emailAddress,
              controller: signUpController[0],
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email),
            ),
          ),
          Gap(inset.xs),
          Semantics(
            textField: true,
            label: 'First name',
            child: AuthTextFieldWidget(
              controller: signUpController[2],
              hintText: 'Username',
              prefixIcon: const Icon(Icons.person),
            ),
          ),
          Gap(inset.xs),

          Semantics(
            textField: true,
            label: 'Phone Number field',
            child: AuthTextFieldWidget(
              keyboardType: TextInputType.phone,
              controller: signUpController[1],
              inputFormatter: [LengthLimitingTextInputFormatter(10)],
              hintText: 'Mobile Number',
              prefixIcon: const Icon(Icons.phone_android),
              validator: (value) {
                if (signUpController.isAllEmpty()) {
                  return ''.fieldNotEmpty;
                } else if (signUpController.isItemEmpty(0)) {
                  return ''.emailNotEmpty;
                } else if (signUpController.isItemEmpty(1)) {
                  return ''.phoneNumberNotEmpty;
                } else if (signUpController.isItemEmpty(2)) {
                  return 'Username is Required';
                }
                if (signUpController.isValidEmailAt(0)) {
                  return 'Enter valid email address';
                }
                if (signUpController.isValidPhoneAt(1)) {
                  return 'Enter valid phone number';
                } else {
                  return null;
                }
              },
            ),
          ),
          Gap(inset.xs),
          Text(
            "We will send a verification code into the \nMail ID & Phone Number",
            textAlign: TextAlign.center,
            textScaler: const TextScaler.linear(1),
            style: $style.text.textSBold12.copyWith(
              color: context.theme.shareinfoGrey,
            ),
          ),
          Gap(inset.lg),
          _buildButton((1 / 100 * context.h), ViewType.signUpView),
          Gap(inset.lg),
          _buildTextButton((1 / 100 * context.h), ViewType.signUpView, context),
          Gap(inset.sm),
          GestureDetector(
            onTap: () {
              contactUs();
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Facing issue while Creating Account? ',
                    style: $style.text.textSBold10.copyWith(
                      color: context.theme.shareinfoGrey,
                      fontFamily: 'Nunito',
                    ),
                  ),

                  ///change button name depending on its view
                  TextSpan(
                    text: '\nContact us!',
                    style: $style.text.textBold10.copyWith(
                      color: context.theme.shareinfoBlue,
                      fontFamily: 'Nunito',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildAccountSelectionViewArea(BuildContext context) {
    final inset = $style.insets;
    return Column(
      key: _formKey[2],
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Semantics(
          readOnly: true,
          image: true,
          label: 'Shareinfo logo',
          child: buildShareInfoLogo(context),
        ),
        Semantics(
          readOnly: true,
          image: true,
          label: 'Animated image',
          child: SizedBox(
            width: 45 * context.w,
            height: 25 * context.h,
            child: Lottie.asset('assets/anim/onboard_animation.json'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: inset.xs),
          child: Text(
            'Let’s you in',
            textScaler: const TextScaler.linear(1),
            overflow: TextOverflow.ellipsis,
            style: $style.text.textBold30.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
        ),
        Text(
          'Next Era of Placements !',
          textScaler: const TextScaler.linear(1),
          overflow: TextOverflow.ellipsis,
          style: $style.text.textBold16.copyWith(
            color: context.theme.imiotDarkPurple,
          ),
        ),
        Gap(inset.lg),
        _buildButton((1 / 100 * context.h), ViewType.onBoardView),
        Gap(inset.lg),
      ],
    );
  }
}
