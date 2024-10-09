import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class EventListCardWidget extends StatelessWidget {
  const EventListCardWidget({
    super.key,
    required this.model,
    required this.index,
  });
  final List<HappeningModel> model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;

    return Container(
      decoration: BoxDecoration(
        color: context.theme.lightBlue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15 + inset.sm),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15 + inset.sm),
          onTap: () {
            if (model[index].isExpired ?? false) {
              context
                  .go('/happenings/occurred_detail/${model[index].eventId!}');
            } else {
              context
                  .go('/happenings/happening_detail/${model[index].eventId!}');
            }
          },
          child: Container(
            padding: EdgeInsets.only(
              left: inset.md,
              right: inset.md,
              top: inset.md,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15 + inset.sm),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: context.w * 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    model[index].bannerImage ?? '',
                    fit: BoxFit.cover,
                    height: 160,
                    width: context.w * 100,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.grey.shade600,
                        ),
                      );
                    },
                    frameBuilder: (context, child, loadingProgress, s) {
                      if (loadingProgress == null) {
                        return Center(
                          child: Icon(
                            Icons.image,
                            size: 30,
                            color: Colors.grey.shade600,
                          ),
                        );
                      }
                      return child;
                    },
                  ),
                ),
                Gap(inset.sm),
                Text(
                  model[index].title ?? 'N/A',
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: $style.text.textBold16.copyWith(
                    color: context.theme.shareinfoBlue,
                    height: 1.2,
                  ),
                ),
                Gap(inset.xs),
                Row(
                  children: [
                    /// Organizer picture
                    ClipRRect(
                      child: Container(
                        height: 40,
                        width: 40,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          model[index].organizerImage ?? '',
                          fit: BoxFit.cover,
                          height: 145,
                          width: context.w * 100,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.grey.shade600,
                              ),
                            );
                          },
                          frameBuilder: (context, child, loadingProgress, s) {
                            if (loadingProgress == null) {
                              return Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade600,
                                ),
                              );
                            }
                            return child;
                          },
                        ),
                      ),
                    ),
                    Gap(inset.xxs),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model[index].organizerName ?? 'N/A',
                            textScaler: const TextScaler.linear(1),
                            maxLines: 1,
                            style: $style.text.textBold12.copyWith(
                              color: context.theme.shareinfoBlack,
                            ),
                          ),
                          Text(
                            "${model[index].organizerRole} ${model[index].organizerCompany}",
                            textScaler: const TextScaler.linear(1),
                            maxLines: 2,
                            style: $style.text.textBold12.copyWith(
                              color: context.theme.shareinfoGrey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
