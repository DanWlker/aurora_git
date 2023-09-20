import 'package:aurora_git/repo_dashboard/domain/branch_folder_structure.dart';
import 'package:aurora_git/repo_dashboard/widget/branches_tree_view.dart';
import 'package:aurora_git/repo_dashboard/widget/icon_button_fixed_width.dart';
import 'package:aurora_git/shared/global_variables.dart';
import 'package:aurora_git/shared/window_buttons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class RepoDashboardPage extends StatefulWidget {
  const RepoDashboardPage({super.key});

  @override
  State<RepoDashboardPage> createState() => _RepoDashboardPageState();
}

class _RepoDashboardPageState extends State<RepoDashboardPage> {
  int selectedIndex = 1;
  int tabSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            DragToMoveArea(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Aurora Git v$packageVersion',
                      style: Typography.fromBrightness(
                        brightness: FluentTheme.of(context).brightness,
                      ).bodyStrong,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                IconButtonFixedWidth(
                  iconData: FluentIcons.drill_down,
                  text: 'Fetch',
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                IconButtonFixedWidth(
                  iconData: FluentIcons.drill_down_solid,
                  text: 'Pull',
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                IconButtonFixedWidth(
                  iconData: FluentIcons.upload,
                  text: 'Push',
                  onPressed: () {},
                ),
                const SizedBox(width: 40),
                IconButtonFixedWidth(
                  iconData: FluentIcons.archive,
                  text: 'Stash',
                  onPressed: () {},
                ),
                const Expanded(child: SizedBox()),
                IconButtonFixedWidth(
                  iconData: FluentIcons.share,
                  text: 'Open in',
                  size: const Size(56, 40),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                IconButtonFixedWidth(
                  iconData: FluentIcons.command_prompt,
                  text: 'Terminal',
                  size: const Size(56, 40),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        actions: const WindowButtons(),
        height: 104,
      ),
      pane: NavigationPane(
        selected: selectedIndex,
        onChanged: (value) => setState(() {
          selectedIndex = value;
        }),
        size: const NavigationPaneSize(openWidth: 200),
        displayMode: PaneDisplayMode.open,
        indicator: const SizedBox.shrink(),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.page_edit),
            title: const Text('File Changes'),
            body: const Text(
              'Second Tab',
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.branch_fork2),
            title: const Text('All Commits'),
            body: Container(),
          ),
          PaneItemSeparator(),
          BranchesTreeView(
            folderOrBranchList: [
              BranchFolderStructure(
                name: 'feature',
                children: [
                  BranchFolderStructure(name: 'selected1'),
                  BranchFolderStructure(name: 'selected2'),
                  BranchFolderStructure(
                    name: 'selected3',
                    children: [
                      BranchFolderStructure(name: 'selected 3.5'),
                    ],
                  ),
                ],
              ),
              BranchFolderStructure(
                name: 'feature2',
                children: [
                  BranchFolderStructure(name: 'selected1'),
                  BranchFolderStructure(name: 'selected2'),
                  BranchFolderStructure(
                    name: 'selected3',
                    children: [
                      BranchFolderStructure(name: 'selected 4'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
