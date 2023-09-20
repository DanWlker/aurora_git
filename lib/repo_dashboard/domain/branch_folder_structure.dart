class BranchFolderStructure {
  BranchFolderStructure({
    required this.name,
    this.children = const [],
  });
  String name;
  List<BranchFolderStructure> children;
}
