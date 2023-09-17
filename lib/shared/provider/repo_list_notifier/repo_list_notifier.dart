import 'package:aurora_git/repo_list/entity/repo_entity.dart';
import 'package:aurora_git/shared/storage/storage_label.dart';
import 'package:aurora_git/shared/storage/storage_manager.dart';
import 'package:libgit2dart/libgit2dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo_list_notifier.g.dart';

@riverpod
class RepoListNotifier extends _$RepoListNotifier {
  Future<void> addRepo(String repoPath) async {
    try {
      Repository.open(repoPath);
    } catch (e) {
      // TODO: Prompt error dialog, or throw it so it can be prompted in ui layer
      // Will throw error when is not a valid repo
      return;
    }

    final futureState = await future;

    //Prevent duplicates
    for (final element in futureState) {
      if (element.repoPath == repoPath) return;
    }

    futureState.add(RepoEntity(repoPath: repoPath));

    await StorageManager.setObjectList(
      label: StorageLabel.repoList,
      value: futureState,
    );

    state = AsyncData(futureState);
  }

  Future<void> removeRepo(String repoPath) async {
    final futureState = await future;
    futureState.removeWhere((element) {
      return element.repoPath == repoPath;
    });

    await StorageManager.setObjectList(
      label: StorageLabel.repoList,
      value: futureState,
    );

    state = AsyncData(futureState);
  }

  @override
  Future<List<RepoEntity>> build() async {
    return await StorageManager.getObjectList(
          label: StorageLabel.repoList,
          fromJson: RepoEntity.fromJson,
        ) ??
        [];
  }
}
