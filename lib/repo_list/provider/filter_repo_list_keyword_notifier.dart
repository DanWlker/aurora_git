import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_repo_list_keyword_notifier.g.dart';

@riverpod
class FilterRepoListKeywordNotifier extends _$FilterRepoListKeywordNotifier {
  set keyword(String keyword) {
    state = keyword;
  }

  String get keyword => state;

  @override
  String build() {
    return '';
  }
}
