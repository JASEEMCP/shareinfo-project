import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/domain/profile/model/profile_model/skill_set.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenSkills extends StatefulWidget {
  const ScreenSkills({super.key});

  @override
  State<ScreenSkills> createState() => _ScreenSkillsState();
}

class _ScreenSkillsState extends State<ScreenSkills> {
  List<SkillSet> model = [];
  final _searchController = generateTextController();
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 800));
  final Debouncer _btnDebouncer = Debouncer(const Duration(milliseconds: 200));

  @override
  void dispose() {
    _searchController.clear();
    getIt<SkillsCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<SkillsCubit>().getSkillList();
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'Skills',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: customPaddingTop(),
                  child: CustomTextFieldWidget(
                    suffix: IconButton(
                      onPressed: () {
                        if (_searchController.text.isEmpty) {
                          context.read<SkillsCubit>().refreshScreen();
                          return;
                        }
                        _searchController.clear();
                        context.read<SkillsCubit>().refreshScreen();
                      },
                      icon: const Icon(Icons.close),
                    ),
                    controller: _searchController,
                    hintText: 'Search Your Skill here..!',
                    label: 'Skills',
                    onChanged: (searchKey) {
                      _debouncer.call(
                        () {
                          ///Searching skill event
                          context.read<SkillsCubit>().searchSkill(searchKey);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          BlocConsumer<SkillsCubit, SkillsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.isLoading) {
                return const CustomCircularProgressIndicatorC();
              } else if (state.isError) {
                return NetWorkError(
                  padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                  onRefresh: () {
                    context.read<SkillsCubit>().getSkillList();
                  },
                );
              } else if (state.searchSuccess) {
                return Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: state.searchList.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async {
                          ///Add new skill event
                          context
                              .read<SkillsCubit>()
                              .addNewSkill(state.searchList[index].id!);
                          _searchController.clear();
                          FocusScope.of(context).unfocus();
                        },
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: $style.insets.lg),
                        dense: true,
                        title: Text('${state.searchList[index].skillName}'),
                      );
                    },
                  ),
                );
              }
              model = state.userModel;
              return Expanded(
                child: Padding(
                  padding: customPaddingBottom(),
                  child: ListView(
                    children: [
                      Wrap(
                        spacing: $style.insets.xs,
                        runSpacing: $style.insets.sm,
                        children: [
                          for (int index = 0; index < model.length; index++)
                            customChipWidget(
                              context,
                              skillTitle: model[index].skill ?? '',
                              onTap: () {
                                _btnDebouncer.call(() {
                                  context
                                      .read<SkillsCubit>()
                                      .deleteSkill(model[index].id!);
                                });
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
