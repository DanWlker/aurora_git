import 'package:aurora_git/repo_list/widget/repo_list_tile.dart';
import 'package:fluent_ui/fluent_ui.dart';

class RepoListSection extends StatefulWidget {
  const RepoListSection({
    super.key,
  });

  @override
  State<RepoListSection> createState() => _RepoListSectionState();
}

class _RepoListSectionState extends State<RepoListSection> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        itemCount: 100,
        itemBuilder: (item, index) => RepoListTile(
          repoFullPath: 'C:/Users/Daniel/projects/digital_bank_flutter_app2',
          onTap: () {},
        ),
      ),
    );
  }
}
