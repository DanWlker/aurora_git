import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/service/clone_repo_helper.dart';
import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/widget/clone_repo_dialog_widget_body.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:libgit2dart/libgit2dart.dart';

class CloneRepoDialogWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
            Repository.clone(
              url: urlLinkController.text,
              localPath: fullRepoFolderPath(
                folderPathNameController.text,
                repoNameController.text,
              ),
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
