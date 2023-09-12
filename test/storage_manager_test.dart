import 'package:aurora_git/shared/storage/storage_label.dart';
import 'package:aurora_git/shared/storage/storage_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';

import 'entity/mock_test_object.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesWindows.registerWith();

  group('StorageManager Tests', () {
    test('Test set and get Bool', () async {
      await StorageManager.setBool(label: StorageLabel.repoList, value: true);
      final result = await StorageManager.getBool(label: StorageLabel.repoList);
      expect(result, equals(true));
    });

    test('Test set and get String', () async {
      await StorageManager.setString(
        label: StorageLabel.repoList,
        value: 'Hello',
      );
      final result =
          await StorageManager.getString(label: StorageLabel.repoList);
      expect(result, equals('Hello'));
    });

    test('Test set and get Int', () async {
      await StorageManager.setInt(label: StorageLabel.repoList, value: 42);
      final result = await StorageManager.getInt(label: StorageLabel.repoList);
      expect(result, equals(42));
    });

    test('Test set and get Double', () async {
      await StorageManager.setDouble(
        label: StorageLabel.repoList,
        value: 3.14,
      );
      final result =
          await StorageManager.getDouble(label: StorageLabel.repoList);
      expect(result, equals(3.14));
    });

    test('Test set and get String List', () async {
      final myList = <String>['Item 1', 'Item 2', 'Item 3'];
      await StorageManager.setStringList(
        label: StorageLabel.repoList,
        value: myList,
      );
      final result = await StorageManager.getStringList(
        label: StorageLabel.repoList,
      );
      expect(result, equals(myList));
    });

    test('Test set and get Map', () async {
      final myObject = <String, dynamic>{'key': 'value'};
      await StorageManager.setObject(
        label: StorageLabel.repoList,
        value: myObject,
      );
      final result = await StorageManager.getObject(
        label: StorageLabel.repoList,
        fromJson: (json) => json,
      );
      expect(result, equals(myObject));
    });

    test('Test set and get Map List', () async {
      final myObjectList = <Map<String, dynamic>>[
        {'key1': 'value1'},
        {'key2': 'value2'},
        {'key3': 'value3'},
      ];
      await StorageManager.setObjectList(
        label: StorageLabel.repoList,
        value: myObjectList,
      );
      final result = await StorageManager.getObjectList(
        label: StorageLabel.repoList,
        fromJson: (json) => json,
      );
      expect(result, equals(myObjectList));
    });

    test('Test set and get Object', () async {
      final myObject =
          MockTestObject(name: 'obj1', value: 24, isSomething: true);
      await StorageManager.setObject(
        label: StorageLabel.repoList,
        value: myObject,
      );
      final result = await StorageManager.getObject(
        label: StorageLabel.repoList,
        fromJson: MockTestObject.fromJson,
      );
      expect(result.runtimeType, equals(myObject.runtimeType));
      expect(result?.name, equals('obj1'));
      expect(result?.value, equals(24));
    });

    test('Test set and get Object List', () async {
      final myObjectList = <MockTestObject>[
        MockTestObject(name: 'obj1', value: 1, isSomething: true),
        MockTestObject(name: 'obj2', value: 2, isSomething: false),
        MockTestObject(name: 'obj3', value: 3, isSomething: true),
      ];
      await StorageManager.setObjectList(
        label: StorageLabel.repoList,
        value: myObjectList,
      );
      final result = await StorageManager.getObjectList(
        label: StorageLabel.repoList,
        fromJson: MockTestObject.fromJson,
      );
      expect(result.runtimeType, equals(myObjectList.runtimeType));
      expect(result?.length, equals(3));
      expect(result?[0].name, 'obj1');
      expect(result?[1].isSomething, false);
      expect(result?[2].value, 3);
    });

    test('Test remove', () async {
      await StorageManager.remove(label: StorageLabel.repoList);
      final result = await StorageManager.getBool(label: StorageLabel.repoList);
      expect(result, equals(null));
    });

    test('Test clear', () async {
      await StorageManager.clear();
      final boolResult =
          await StorageManager.getBool(label: StorageLabel.repoList);
      final stringResult =
          await StorageManager.getString(label: StorageLabel.repoList);
      final intResult =
          await StorageManager.getInt(label: StorageLabel.repoList);
      final doubleResult =
          await StorageManager.getDouble(label: StorageLabel.repoList);
      final stringListResult = await StorageManager.getStringList(
        label: StorageLabel.repoList,
      );
      final objectResult = await StorageManager.getObject(
        label: StorageLabel.repoList,
        fromJson: (json) => json,
      );
      final objectListResult = await StorageManager.getObjectList(
        label: StorageLabel.repoList,
        fromJson: (json) => json,
      );

      expect(boolResult, equals(null));
      expect(stringResult, equals(null));
      expect(intResult, equals(null));
      expect(doubleResult, equals(null));
      expect(stringListResult, equals(null));
      expect(objectResult, equals(null));
      expect(objectListResult, equals(null));
    });
  });
}
