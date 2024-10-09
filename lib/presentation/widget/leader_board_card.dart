import 'package:shareinfo/domain/practice/models/leaderboards_model/logged_in_candidate.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';

class LeaderBoardCardWidget extends StatelessWidget {
  const LeaderBoardCardWidget({
    super.key,
    required this.onPressed,
    this.top3candidate,
    required this.leaderboardsType,
    this.noDayLeft,
  });
  final Function() onPressed;
  final String? noDayLeft;

  final String leaderboardsType;
  final List<LoggedInCandidate>? top3candidate;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final text = $style.text;

    return Container(
      decoration: applySmoothBorder(
        context,
        borderColor: context.theme.shareinfoGreyLite,
        color: context.theme.lightBlue,
      ),
      child: Column(
        children: [
          Gap(inset.sm),
          Text(
            '$leaderboardsType Leaderboards',
            style: text.textBold14.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
          noDayLeft != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ends in ',
                      style: text.textBold10.copyWith(
                        color: context.theme.shareinfoBlue,
                      ),
                    ),
                    Text(
                      '$noDayLeft Days',
                      style: text.textBold10.copyWith(
                        color: context.theme.shareinfoGreen,
                      ),
                    ),
                  ],
                )
              : const Row(),
          Gap(inset.xxs),
          if (top3candidate != null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildAvatar(context,
                      radius: 43,
                      rank: '2',
                      name: top3candidate!.length >= 2
                          ? top3candidate![1].candidateName
                          : 'N/A'),
                  _buildAvatar(context,
                      padding: EdgeInsets.all(inset.sm),
                      rank: '1',
                      name: top3candidate!.length > 1
                          ? top3candidate![0].candidateName
                          : 'N/A'),
                  _buildAvatar(context,
                      radius: 39,
                      rank: '3',
                      name: top3candidate!.length >= 3
                          ? top3candidate![2].candidateName
                          : 'N/A'),
                ],
              ),
            ),
          Gap(inset.xs),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'Click here for Detailed View !',
              style: text.textBold10.copyWith(
                color: context.theme.shareinfoGrey,
              ),
            ),
          ),
          Gap(inset.sm),
        ],
      ),
    );
  }

  Padding _buildAvatar(BuildContext context,
      {double? radius, EdgeInsets? padding, String? rank, String? name}) {
    final text = $style.text;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: [
          Text(
            '${rank}st',
            style: text.textBold10.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
          CircleAvatar(
            radius: radius ?? 50,
            backgroundColor: Colors.greenAccent,
          ),
          Text(
            name ?? 'N/A',
            style: text.textBold12.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
        ],
      ),
    );
  }
}
