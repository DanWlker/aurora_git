import 'package:aurora_git/repo_dashboard/domain/branch_folder_structure.dart';
import 'package:fluent_ui/fluent_ui.dart';

class BranchesTreeView extends PaneItemSeparator {
  BranchesTreeView({
    required this.folderOrBranchList,
    super.key,
  });
  final List<BranchFolderStructure> folderOrBranchList;

  String? _selectedBranch;
  Map<String, TreeViewItem> pathToTreeViewItemMap = {};

  Future<void> onInvoked(
    TreeViewItem item,
    TreeViewItemInvokeReason reason,
  ) async {
    if (item.children.isNotEmpty || item.depth == 0) {
      item
        ..expanded = !item.expanded
        ..selected = false;

      pathToTreeViewItemMap[_selectedBranch]?.selected = true;

      return;
    }

    _selectedBranch = item.value as String;
  }

  TreeViewItem buildTreeView(
    BranchFolderStructure structure, {
    String parentPath = '',
  }) {
    final currentFullPath = '$parentPath/${structure.name}';
    late TreeViewItem treeViewItem;

    if (structure.children.isEmpty) {
      //branch
      treeViewItem = TreeViewItem(
        content: Text(structure.name),
        value: currentFullPath,
        onInvoked: onInvoked,
      );
    } else {
      //folder
      treeViewItem = TreeViewItem(
        content: Text(structure.name),
        value: currentFullPath,
        onInvoked: onInvoked,
        children: [
          for (final childItem in structure.children)
            buildTreeView(childItem, parentPath: currentFullPath),
        ],
      );
    }

    pathToTreeViewItemMap[currentFullPath] = treeViewItem;
    return treeViewItem;
  }

  @override
  Widget build(BuildContext context, Axis direction) {
    pathToTreeViewItemMap = {};

    return KeyedSubtree(
      key: key,
      child: TreeView(
        selectionMode: TreeViewSelectionMode.single,
        items: [
          TreeViewItem(
            value: 'Branches',
            content: const Text('Branches'),
            onInvoked: onInvoked,
            children: [
              for (final folderOrBranch in folderOrBranchList)
                buildTreeView(folderOrBranch),
            ],
          ),
        ],
      ),
    );
  }
}
