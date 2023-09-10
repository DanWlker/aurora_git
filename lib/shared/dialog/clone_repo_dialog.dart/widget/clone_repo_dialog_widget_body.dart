import 'package:aurora_git/shared/dialog/clone_repo_dialog.dart/service/clone_repo_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';

class CloneRepoDialogWidgetBody extends StatefulWidget {
  const CloneRepoDialogWidgetBody({
    required this.urlLinkController,
    required this.repoNameController,
    required this.folderPathNameController,
    super.key,
  });

  final TextEditingController urlLinkController;
  final TextEditingController repoNameController;
  final TextEditingController folderPathNameController;

  @override
  State<CloneRepoDialogWidgetBody> createState() =>
      _CloneRepoDialogWidgetBodyState();
}

class _CloneRepoDialogWidgetBodyState extends State<CloneRepoDialogWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            const Text('Repository link:'),
            TextBox(
              controller: widget.urlLinkController,
            ),
          ],
        ),
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text('Clone repository to:'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      fullRepoFolderPath(
                        widget.folderPathNameController.text,
                        widget.repoNameController.text,
                      ),
                      softWrap: true,
                    ),
                  ),
                  FilledButton(
                    child: const Text('Browse'),
                    onPressed: () async {
                      final selectedDirectory =
                          await FilePicker.platform.getDirectoryPath();
                      setState(() {
                        widget.folderPathNameController.text =
                            selectedDirectory ?? '';
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            const Text('Repository name:'),
            TextBox(
              controller: widget.repoNameController,
              //To refresh the folder path as you type
              onChanged: (value) => setState(() {}),
            ),
          ],
        ),
      ],
    );
  }
}
