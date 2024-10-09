import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/custom_chip_container_widget.dart';

class ScrollableTabBarWidget extends StatelessWidget {
  ScrollableTabBarWidget({
    super.key,
    required this.jobDescriptionList,
    required this.qualificationList,
    required this.benefitsList,
    required this.skillList,
    this.jobLevel,
    this.jobCategory,
    this.educational,
    this.experience,
    this.vacancy,
    this.referencedWebsite,
    this.cgpa,
    this.backlogs,
    this.domain,
    this.supportMail,
    this.isCampus = false,
    this.companyWebsite,
    required this.qualificationListStudent,
  });

  final List<String> jobDescriptionList;
  final List<String> qualificationList;
  final List<String> qualificationListStudent;
  final List<String> benefitsList;
  final List<String> skillList;
  final String? jobLevel;
  final String? jobCategory;
  final String? educational;
  final String? experience;
  final int? vacancy;
  final String? companyWebsite;
  final String? referencedWebsite;
  final double? cgpa;
  final int? backlogs;
  final String? domain;
  final String? supportMail;
  final bool? isCampus;

  final tabItemOpen = [
    "Job Description",
    "Minimum Qualifications",
    "Perks & Benefits",
    "Required Skills",
    "Job Summary",
  ];

  final tabItemCampus = [
    "Job Description",
    "Minimum Qualifications",
    "Perks & Benefits",
    "Required Skills",
    "Must Have Qualifications",
    "Job Summary",
  ];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    final inset = $style.insets;
    Map<String, List<String>> data = {
      "Job Description": jobDescriptionList,
      "Minimum Qualifications":
          isCampus! ? qualificationListStudent : qualificationList,
      "Perks & Benefits": benefitsList,
      "Required Skills": skillList,
      "Must Have Qualifications": [],
    };
    final int tabLength = isCampus! ? tabItemCampus.length : tabItemOpen.length;
    final List<String> tabTitleList = isCampus! ? tabItemCampus : tabItemOpen;
    return ScrollableListTabScroller(
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: isCampus! ? tabItemCampus.length : tabItemOpen.length,
      animationDuration: const Duration(milliseconds: 450),
      tabBuilder: (BuildContext context, int index, bool active) => Container(
        padding: EdgeInsets.only(
          left: index != 0 ? inset.lg : 0,
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: index == 0 ? inset.lg : 0,
          right: index == tabLength - 1 ? inset.lg : 0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.theme.shareinfoGreyLite,
            ),
          ),
        ),

