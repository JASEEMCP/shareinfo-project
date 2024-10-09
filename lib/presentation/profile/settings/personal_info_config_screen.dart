import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shareinfo/application/settings/personal_info_cubit/personal_info_cubit.dart';
import 'package:shareinfo/core/string_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/views/error_message_view.dart';
import 'package:shareinfo/presentation/widget/views/error_views/network_error.dart';
import 'package:shareinfo/presentation/widget/views/padding.dart';

class ScreenPersonalInfoConfig extends StatefulWidget {
  const ScreenPersonalInfoConfig({super.key});

  @override
  State<ScreenPersonalInfoConfig> createState() =>
      _ScreenPersonalInfoConfigState();
}

class _ScreenPersonalInfoConfigState extends State<ScreenPersonalInfoConfig> {
  final _textController = List.generate(9, (index) => generateTextController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<PersonalInfoSettingCubit>().getPersonalInfo(),
    );
    return Scaffold(
      appBar: buildCustomAppBar(context,
          title: "Personal Information", enableSuffixIcon: false),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child:
              BlocBuilder<PersonalInfoSettingCubit, PersonalInfoSettingState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const CustomCircularProgressIndicatorC(),
                error: (e) => NetWorkError(
                  padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                  onRefresh: () {
                    context.read<PersonalInfoSettingCubit>().getPersonalInfo();
                  },
                ),
                success: (model) {
                  _textController[0].text = model.firstName ?? '';
                  _textController[1].text = model.middleName ?? '';
                  _textController[2].text = model.lastName ?? '';
                  _textController[3].text =
                      (Date.ddmmy(model.dob).toDashSeparator) ?? '';
                  _textController[4].text = model.gender ?? '';
                  _textController[5].text = model.email ?? '';
                  _textController[6].text = model.phoneNo ?? '';
                  _textController[7].text = model.state ?? '';
                  _textController[8].text = model.currentPosition ?? '';
                  return ListView(
                    children: [
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: 'First Name',
                        hintText: "First Name",
                        controller: _textController[0],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: "Middle Name",
                        hintText: "Middle Name",
                        controller: _textController[1],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: "Last Name",
                        hintText: "Last Name",
                        controller: _textController[2],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: "Birth Date",
                        hintText: "Birth date",
                        controller: _textController[3],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: 'Gender',
                        hintText: "Gender",
                        controller: _textController[4],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: 'Email Address',
                        hintText: "E-mail",
                        suffix: const Icon(Icons.email_rounded),
                        controller: _textController[5],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: 'Phone Number',
                        hintText: "Phone number",
                        prefix: const Icon(Icons.phone),
                        controller: _textController[6],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: 'State',
                        hintText: "State name",
                        controller: _textController[7],
                      ),
                      CustomTextFieldWidget(
                        readOnly: true,
                        label: 'Current Position',
                        hintText: "Role",
                        controller: _textController[8],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
