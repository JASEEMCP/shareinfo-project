import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/domain/home/feeds_data.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class FeedDetail extends StatelessWidget {
  FeedDetail({super.key, required this.index});
  final int index;
  final feedContent = FeedModel.feedList;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        centerTitle: false,
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
      ),
      body: Hero(
        tag: 'txt_field',
        child: Material(
          child: ListView(
            padding: EdgeInsets.all(inset.sm),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey,
                      ),
                      Gap(inset.xxs),
                      SizedBox(
                        width: 200,
                        child: Text(
                          feedContent[index].userName!,
                          style: $style.text.textSBold10.copyWith(
                            color: context.theme.shareinfoMidBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      shareFeedLink();
                    },
                    icon: const Icon(Icons.share),
                  )
                ],
              ),
              Gap(inset.sm),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(feedContent[index].imagePath!),
              ),
              Gap(inset.sm),
              Text(
                feedContent[index].feedTitle!,
                style: $style.text.textSBold14.copyWith(
                  color: context.theme.shareinfoMidBlue,
                ),
              ),
              Gap(inset.sm),
              Text(
                feedContent[index].content!,
                style: $style.text.textSBold10.copyWith(
                  color: context.theme.shareinfoTextDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
