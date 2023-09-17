import 'package:json_annotation/json_annotation.dart';
part 'repo_entity.g.dart';

@JsonSerializable()
class RepoEntity {
  RepoEntity({
    required this.repoPath,
  });

  String repoPath;

  // ignore: sort_constructors_first
  factory RepoEntity.fromJson(Map<String, dynamic> json) =>
      _$RepoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RepoEntityToJson(this);
}
