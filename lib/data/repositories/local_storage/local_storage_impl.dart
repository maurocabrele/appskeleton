import 'package:appskeleton/core/local_storage_options/local_storage_options.dart';
import 'package:appskeleton/data/data_provider/local_storage/local_storage_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageEncryptedImpl implements LocalStorageEncrypted {
  final FlutterSecureStorage _store;

  LocalStorageEncryptedImpl()
      : _store = const FlutterSecureStorage(
            aOptions: androidOptions, iOptions: iosOptions);

  @override
  Future<String> read(String key) async =>
      await _store.read(key: key).then((value) => value ?? '');

  @override
  Future<void> write(String key, String value) async =>
      await _store.write(key: key, value: value);

  @override
  Future<void> delete(String key) async => await _store.delete(key: key);
}
