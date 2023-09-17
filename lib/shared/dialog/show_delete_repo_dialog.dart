import 'package:fluent_ui/fluent_ui.dart';

Future<bool> showDeleteConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
}) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => ContentDialog(
          title: Text(title),
          content: Text(
            content,
          ),
          actions: [
            Button(
              child: const Text('Delete'),
              onPressed: () => Navigator.pop(context, true),
            ),
            FilledButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        ),
      ) ??
      false;
}
