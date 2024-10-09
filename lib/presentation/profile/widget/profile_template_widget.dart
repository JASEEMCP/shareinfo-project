import 'package:shareinfo/presentation/core/common_lib.dart';

class CustomProfileTemplate extends StatelessWidget {
  const CustomProfileTemplate({
    super.key,
    this.child,
    required this.leadingIcon,
    required this.text,
    this.disablePadding = false,
    this.enableAddIcon = false,
    this.suffixIconPressed,
    required this.isEmpty,
    this.enableErrorBorder = false,
  });
  final Widget? child;
  final Widget leadingIcon;
  final String text;
  final bool? disablePadding;
  final bool? enableAddIcon;
  final Function? suffixIconPressed;
  final bool isEmpty;
  final bool? enableErrorBorder;

  @override
  Widget build(BuildContext context) {
    final insets = $style.insets;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: enableErrorBorder! ? 2.4 : 1,
          color: enableErrorBorder!
              ? const Color.fromARGB(255, 192, 78, 70)
              : context.theme.shareinfoGreyLite,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: !isEmpty
            ? [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: insets.sm,
                    //vertical: insets.xxs,
                  ),
                  child: Row(
                    children: [
                      leadingIcon,
                      Gap(insets.sm),
                      Expanded(
                        child: SizedBox(
                          width: 70 * context.w,
                          child: Text(
                            text,
                            style: $style.text.textBold14.copyWith(
                              color: context.theme.imiotDarkPurple,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: suffixIconPressed != null
                            ? () {
                                suffixIconPressed!();
                              }
                            : null,
                        icon: enableAddIcon!
                            ? Icon(
                                Icons.add,
                                color: context.theme.shareinfoLightBlue,
                              )
                            : Icon(
                                Icons.app_registration,
                                color: context.theme.shareinfoLightBlue,
                              ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: context.theme.shareinfoGreyLite,
                  endIndent: insets.sm,
                  indent: insets.sm,
                ),
                // body of the container
                Padding(
                  padding: enableAddIcon!
                      ? EdgeInsets.zero
                      : EdgeInsets.only(
                          left: insets.sm,
                          right: insets.sm,
                          bottom: insets.sm,
                        ),
                  child: child,
                ),
              ]
            : [
                Material(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(19),
                    onTap: suffixIconPressed != null
                        ? () {
                            suffixIconPressed!();
                          }
                        : () {
                            suffixIconPressed != null
                                ? suffixIconPressed!()
                                : null;
                          },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: insets.sm,
                        vertical: insets.xxs,
                      ),
                      child: Row(
                        children: [
                          leadingIcon,
                          Gap(insets.sm),
                          Expanded(
                            child: SizedBox(
                              width: 70 * context.w,
                              child: Text(
                                text,
                                style: $style.text.textBold14.copyWith(
                                    color: context.theme.imiotDarkPurple,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.add,
                              color: context.theme.shareinfoLightBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
