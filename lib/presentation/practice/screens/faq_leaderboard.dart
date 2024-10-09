import 'package:figma_squircle/figma_squircle.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';

class ScreenFaqLeaderboards extends StatefulWidget {
  const ScreenFaqLeaderboards({super.key});

  @override
  State<ScreenFaqLeaderboards> createState() => _ScreenFaqLeaderboardsState();
}

class _ScreenFaqLeaderboardsState extends State<ScreenFaqLeaderboards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: 'FAQ Leaderboards',
        enableSuffixIcon: false,
      ),
      body: ListView(
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            Padding(
              padding: EdgeInsets.all($style.insets.sm),
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.all(20),
                shape: SmoothRectangleBorder(
                  side: BorderSide(
                    color: context.theme.shareinfoGreyLite,
                    width: 1.3,
                  ),
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 15,
                    cornerSmoothing: 1,
                  ),
                ),
                iconColor: context.theme.shareinfoBlack,
                collapsedIconColor: context.theme.shareinfoBlack,
                trailing: const Icon(Icons.arrow_drop_down),
                collapsedShape: SmoothRectangleBorder(
                  side: BorderSide(
                    color: context.theme.shareinfoGreyLite,
                    width: 1.3,
                  ),
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 15,
                    cornerSmoothing: 1,
                  ),
                ),
                title: Text(
                  'Additional Considerations',
                  style: $style.text.textBold14.copyWith(
                    color: context.theme.shareinfoTextDark,
                  ),
                ),
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\u2022",
                        style: $style.text.textBold12.copyWith(
                          color: context.theme.shareinfoTextDark,
                        ),
                      ),
                      Gap($style.insets.xs),
                      Expanded(
                        child: Text(
                          'Helllo fjsdghfg fjhdsgfdsgjfd jfgjdsgfjdgjfsh jhgfjsd jsfg dsggh gdsghh gsdh ',
                          style: $style.text.textSBold10.copyWith(
                            color: context.theme.shareinfoTextDark,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
