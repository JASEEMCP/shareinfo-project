import 'dart:math';

import 'package:shareinfo/domain/home/feeds_data.dart';
import 'package:shareinfo/presentation/home/feeds/screens/feed_detail.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenShareInfoFeed extends StatelessWidget {
  ScreenShareInfoFeed({super.key});

  final tabName = [
    'Placements',
    'Coding',
    'Aptitude',
    'Training Courses',
    'Current Affairs'
  ];
  final feedContent = FeedModel.feedList;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: false,
          titleSpacing: 0,
          //Search Field
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Feeds by',
                textScaler: const TextScaler.linear(1),
                style: $style.text.textBold10.copyWith(
                  color: context.theme.shareinfoMidBlue,
                ),
              ),
              Text(
                'ShareInfo',
                textScaler: const TextScaler.linear(1),
                style: $style.text.textBold12.copyWith(
                  color: context.theme.shareinfoOrange,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(0, kToolbarHeight),
            child: Column(
              children: [
                TabBar(
                  dividerColor: Colors.transparent,
                  labelStyle: $style.text.textBold14.copyWith(
                    color: context.theme.shareinfoMidBlue,
                    fontFamily: 'Nunito',
                  ),
                  indicatorColor: Colors.transparent,
                  enableFeedback: true,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: [
                    for (var name in tabName) Tab(text: name),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TabBody(
              feedContent: feedContent,
              index: 0,
            ),
            TabBody(
              feedContent: feedContent,
              index: 1,
            ),
            TabBody(
              feedContent: feedContent,
              index: 2,
            ),
            TabBody(
              feedContent: feedContent,
              index: 3,
            ),
            TabBody(
              feedContent: feedContent,
              index: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class TabBody extends StatelessWidget {
  const TabBody({
    super.key,
    required this.feedContent,
    required this.index,
  });

  final List<FeedModel> feedContent;
  final int index;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(inset.xs),
          decoration: BoxDecoration(
            color: context.theme.shareinfoGreyLite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Hero(
                tag: 'feed_image',
                child: Material(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(feedContent[index].imagePath!),
                  ),
                ),
              ),
              Gap(inset.sm),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feedContent[index].feedTitle!,
                      style: $style.text.textSBold14.copyWith(
                        color: context.theme.shareinfoMidBlue,
                      ),
                    ),
                    Gap(inset.sm),
                    Text(
                      feedContent[index].content!,
                      maxLines: 5,
                      style: $style.text.textSBold10.copyWith(
                        color: context.theme.shareinfoTextDark,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Gap(inset.xl),
                    TextButton(
                      onPressed: () {
                        context.pushR(FeedDetail(index: index));
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          context.theme.shareinfoWhite,
                        ),
                      ),
                      child: const Text('Read More'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(inset.sm),
          child: Text(
            'Trending Feed',
            style: $style.text.textSBold14.copyWith(
              color: context.theme.shareinfoMidBlue,
            ),
          ),
        ),
        for (int index = 1; index < feedContent.length; index++)
          buildCarouselWidget(
            context,
            feedContent,
            index,
          ),
      ],
    );
  }
}

String getRandomImage() {
  final random = Random();
  var i = random.nextInt(carouselList.length);
  return carouselList[i];
}

List carouselList = [
  "assets/images/carousel_lady_1.png",
  "assets/images/carousel_lady_2.png",
  "assets/images/carousel_lady_3.png",
];
Padding buildCarouselWidget(
  BuildContext context,
  List<FeedModel> feedContent,
  int index,
) {
  final inset = $style.insets;
  return Padding(
    padding: EdgeInsets.only(
      left: inset.sm,
      right: inset.sm,
      bottom: inset.sm,
    ),
    child: Container(
      width: 100 * context.w,
      padding: EdgeInsets.only(
        top: inset.md,
        left: inset.md,
        right: inset.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(inset.md),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2b201a),
            Color(0xff8d74a5),
            Color(0xfff23500),
            Color(0xff3a0372),
          ],
        ),
      ),
      child: AnimatedSwitcher(
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        duration: $style.times.slow,
        child: Stack(
          key: UniqueKey(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  getRandomImage(),
                  fit: BoxFit.cover,
                  height: 110,
                ),
              ],
            ),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.7,
              child: Text(
                feedContent[index].feedTitle!,
                textScaler: const TextScaler.linear(1),
                maxLines: 3,
                style: $style.text.textBold12.copyWith(
                  color: context.theme.shareinfoWhite,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: inset.sm,
              child: ElevatedButton(
                onPressed: () {
                  context.pushR(FeedDetail(index: index));
                },
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(150, 25),
                  minimumSize: const Size(100, 25),
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Read More',
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textBold12.copyWith(
                    color: context.theme.imiotDarkPurple,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
