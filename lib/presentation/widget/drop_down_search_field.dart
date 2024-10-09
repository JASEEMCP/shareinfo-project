import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/dropdown_menu_custom.dart';

class MenuItem {
  final int id;
  final String label;

  MenuItem(this.id, this.label);
}

class CustomDropDownSearch extends StatelessWidget {
  const CustomDropDownSearch({
    super.key,
    this.menuController,
    this.label,
    this.hintText,
    required this.menu,
    this.radius,
    required this.onSelect,
    this.enableController,
    this.validate = false,
    this.enableFilter,
    this.width,
    this.validator,
    this.enabled,
    this.onChanged,
  });

  final TextEditingController? menuController;
  final String? label;
  final String? hintText;
  final List<MenuItem> menu;
  final double? radius;
  final Function(MenuItem?) onSelect;
  final bool? enableController;
  final bool? validate;
  final bool? enableFilter;
  final double? width;
  final bool? enabled;
  final Function(String?)? onChanged;
  final Function(MenuItem?)? validator;

  bool _isValidMenuItem() {
    MenuItem menuX = menu.firstWhere(
      (menuItem) {
        return menuItem.label == menuController?.text;
      },
      orElse: () => MenuItem(-2, ''), // Returning a default invalid MenuItem
    );

    // Check if the menuX is valid by verifying if its ID is not -1
    return menuX.id != -2;
  }

  @override
  Widget build(BuildContext context) {
    final style = $style.text;
    final inset = $style.insets;

    MenuItem menuX = menu.firstWhere(
      (menuItem) {
        return menuItem.label.trim() == menuController?.text.trim();
      },
      orElse: () => MenuItem(-1, ''),
    );

    return FormField<MenuItem>(
      validator: (value) {
        if (validate! && value?.label == '') {
          return 'This field is Required';
        }
        if (!_isValidMenuItem()) {
          return 'Select valid Item';
        }
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      builder: (state) {
        /// Updating form value after controller initialized
        if (context.mounted && state.value != menuX) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              menuX = menu.firstWhere(
                (menuItem) {
                  return menuItem.label == menuController?.text;
                },
                orElse: () => MenuItem(-1, ''),
              );
              state.didChange(menuX);
            }
          });
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label != null
                ? Text(
                    label!,
                    style: style.textBold14.copyWith(
                      color: context.theme.imiotDarkPurple,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : const SizedBox.shrink(),
            Gap(inset.xxs),
            CustomDropdownMenu<MenuItem>(
              onChanged: onChanged,
              enabled: enabled ?? true,
              curserColor: context.theme.shareinfoMidBlue,
              textStyle: $style.text.textBold12.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
              initialSelection: null,
              controller: menuController,
              expandedInsets: EdgeInsets.zero,
              width: width,
              hintText: hintText,
              requestFocusOnTap: enableController ?? true,
              enableFilter: enableFilter ?? false,
              selectedTrailingIcon: Icon(
                Icons.arrow_drop_up,
                color: context.theme.imiotDarkPurple,
                size: 30,
              ),
              menuHeight: 200,
              trailingIcon: Icon(
                Icons.arrow_drop_down_outlined,
                color: context.theme.imiotDarkPurple,
                size: 30,
              ),
              onSelected: (selectMenu) {
                state.didChange(selectMenu);
                onSelect(selectMenu);
              },
              dropdownMenuEntries:
                  menu.map<DropdownMenuEntry<MenuItem>>((MenuItem menu) {
                return DropdownMenuEntry<MenuItem>(
                  value: menu,
                  label: menu.label,
                  style: TextButton.styleFrom(
                    foregroundColor:
                        context.theme.shareinfoBlack.withOpacity(0.7),
                    textStyle: $style.text.textBold12.copyWith(),
                  ),
                );
              }).toList(),
              inputDecorationTheme: InputDecorationTheme(
                errorStyle: style.textBold10,
                suffixIconColor: context.theme.imiotDarkPurple,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: inset.lg,
                  vertical: inset.md,
                ),
                fillColor: context.theme.shareinfoWhite,
                hintStyle: style.textSBold10.copyWith(
                  color: context.theme.shareinfoGrey,
                ),
                disabledBorder: _buildInputBorder(context, radius),
                focusedErrorBorder: _buildInputBorder(context, radius),
                focusedBorder: _buildInputBorder(context, radius),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 24),
                  borderSide: BorderSide(
                    color: context.theme.shareinfoRed,
                  ),
                ),
                enabledBorder: _buildInputBorder(context, radius),
                border: _buildInputBorder(context, radius),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  state.errorText ?? 'Required',
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.shareinfoRed,
                    height: 3,
                  ),
                ),
              )
          ],
        );
      },
    );
  }

  OutlineInputBorder _buildInputBorder(BuildContext context, double? radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 14),
      borderSide: BorderSide(
        color: context.theme.shareinfoGrey.withOpacity(0.2),
      ),
    );
  }
}
