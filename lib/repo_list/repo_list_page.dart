import 'package:aurora_git/repo_list/widget/repo_actions_split_button.dart';
import 'package:aurora_git/repo_list/widget/repo_list_section.dart';
import 'package:aurora_git/shared/global_variables.dart';
import 'package:aurora_git/shared/window_buttons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class RepoListPage extends StatefulWidget {
  const RepoListPage({super.key});

  @override
  State<RepoListPage> createState() => _RepoListPageState();
}

class _RepoListPageState extends State<RepoListPage> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
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
            const Row(
              children: [
                RepoActionsSplitButton(),
                SizedBox(width: 16),
                Flexible(
                  child: TextBox(
                    placeholder: 'Find a repository...',
                    prefix: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        FluentIcons.search,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: isEmpty
                  ? Center(
                      child: Text(
                        'Nothing here yet...',
                        style: Typography.fromBrightness(
                          brightness: FluentTheme.of(context).brightness,
                          color: Colors.grey[80],
                        ).bodyLarge,
                      ),
                    )
                  : const RepoListSection(),
            ),
          ],
        ),
      ),
    );
  }
}
