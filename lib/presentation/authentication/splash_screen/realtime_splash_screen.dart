import 'package:shareinfo/presentation/authentication/widget/shareinfo_logo_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenRealTimeSplash extends StatelessWidget {
  const ScreenRealTimeSplash({super.key});

  @override
  Widget build(BuildContext context) {
    //final inset = $style.inset;

    return Scaffold(
      body: Semantics(
        image: true,
        readOnly: true,
        label: 'Splash screen',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // //Build Logo
              Semantics(
                readOnly: true,
                image: true,
                label: 'Shareinfo logo',
                child: buildShareInfoLogo(context),
              ),
              // CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

class RedirectionScreen extends StatelessWidget {
  const RedirectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final inset = $style.inset;

    return Scaffold(
      body: Semantics(
        image: true,
        readOnly: true,
        label: 'Splash screen',
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // //Build Logo

              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
