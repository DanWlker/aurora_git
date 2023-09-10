import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/service/clone_repo_helper.dart';
import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/widget/clone_repo_dialog_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<void> showCloneRepoDialog(BuildContext context) async {
  final urlLinkController = TextEditingController();
  final repoNameController = TextEditingController();
  final folderPathNameController = TextEditingController()
    ..text = (await getApplicationDocumentsDirectory()).absolute.path;

  final clipboardDataText = (await Clipboard.getData('text/plain'))?.text;

  if (clipboardDataText != null && isSupportedGitUrl(clipboardDataText)) {
    urlLinkController.text = clipboardDataText;
    repoNameController.text = Uri.parse(clipboardDataText)
        .pathSegments
        .last
        .replaceAll(RegExp(r'\.git$'), '');
  }

  if (context.mounted) {
    await showDialog<String>(
      context: context,
      builder: (context) => CloneRepoDialogWidget(
        urlLinkController: urlLinkController,
        repoNameController: repoNameController,
        folderPathNameController: folderPathNameController,
      ),
    );
  }
}
