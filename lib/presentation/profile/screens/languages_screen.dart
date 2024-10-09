import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/profile_model/language_set.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/drop_down_search_field.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenLanguage extends StatefulWidget {
  final int? id;
  const ScreenLanguage({super.key, this.id});

  @override
  State<ScreenLanguage> createState() => _ScreenLanguageState();
}

class _ScreenLanguageState extends State<ScreenLanguage> {
  final _formKey = generateFormKey();
  LanguageSet model = LanguageSet();
  final _textController = List.generate(2, (index) => generateTextController());

  @override
  void dispose() {
    getIt<LanguageCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.id != null) {
          context.read<LanguageCubit>().getLanguageInfo(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess = context.watch<LanguageCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Languages",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () async {
              context.deleteWarningMessage(
                () async {
                  await context.read<LanguageCubit>().deleteLanguage();
                },
              );
            },
          );
        }),
      ),
      body: Padding(
        padding: customPaddingBottom(),
        child: BlocConsumer<LanguageCubit, LanguageState>(
          listener: (context, state) {
            //show success message for  user is edited their profile
            if (widget.id != null && state.saveSuccess) {
              context.showCustomSnackbarAtTop();
              return;
              //navigate profile page user is add new profile row
            } else if (widget.id == null && state.saveSuccess) {
              return context.pop();
            } else {
              //navigate profile page if user is delete a row
              if (state.deleteSuccess) return context.pop();
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const CustomCircularProgressIndicatorC();
            } else if (state.isError) {
              return NetWorkError(
                padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                onRefresh: widget.id != null
                    ? () {
                        context
                            .read<LanguageCubit>()
                            .getLanguageInfo(widget.id!);
                      }
                    : null,
              );
            }
            model = state.userModel;
            _textController[0].text = model.language ?? '';
            _textController[1].text = model.proficiency ?? '';
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomDropDownSearch(
                    validate: true,
                    enableController: false,
                    menuController: _textController[0],
                    label: 'Language',
                    hintText: 'Select a Language',
                    onSelect: (value) {
                      _textController[0].text = value?.label ?? '';
                    },
                    menu: [
                      MenuItem(0, 'Malayalam'),
                      MenuItem(0, 'English'),
                      MenuItem(0, 'Hindi'),
                      MenuItem(0, 'Tamil'),
                    ],
                  ),
                  Gap($style.insets.md),
                  CustomDropDownSearch(
                    validate: true,
                    enableController: false,
                    menuController: _textController[1],
                    label: 'Proficiency',
                    hintText: 'Select Proficiency',
                    onSelect: (value) {
                      _textController[1].text = value?.label ?? '';
                    },
                    menu: [
                      MenuItem(0, 'Basic'),
                      MenuItem(0, 'Intermediate'),
                      MenuItem(0, 'Advanced'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(
          builder: (context) {
            final currentState = context.watch<LanguageCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = LanguageSet(
                          id: widget.id,
                          language: handleNullString(_textController[0]),
                          proficiency: handleNullString(_textController[1]),
                        );

                        context.read<LanguageCubit>().addNewLanguage(
                              model,
                              requestTypeHandleWithId(widget.id),
                            );
                      }
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
