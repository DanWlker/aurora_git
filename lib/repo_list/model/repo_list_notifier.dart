import 'package:aurora_git/repo_list/entity/repo_entity.dart';
import 'package:aurora_git/shared/storage/storage_label.dart';
import 'package:aurora_git/shared/storage/storage_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo_list_notifier.g.dart';

@riverpod
class RepoListNotifier extends _$RepoListNotifier {
  Future<void> addRepo(RepoEntity repoEntity) async {
    final futureState = await future;
    futureState.add(repoEntity);

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
