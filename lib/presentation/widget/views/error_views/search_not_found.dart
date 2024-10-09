import 'package:shareinfo/presentation/core/common_lib.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({
    super.key,
    required this.content,
    this.enableSearch = true,
  });
  final String content;
  final bool? enableSearch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      child: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/gif/search_not_found.gif",
            height: 176,
            width: 200,
          ),
          Gap($style.insets.sm),
          Center(
            child: Text(
              content,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold20.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $style.insets.md),
            child: Text(
              enableSearch!
                  ? 'Sorry. the keyword you entered cannot be found. please check again or search with another keyword.'
                  : 'Refine your job hunt by keyword, location, or filter for the perfect match.',
              textScaler: const TextScaler.linear(1),
              textAlign: TextAlign.center,
              style: $style.text.textBold12.copyWith(
                color: context.theme.shareinfoTextDark,
              ),
            ),
          )
        ],
      ),
    );
  }
}
