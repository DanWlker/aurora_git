import 'dart:io';

import 'package:aurora_git/repo_list/provider/filter_repo_list_keyword_notifier.dart';
import 'package:aurora_git/repo_list/widget/repo_list_tile.dart';
import 'package:aurora_git/shared/provider/repo_list_notifier/repo_list_notifier.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepoListSection extends ConsumerStatefulWidget {
  const RepoListSection({
    super.key,
  });

  @override
  ConsumerState<RepoListSection> createState() => _RepoListSectionState();
}

class _RepoListSectionState extends ConsumerState<RepoListSection> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final repoListAsyncValue = ref.watch(repoListNotifierProvider);

    return repoListAsyncValue.when(
      data: (data) {
        final filterRepoListKeyword =
            ref.watch(filterRepoListKeywordNotifierProvider);

        data = data
            .where(
              (element) =>
                  filterRepoListKeyword.trim().isEmpty ||
                  element.repoPath.split(Platform.pathSeparator).last.contains(
                        filterRepoListKeyword.trim().toLowerCase(),
                      ),
            )
            .toList();

        if (data.isEmpty) {
          return Center(
            child: Text(
              'Nothing here...',
              style: Typography.fromBrightness(
                brightness: FluentTheme.of(context).brightness,
                color: Colors.grey[80],
              ).bodyLarge,
            ),
          );
        }

        return Scrollbar(
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            itemCount: data.length,
            itemBuilder: (item, index) => RepoListTile(
              repoFullPath: data[index].repoPath,
              onTap: () {},
            ),
          ),
        );
      },
      error: (_, __) => const Center(
        child: Text('is error'),
      ),
      loading: () => const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: ProgressRing(),
        ),
      ),
    );
  }
}
