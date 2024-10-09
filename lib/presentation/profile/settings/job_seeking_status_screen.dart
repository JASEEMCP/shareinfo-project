import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class ScreenJobSeekingStatusSetting extends StatelessWidget {
  const ScreenJobSeekingStatusSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: buildCustomAppBar(context,
          title: "Job Seeking Status", enableSuffixIcon: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: SeekingJobTileData.seekItemList.length,
                separatorBuilder: (context, index) =>
                    Divider(color: context.theme.shareinfoGreyLite),
                itemBuilder: (context, index) {
                  var item = SeekingJobTileData.seekItemList;
                  return RadioListTile(
                    activeColor: context.theme.imiotDarkPurple,
                    contentPadding: EdgeInsets.only(
                      left: inset.md,
                      right: inset.md,
                    ),
                    value: "0",
                    groupValue: "$index",
                    title: Text(
                      item[index].title,
                      style: item[index].enabled
                          ? $style.text.textBold16.copyWith(
                              color: context.theme.imiotDarkPurple,
                            )
                          : $style.text.textBold16.copyWith(
                              color: context.theme.shareinfoGrey,
                            ),
                    ),
                    subtitle: Text(
                      item[index].subTitle,
                      style: item[index].enabled
                          ? $style.text.textBold10.copyWith(
                              color: context.theme.imiotDarkPurple,
                            )
                          : $style.text.textBold10.copyWith(
                              color: context.theme.shareinfoGrey,
                            ),
                    ),
                    onChanged: item[index].enabled ? (value) {} : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeekingJobTileData {
  final String title;
  final String subTitle;
  final bool enabled;
  SeekingJobTileData(this.title, this.subTitle, this.enabled);

  static List<SeekingJobTileData> seekItemList = [
    SeekingJobTileData(
      'Actively Looking for Jobs',
      '''I’m actively looking forward for job right now, and would like to accept job invitation.''',
      true,
    ),
    SeekingJobTileData(
      'Passively Looking for Jobs',
      '''I’m not looking forward for job right now, but I’m interested to accept job invitations.''',
      false,
    ),
    SeekingJobTileData(
      'Not Looking for Jobs',
      '''I’m not looking forward for job right now, please be don’t send me job invitations.''',
      false,
    )
  ];
}
