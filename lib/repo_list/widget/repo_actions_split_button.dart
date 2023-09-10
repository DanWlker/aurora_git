import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/show_clone_repo_dialog.dart';
import 'package:fluent_ui/fluent_ui.dart';

class RepoActionsSplitButton extends StatelessWidget {
  const RepoActionsSplitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitButton(
      flyout: MenuFlyout(
        items: [
          MenuFlyoutItem(
            text: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FluentIcons.fabric_open_folder_horizontal),
                SizedBox(width: 8),
                Text('Open'),
              ],
            ),
            onPressed: () {},
          ),
          MenuFlyoutItem(
            text: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FluentIcons.add),
                SizedBox(width: 8),
                Text('New'),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      onInvoked: () {
        showCloneRepoDialog(context);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(FluentIcons.cloud_download),
            SizedBox(width: 8),
            Text('Clone'),
          ],
        ),
      ),
    );
  }
}
