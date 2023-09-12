import 'package:json_annotation/json_annotation.dart';
part 'mock_test_object.g.dart';

@JsonSerializable()
class MockTestObject {
  MockTestObject({
    required this.name,
    required this.value,
    required this.isSomething,
  });

  factory MockTestObject.fromJson(Map<String, dynamic> json) =>
      _$MockTestObjectFromJson(json);
  String name;
  int value;
  bool isSomething;
  Map<String, dynamic> toJson() => _$MockTestObjectToJson(this);
}
