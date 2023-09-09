import 'package:fluent_ui/fluent_ui.dart';

class RepoListTile extends StatefulWidget {
  const RepoListTile({
    required this.repoFullPath,
    required this.onTap,
    super.key,
  });

  final String repoFullPath;
  final VoidCallback onTap;

  @override
  State<RepoListTile> createState() => _RepoListTileState();
}

class _RepoListTileState extends State<RepoListTile> {
  final contextController = FlyoutController();

  @override
  Widget build(BuildContext context) {
    final repoName = widget.repoFullPath.split('/').last;

    return GestureDetector(
      onSecondaryTapUp: (d) {
        // This calculates the position of the flyout
        // according to the parent navigator
        final targetContext = context;
        final box = targetContext.findRenderObject()! as RenderBox;
        final position = box.localToGlobal(
          d.localPosition,
          ancestor: Navigator.of(context).context.findRenderObject(),
        );

        contextController.showFlyout<void>(
          barrierColor: Colors.black.withOpacity(0.1),
          position: position,
          builder: (context) {
            return MenuFlyout(
              items: [
                MenuFlyoutItem(
                  leading: const Icon(FluentIcons.share),
                  text: const Text('Open in editor'),
                  onPressed: () {},
                ),
              ],
            );
          },
        );
      },
      child: FlyoutTarget(
        controller: contextController,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.repoFullPath,
                  style: Typography.fromBrightness(
                    brightness: FluentTheme.of(context).brightness,
                    color: Colors.grey[80],
                  ).caption,
                ),
                Text(
                  repoName,
                  style: Typography.fromBrightness(
                    brightness: FluentTheme.of(context).brightness,
                  ).bodyLarge,
                ),
              ],
            ),
          ),
          onPressed: widget.onTap,
        ),
      ),
    );
  }
}
