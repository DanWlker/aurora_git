import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/show_clone_repo_dialog.dart';
import 'package:aurora_git/shared/provider/repo_list_notifier/repo_list_notifier.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepoActionsSplitButton extends ConsumerWidget {
  const RepoActionsSplitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () {
              final currentNavigator = Navigator.of(context);
              () async {
                final selectedDirectory =
                    await FilePicker.platform.getDirectoryPath();

                if (selectedDirectory == null) return;

                await ref
                    .read(repoListNotifierProvider.notifier)
                    .addRepo(selectedDirectory);

                currentNavigator.pop();
              }();
            },
          ),
          MenuFlyoutItem(
            text: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FluentIcons.add),
                SizedBox(width: 8),
                Text('Create'),
              ],
            ),
            onPressed: () {},
          ),
          MenuFlyoutItem(
            text: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FluentIcons.fabric_folder_search),
                SizedBox(width: 8),
                Text('Scan subfolders'),
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
