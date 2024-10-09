import 'package:go_router/go_router.dart';
import 'package:shareinfo/domain/auth/model/institute_list_model/institute_list_model/institute_list_model.dart';
import 'package:shareinfo/presentation/authentication/screens/Aspirations_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/create_pwd_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/expertise_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/institute_selection_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/otp_option_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/email_verify_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/forgot_otp_verification_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/pwd_confirmation_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/sign_up_otp_verification_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/status_chosen_screen.dart';
import 'package:shareinfo/presentation/authentication/screens/student_verification_screen.dart';
import 'package:shareinfo/router/router.dart';

List<RouteBase> get authRouter {
  return [
    ///Verify Otp Screen
    AppRoute(
      'verify_otp',
      builder: (s) {
        Map<String, dynamic>? data;
        if (s.extra != null) {
          data = s.extra as Map<String, dynamic>;
        }
        return ScreenSignUpOtpVerification(
          dataMap: data ?? {'email': tempEmail},
        );
      },
      routes: [
        ///New Password confirmation
        AppRoute(
          'confirm_password',
          builder: (s) => ScreenCreatePassword(),
        ),
      ],
    ),

    ///Candidate status
    AppRoute(
      'candidate_status',
      builder: (s) {
        return ScreenStatusSelection();
      },
      routes: [
        //Expertise
        AppRoute(
          'expertise',
          builder: (s) {
            return ScreenExpertise();
          },
          routes: [
            //Aspiration
            AppRoute(
              'aspirations',
              builder: (s) {
                return ScreenAspirations();
              },
              routes: [
                //Institute selection
                AppRoute(
                  'institute',
                  builder: (s) {
                    return const ScreenInstitutionSelection();
                  },
                  routes: [
                    //Student verification
                    AppRoute(
                      'student_verification',
                      builder: (s) {
                        InstituteListModel model = InstituteListModel();
                        if (s.extra != null) {
                          model = s.extra as InstituteListModel;
                        }
                        return ScreenStudentVerification(
                          instituteModel: model,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    ///Forgot password
    AppRoute(
      'forgot_password',
      builder: (s) => ScreenForgotPasswordOption(),
      routes: [
        ///Verify contact Screen
        AppRoute(
          'verify_contact',
          builder: (s) => ScreenContactVerification(),
          routes: [
            ///Verify Otp Screen
            AppRoute(
              'verify_otp',
              builder: (s) {
                String? email;
                if (s.extra != null) {
                  email = s.extra as String;
                }
                return ScreenOTPVerification(email: email ?? tempEmail);
              },
            ),

            ///Password confirmation
            AppRoute(
              'confirm_password',
              builder: (s) {
                String? email;

                ///Getting email from otp verification screen
                if (s.extra != null) {
                  email = s.extra as String;
                }
                return ScreenPasswordConfirmation(email: email ?? '');
              },
            ),
          ],
        ),
      ],
    ),
  ];
}