        ///Active and inactive bar
        child: Stack(
          children: [
            Text(
              tabTitleList[index],
              textScaler: const TextScaler.linear(1),
              style: !active
                  ? $style.text.textBold14.copyWith(
                      color: context.theme.shareinfoTextDark, height: 2)
                  : $style.text.textBold14.copyWith(
                      color: context.theme.shareinfoMidBlue,
                      height: 2,
                    ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 2,
                decoration: active
                    ? ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: context.theme.shareinfoBlue,
                      )
                    : const BoxDecoration(),
              ),
            )
          ],
        ),
      ),
      itemBuilder: (BuildContext context, int index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Tab title
          Padding(
            padding: EdgeInsets.only(
              left: inset.lg,
              top: inset.sm,
            ),
            child: Text(
              '${tabTitleList[index]}:',
              style: $style.text.textBold14.copyWith(
                color: context.theme.shareinfoGrey,
              ),
            ),
          ),
          //Required skill boundary
          if (tabTitleList[index] == "Required Skills")
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: inset.xl, vertical: inset.xs),
              child: Wrap(
                runSpacing: inset.xs,
                spacing: inset.xs,
                children: data.values.elementAt(index).map((value) {
                  return CustomChip(label: value.toTitleCase());
                }).toList(),
              ),
            )

          //Required Qualification
          else if (tabTitleList[index] == "Must Have Qualifications" &&
              isCampus!)
            Column(
              children: [
                buildSummaryItem(
                  context,
                  topLabel1: 'CGPA Required',
                  bottomLabel1: '${cgpa ?? 'N/A'}',
                  topLabel2: 'Backlogs Allowed',
                  bottomLabel2: "$backlogs",
                ),
              ],
            )

          //Job summary boundary
          else if (tabTitleList[index] == "Job Summary")
            isCampus!
                ? buildCampusJobSummary(
                    context,
                    jobLevel: jobLevel,
                    jobCategory: jobCategory,
                    domain: domain,
                    education: educational,
                    vacancy: '$vacancy opening',
                    experience: experience,
                    supportMail: supportMail,
                    website: companyWebsite,
                  )
                : buildOpenJobSummary(
                    context,
                    jobLevel: jobLevel,
                    jobCategory: jobCategory,
                    vacancy: '$vacancy opening',
                    website: referencedWebsite,
                    educational: educational,
                    experience: experience,
                  )

          ///Bullet list
          else
            ...data.values.elementAt(index).map(
              (value) {
                return Container(
                  padding: EdgeInsets.only(
                    left: inset.xl,
                    right: inset.md,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\u2022",
                        style: $style.text.textSBold12.copyWith(
                          color: context.theme.imiotDarkPurple,
                        ),
                      ),
                      Gap(inset.xs),
                      Expanded(
                        child: Text(
                          value,
                          style: $style.text.textSBold12.copyWith(
                            color: context.theme.imiotDarkPurple,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class NonScrollableTabBarWidget extends StatelessWidget {
  NonScrollableTabBarWidget({
    super.key,
    required this.jobDescriptionList,
    required this.qualificationList,
    required this.benefitsList,
    required this.skillList,
    this.jobLevel,
    this.jobCategory,
    this.educational,
    this.experience,
    this.vacancy,
    this.referencedWebsite,
    this.cgpa,
    this.backlogs,
    this.domain,
    this.supportMail,
    this.isCampus = false,
    this.companyWebsite,
    required this.qualificationListStudent,
  });

  final List<String> jobDescriptionList;
  final List<String> qualificationList;
  final List<String> qualificationListStudent;
  final List<String> benefitsList;
  final List<String> skillList;
  final String? jobLevel;
  final String? jobCategory;
  final String? educational;
  final String? experience;
  final int? vacancy;
  final String? companyWebsite;
  final String? referencedWebsite;
  final double? cgpa;
  final int? backlogs;
  final String? domain;
  final String? supportMail;
  final bool? isCampus;

  final tabItemOpen = [
    "Job Description",
    "Minimum Qualifications",
    "Perks & Benefits",
    "Required Skills",
    "Job Summary",
  ];

  final tabItemCampus = [
    "Job Description",
    "Minimum Qualifications",
    "Perks & Benefits",
    "Required Skills",
    "Must Have Qualifications",
    "Job Summary",
  ];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    final inset = $style.insets;
    Map<String, List<String>> data = {
      "Job Description": jobDescriptionList,
      "Minimum Qualifications":
          isCampus! ? qualificationListStudent : qualificationList,
      "Perks & Benefits": benefitsList,
      "Required Skills": skillList,
      "Must Have Qualifications": [],
    };
    //final int tabLength = isCampus! ? tabItemCampus.length : tabItemOpen.length;
    final List<String> tabTitleList = isCampus! ? tabItemCampus : tabItemOpen;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Divider(
        //   endIndent: inset.sm,
        //   indent: inset.sm,
        //   color: context.theme.shareinfoGreyLite,
        // ),
        for (int index = 0; index < tabTitleList.length; index++) ...[
          ///Tab title
          Padding(
            padding: EdgeInsets.only(
              left: inset.lg,
              top: inset.sm,
            ),
            child: Text(
              '${tabTitleList[index]}:',
              style: $style.text.textBold14.copyWith(
                color: context.theme.shareinfoGrey,
              ),
            ),
          ),
          //Required skill boundary
          if (tabTitleList[index] == "Required Skills")
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: inset.xl, vertical: inset.xs),
              child: Wrap(
                runSpacing: inset.xs,
                spacing: inset.xs,
                children: data.values.elementAt(index).map((value) {
                  return CustomChip(label: value.toTitleCase());
                }).toList(),
              ),
            )

          //Required Qualification
          else if (tabTitleList[index] == "Must Have Qualifications" &&
              isCampus!)
            Column(
              children: [
                buildSummaryItem(
                  context,
                  topLabel1: 'CGPA Required',
                  bottomLabel1: '${cgpa ?? 'N/A'}',
                  topLabel2: 'Backlogs Allowed',
                  bottomLabel2: "$backlogs",
                ),
              ],
            )

          //Job summary boundary
          else if (tabTitleList[index] == "Job Summary")
            isCampus!
                ? buildCampusJobSummary(
                    context,
                    jobLevel: jobLevel,
                    jobCategory: jobCategory,
                    domain: domain,
                    education: educational,
                    vacancy: '$vacancy opening',
                    experience: experience,
                    supportMail: supportMail,
                    website: companyWebsite,
                  )
                : buildOpenJobSummary(
                    context,
                    jobLevel: jobLevel,
                    jobCategory: jobCategory,
                    vacancy: '$vacancy opening',
                    website: referencedWebsite,
                    educational: educational,
                    experience: experience,
                  )

          ///Bullet list
          else
            ...data.values.elementAt(index).map(
              (value) {
                return Container(
                  padding: EdgeInsets.only(
                    left: inset.xl,
                    right: inset.md,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\u2022",
                        style: $style.text.textSBold12.copyWith(
                          color: context.theme.imiotDarkPurple,
                        ),
                      ),
                      Gap(inset.xs),
                      Expanded(
                        child: Text(
                          value,
                          style: $style.text.textSBold12.copyWith(
                            color: context.theme.imiotDarkPurple,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
        ],
      ],
    );
  }
}

///Campus recruitment job summary
Column buildCampusJobSummary(
  BuildContext context, {
  String? jobLevel,
  String? jobCategory,
  String? domain,
  String? education,
  String? vacancy,
  String? experience,
  String? supportMail,
  String? website,
}) {
  return Column(
    children: [
      buildSummaryItem(
        context,
        topLabel1: 'Job Level',
        bottomLabel1: jobLevel,
        topLabel2: 'Job Category',
        bottomLabel2: jobCategory,
      ),
      buildSummaryItem(
        context,
        topLabel1: 'Domain',
        bottomLabel1: domain,
        topLabel2: 'Educational',
        bottomLabel2: education,
      ),
      buildSummaryItem(
        context,
        topLabel1: 'Vacancy',
        bottomLabel1: vacancy,
        topLabel2: 'Experience',
        bottomLabel2: experience,
      ),
      buildSummaryItem(
        context,
        topLabel1: 'Support Mail',
        bottomLabel1: supportMail,
        topLabel2: 'Website',
        bottomLabel2: website,
        onTap: () {
          openWeb(website ?? '');
        },
      ),
      const Gap(20),
    ],
  );
}

///Open recruitment job summary
Column buildOpenJobSummary(
  BuildContext context, {
  String? jobLevel,
  String? jobCategory,
  String? educational,
  String? experience,
  String? vacancy,
  String? website,
}) {
  return Column(
    children: [
      buildSummaryItem(
        context,
        topLabel1: 'Job Level',
        bottomLabel1: jobLevel,
        topLabel2: 'Job Category',
        bottomLabel2: jobCategory,
      ),
      buildSummaryItem(
        context,
        topLabel1: 'Educational',
        bottomLabel1: educational,
        topLabel2: 'Experience',
        bottomLabel2: experience,
      ),
      buildSummaryItem(
        context,
        topLabel1: 'Vacancy',
        bottomLabel1: vacancy,
        topLabel2: 'Website',
        bottomLabel2: website,
        onTap: () {
          openWeb(website ?? '');
        },
      ),
      const Gap(20),
    ],
  );
}

Padding buildSummaryItem(BuildContext context,
    {String? topLabel1,
    String? bottomLabel1,
    String? topLabel2,
    String? bottomLabel2,
    Function? onTap}) {
  final inset = $style.insets;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: inset.lg, vertical: inset.xxs),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSummaryView(
          context,
          title: topLabel1,
          subTitle: bottomLabel1,
        ),
        Gap(inset.lg),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onTap != null ? onTap() : null;
            },
            child: buildSummaryView(
              context,
              title: topLabel2,
              subTitle: bottomLabel2,
            ),
          ),
        ),
      ],
    ),
  );
}

Column buildSummaryView(BuildContext context,
    {String? title, String? subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title ?? 'N/A',
        style: $style.text.textBold12.copyWith(
          color: context.theme.shareinfoBlack,
        ),
      ),
      const Gap(5),
      SizedBox(
        width: 40 * context.w,
        child: Text(
          subTitle ?? 'N/A',
          style: $style.text.textBold12.copyWith(
            color: context.theme.shareinfoMidBlue,
          ),
        ),
      ),
    ],
  );
}
