import 'package:aurora_git/repo_list/provider/filter_repo_list_keyword_notifier.dart';
import 'package:aurora_git/repo_list/widget/repo_actions_split_button.dart';
import 'package:aurora_git/repo_list/widget/repo_list_section.dart';
import 'package:aurora_git/shared/global_variables.dart';
import 'package:aurora_git/shared/window_buttons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

class RepoListPage extends ConsumerWidget {
  const RepoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: DragToMoveArea(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Aurora Git v$packageVersion',
              style: Typography.fromBrightness(
                brightness: FluentTheme.of(context).brightness,
              ).bodyStrong,
            ),
          ),
        ),
        actions: const WindowButtons(),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            Row(
              children: [
                const RepoActionsSplitButton(),
                const SizedBox(width: 16),
                Flexible(
                  child: TextBox(
                    placeholder: 'Find a repository...',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        FluentIcons.search,
                        size: 15,
                      ),
                    ),
                    onChanged: (value) => ref
                        .read(filterRepoListKeywordNotifierProvider.notifier)
                        .keyword = value,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Expanded(
              child: RepoListSection(),
            ),
          ],
        ),
      ),
    );
  }
}
