import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
// import 'package:shareinfo/presentation/core/extension.dart';
// import 'package:shareinfo/presentation/root_widget.dart';

Container buildShareInfoLogo(BuildContext context) {
  // const kInnerDecoration =
  //     ShapeDecoration(color: Colors.white, shape: StadiumBorder());

  // const kGradientBoxDecoration = ShapeDecoration(
  //   gradient: LinearGradient(
  //     colors: [
  //       Color.fromARGB(255, 248, 91, 18),
  //       Color.fromARGB(255, 18, 34, 121),
  //     ],
  //   ),
  //   shape: StadiumBorder(),
  // );
  // final shortHeight = (1 / 20.h);
  // final shortWidth = (1 / 70.w);
  return Container(
    width: 300,
    height: 100,
    alignment: Alignment.topCenter,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          ImagePaths.shareInfoLogo2,
          width: 70 * context.w,
        ),
        // Align(
        //   alignment: Alignment(shortWidth * 55.w, shortHeight * 10.h),
        //   child: RichText(
        //     text: TextSpan(
        //       children: [
        //         TextSpan(
        //           text: "for",
        //           style: $style.txtStyle.labelSBold12.copyWith(
        //             color: context.txtTheme.titleLarge!.color,
        //           ),
        //         ),
        //         TextSpan(
        //           text: " Practice",
        //           style: $style.txtStyle.labelBold13.copyWith(
        //             color: context.txtTheme.labelLarge!.color,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // Align(
        //   alignment: Alignment(shortWidth * 55.w, -shortHeight * 13.h),
        //   child: Container(
        //     decoration: kGradientBoxDecoration,
        //     child: Padding(
        //       padding: const EdgeInsets.all(1.5),
        //       child: Container(
        //         padding: const EdgeInsets.symmetric(horizontal: 5),
        //         decoration: kInnerDecoration,
        //         child: ShaderMask(
        //           blendMode: BlendMode.srcIn,
        //           shaderCallback: (bounds) => const LinearGradient(
        //             colors: [
        //               Color.fromARGB(255, 248, 91, 18),
        //               Color.fromARGB(255, 18, 34, 121),
        //             ],
        //           ).createShader(
        //             Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        //           ),
        //           child: const Text(
        //             'Beta',
        //             textScaler: TextScaler.linear(1),
        //             style: TextStyle(
        //               fontSize: 13,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
