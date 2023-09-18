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
                IconButton(
                  onPressed: () {},
                  icon: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.drill_down),
                          Text('Fetch'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.drill_down_solid),
                          Text('Pull'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.upload),
                          Text('Push'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                IconButton(
                  onPressed: () {},
                  icon: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.archive),
                          Text('Stash'),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {},
                  icon: const SizedBox(
                    width: 56,
                    height: 40,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.share),
                          Text('Open in'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const SizedBox(
                    width: 56,
                    height: 40,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.command_prompt),
                          Text('Terminal'),
                        ],
                      ),
                    ),
                  ),
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
        ],
      ),
    );
  }
}
