import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/references_model/references_model.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenReference extends StatefulWidget {
  const ScreenReference({super.key, this.id});
  final int? id;

  @override
  State<ScreenReference> createState() => _ScreenReferenceState();
}

class _ScreenReferenceState extends State<ScreenReference> {
  final _formKey = generateFormKey();
  final _textController = List.generate(7, (index) => generateTextController());
  ReferencesModel model = ReferencesModel();
  @override
  void dispose() {
    _textController.clear();
    getIt<ReferencesCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context.read<ReferencesCubit>().getReferences(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess =
              context.watch<WorkExperienceCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Reference",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context.read<ReferencesCubit>().deleteReferencesInfo();
                },
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<ReferencesCubit, ReferencesState>(
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
                              .read<ReferencesCubit>()
                              .getReferences(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;

              _textController[0].text = model.name ?? '';
              _textController[1].text = model.organization ?? '';
              _textController[2].text = model.role ?? '';
              _textController[3].text = model.email ?? '';
              _textController[4].text = model.phoneNo ?? '';
              _textController[5].text = '';
              _textController[6].text = model.description ?? '';
              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[0],
                      label: 'Name',
                      hintText: 'Enter Name',
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[1],
                      label: 'Organization',
                      hintText: 'Enter Organization name',
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[2],
                      label: 'Role / Occupation',
                      hintText: 'Enter your Role here',
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[3],
                      label: "E-Mail",
                      validator: (value) {
                        if ([_textController[3]].isAnyOneEmpty()) {
                          return ''.fieldNotEmpty;
                        }
                        if ([_textController[3]].isValidEmailAt(0)) {
                          return ''.validEmail;
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter the Mail ID here",
                      prefix: const Icon(Icons.email),
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      validator: (value) {
                        if ([_textController[4]].isAnyOneEmpty()) {
                          return ''.fieldNotEmpty;
                        }
                        if ([_textController[4]].isValidPhoneAt(0)) {
                          return ''.validPhoneNumber;
                        } else {
                          return null;
                        }
                      },
                      controller: _textController[4],
                      label: "Mobile Number",
                      hintText: "+91 Enter the Number here",
                      prefix: const Icon(Icons.phone),
                    ),
                    MultiLineTextField(
                      controller: _textController[6],
                      label: 'Description (Optional)',
                      hintText:
                          'Enter a brief about the role you were done at the organization throughout the duration of your employment....',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(
          builder: (context) {
            final currentState = context.watch<ReferencesCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          name: handleEmptyString(_textController[0]),
                          organization: handleNullString(_textController[1]),
                          role: handleNullString(_textController[2]),
                          email: handleEmptyString(_textController[3])
                              ?.toLowerCase(),
                          phoneNo: handleEmptyString(_textController[4]),
                          description: handleNullString(_textController[6]),
                        );

                        context.read<ReferencesCubit>().saveReferences(
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
