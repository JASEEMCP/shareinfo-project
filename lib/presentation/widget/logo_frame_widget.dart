import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class LogoFrameWidget extends StatelessWidget {
  const LogoFrameWidget({
    super.key,
    required this.imagePath,
    required this.imageSize,
    this.radius,
  });
  final String imagePath;
  final double imageSize;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageSize,
      width: imageSize,
      padding: EdgeInsets.all($style.insets.xxs),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.theme.shareinfoWhite,
        border: Border.all(
          width: 1,
          color: context.theme.shareinfoGreyLite,
        ),
        borderRadius: BorderRadius.circular(radius ?? 12.50),
      ),
      child: !imagePath.contains('.png')
          ? Image.asset(ImagePaths.shareInfoLogo)
          : isValidUrl(
              imagePath,
            )
              ? ClipRect(
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(ImagePaths.shareInfoLogo);
                    },
                    frameBuilder: (context, child, loadingProgress, s) {
                      if (loadingProgress == null) {
                        return Image.asset(ImagePaths.shareInfoLogo);
                      }

                      return child;
                    },
                  ),
                )
              : Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
    );
  }
}
