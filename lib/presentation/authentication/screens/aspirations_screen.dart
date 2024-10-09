import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/application/auth/aspiration_list_cubit/aspiration_list_cubit.dart';
import 'package:shareinfo/application/auth/profile_submission_cubit/profile_submission_cubit.dart';
import 'package:shareinfo/domain/auth/model/aspirational_list_model/aspirational_list_model.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'institute_selection_screen.dart';

class ItemModel {
  String title;
  int id;
  ValueNotifier<bool> isSelected;
  ItemModel(this.title, this.isSelected, this.id);
}

class ScreenAspirations extends StatelessWidget {
  ScreenAspirations({super.key});

  static late List<ItemModel> itemController;

  ///get list of selected item ID
  static List<int> get selectedItems {
    return itemController
        .where((i) => i.isSelected.value)
        .map(
          (e) => e.id,
        )
        .toList();
  }

  final searchController = generateTextController();
  final debouncer = Debouncer(const Duration(milliseconds: 500));
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<AspirationListCubit>().getAspirationalFields(),
    );
    return Scaffold(
      appBar: buildCustomAppBar(context, title: "", enableSuffixIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: $style.insets.lg,
            right: $style.insets.lg,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'What is your Interest ?',
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: $style.text.textBold30.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
                Text(
                  'Please select your field of Interest',
                  textAlign: TextAlign.center,
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textSBold12.copyWith(
                    color: context.theme.shareinfoGrey,
                  ),
                ),
                Gap(inset.sm),
                // SizedBox(
                //   width: 300,
                //   child: Divider(color: context.theme.shareinfoGreyLite),
                // ),
                _buildTextField(context),
                Gap(inset.lg),
                BlocBuilder<AspirationListCubit, AspirationListState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      error: (e) => NetWorkError(
                        onRefresh: () {
                          context
                              .read<AspirationListCubit>()
                              .getAspirationalFields();
                        },
                      ),

                      ///Fetching list
                      fetchingAspirationField: () =>
                          const CustomCircularProgressIndicator(),

                      ///return aspiration widget if state is Success
                      fetchingSuccess: (aspirationList) =>
                          _buildAspirationField(context, aspirationList),
                      notFound: () => NotFound(
                        onRefresh: () {
                          searchController.clear();
                          context
                              .read<AspirationListCubit>()
                              .getAspirationalFields();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<ProfileSubmissionCubit, ProfileSubmissionState>(
        listener: (context, state) {
          if (state.isSubmitted) {
            return context.go(ScreenPath.home);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: customPaddingBottom(),
            child: CustomElevatedButton(
              isLoading: state.isSubmitting,
              buttonName: 'Continue',
              width: ElevatedButtonWidth.large,
              onPressed: () {
                ///preventing user does not choosing expertise
                if (selectedItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      showSnackBar('Please fill your aspirational field'));
                  return;
                }

                ///Adding aspirationalFields value into pre profile model
                preProfileModel.aspirationalFields = selectedItems;

                ///Navigating different function depending on user type
                ///if user type is student navigating student verification screen
                if (preProfileModel.currentStatus == 'Student') {
                  context.go(ScreenPath.institute());
                }
                //Navigate to home screen
                //completing Pre-profile stage
                else {
                  //calling pre-profile api
                  context.read<ProfileSubmissionCubit>().submitProfile(
                        preProfileModel,
                        isStudent: false,
                      );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildAspirationField(
      BuildContext context, List<AspirationalListModel> items) {
    itemController = List.generate(
      items.length,
      (index) => ItemModel(
        items[index].aspirationalField ?? 'N/A',
        ValueNotifier<bool>(false),
        items[index].id ?? -1,
      ),
    );
    return Column(
      children: [
        for (int index = 0; index < items.length; index++)
          _buildAspirationCheckBox(context, items: items, index: index)
      ],
    );
  }

  Container _buildAspirationCheckBox(
    BuildContext context, {
    required List<AspirationalListModel> items,
    required int index,
  }) {
    final inset = $style.insets;
    return Container(
      margin: EdgeInsets.only(bottom: inset.md),
      padding: EdgeInsets.all(inset.xxs + 1),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.theme.shareinfoGrey,
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: context.theme.shareinfoGreyLite,
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
        borderRadius: BorderRadius.circular(inset.md),
        border: Border.all(color: context.theme.shareinfoGreyLite),
        color: context.theme.shareinfoWhite,
      ),
      child: ValueListenableBuilder(
        ///Checkbox item controller
        valueListenable: itemController[index].isSelected,
        builder: (context, isSelected, _) {
          return CheckboxListTile(
            checkColor: context.theme.shareinfoWhite,
            activeColor: context.theme.shareinfoGrey,
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            value: isSelected,
            onChanged: (value) {
              itemController[index].isSelected.value = value!;
            },
            contentPadding: EdgeInsets.only(left: inset.sm, right: inset.sm),
            title: Text(
              items[index].aspirationalField ?? 'N/A',
              textScaler: const TextScaler.linear(1),
              style: $style.text.textSBold14
                  .copyWith(color: context.theme.imiotDarkPurple),
              textAlign: TextAlign.start,
            ),
          );
        },
      ),
    );
  }

  TextField _buildTextField(
    BuildContext context,
  ) {
    final inset = $style.insets;
    return TextField(
      style: $style.text.textBold14.copyWith(
        color: context.theme.imiotDarkPurple,
      ),
      onChanged: (value) {
        debouncer.call(() {
          context.read<AspirationListCubit>().searchAspiration(value.trim());
        });
      },
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
        ),
        isDense: true,
        fillColor: const Color.fromARGB(255, 230, 226, 226),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(inset.sm),
          borderSide: BorderSide.none,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(inset.sm),
        ),
        hintText: 'Search',
        prefixIconColor: context.theme.shareinfoGrey,
        hintStyle: $style.text.textBold14.copyWith(
          overflow: TextOverflow.ellipsis,
          color: context.theme.shareinfoGrey,
        ),
      ),
    );
  }
}
