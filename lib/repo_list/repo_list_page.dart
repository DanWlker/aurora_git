import 'package:aurora_git/repo_list/widget/repo_actions_split_button.dart';
import 'package:aurora_git/repo_list/widget/repo_list_section.dart';
import 'package:aurora_git/shared/global_variables.dart';
import 'package:aurora_git/shared/window_buttons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class RepoListPage extends StatelessWidget {
  const RepoListPage({super.key});

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
      content: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            Row(
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
            SizedBox(height: 8),
            Expanded(
              child: RepoListSection(),
            ),
          ],
        ),
      ),
    );
  }
}
