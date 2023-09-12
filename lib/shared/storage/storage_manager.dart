import 'dart:convert';
import 'package:aurora_git/shared/storage/storage_label.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static Future<SharedPreferences> get _pref => SharedPreferences.getInstance();

  static Future<void> setBool({
    required StorageLabel label,
    required bool value,
  }) async {
    await (await _pref).setBool(label.name, value);
  }

  static Future<bool?> getBool({required StorageLabel label}) async {
    return (await _pref).getBool(label.name);
  }

  static Future<void> setString({
    required StorageLabel label,
    required String value,
  }) async {
    await (await _pref).setString(label.name, value);
  }

  static Future<String?> getString({required StorageLabel label}) async {
    return (await _pref).getString(label.name);
  }

  static Future<void> setInt({
    required StorageLabel label,
    required int value,
  }) async {
    await (await _pref).setInt(label.name, value);
  }

  static Future<int?> getInt({required StorageLabel label}) async {
    return (await _pref).getInt(label.name);
  }

  static Future<void> setDouble({
    required StorageLabel label,
    required double value,
  }) async {
    await (await _pref).setDouble(label.name, value);
  }

  static Future<double?> getDouble({required StorageLabel label}) async {
    return (await _pref).getDouble(label.name);
  }

  static Future<void> setStringList({
    required StorageLabel label,
    required List<String> value,
  }) async {
    await (await _pref).setStringList(label.name, value);
  }

  static Future<List<String>?> getStringList({
    required StorageLabel label,
  }) async {
    return (await _pref).getStringList(label.name);
  }

  static Future<void> remove({required StorageLabel label}) async {
    await (await _pref).remove(label.name);
  }

  static Future<void> clear() async {
    await (await _pref).clear();
  }

  static Future<void> setObject<T>({
    required StorageLabel label,
    required T value,
  }) async {
    await (await _pref).setString(label.name, jsonEncode(value));
  }

  static Future<T?> getObject<T>({
    required StorageLabel label,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final data = (await _pref).getString(label.name);
    if (data == null) return null;

    return fromJson(jsonDecode(data) as Map<String, dynamic>);
  }

  static Future<void> setObjectList<T>({
    required StorageLabel label,
    required List<T> value,
  }) async {
    final data = <String>[];

    for (final element in value) {
      data.add(jsonEncode(element));
    }

    await (await _pref).setStringList(label.name, data);
  }

  static Future<List<T>?> getObjectList<T>({
    required StorageLabel label,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final data = <T>[];

    final retrievedValues = (await _pref).getStringList(label.name);

    if (retrievedValues == null) return null;

    for (final element in retrievedValues) {
      data.add(fromJson(jsonDecode(element) as Map<String, dynamic>));
    }

    return data;
  }
}
