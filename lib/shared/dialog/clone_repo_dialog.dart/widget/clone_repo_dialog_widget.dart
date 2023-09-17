import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/service/clone_repo_helper.dart';
import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/widget/clone_repo_dialog_widget_body.dart';
import 'package:aurora_git/shared/provider/repo_list_notifier/repo_list_notifier.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:libgit2dart/libgit2dart.dart';

class CloneRepoDialogWidget extends ConsumerWidget {
  const CloneRepoDialogWidget({
    required this.urlLinkController,
    required this.repoNameController,
    required this.folderPathNameController,
    super.key,
  });

  final TextEditingController urlLinkController;
  final TextEditingController repoNameController;
  final TextEditingController folderPathNameController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContentDialog(
      constraints: const BoxConstraints(
        minWidth: 500,
      ),
      title: const Text('Clone a remote repository'),
      content: CloneRepoDialogWidgetBody(
        urlLinkController: urlLinkController,
        repoNameController: repoNameController,
        folderPathNameController: folderPathNameController,
      ),
      actions: [
        FilledButton(
          child: const Text('Clone'),
          onPressed: () {
            final fullRepoPath = fullRepoFolderPath(
              folderPathNameController.text,
              repoNameController.text,
            );

            // TODO: Show loading spinner, not sure why the widget isn't rebuilding when progress updated in callback
            Repository.clone(
              url: urlLinkController.text,
              localPath: fullRepoPath,
            );

            // Add the repo
            ref.read(repoListNotifierProvider.notifier).addRepo(
                  fullRepoPath,
                );

            Navigator.pop(context);
          },
        ),
        Button(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
