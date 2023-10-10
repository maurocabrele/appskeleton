import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const AndroidOptions androidOptions = AndroidOptions(
  encryptedSharedPreferences: true,
);
const IOSOptions iosOptions = IOSOptions(accessibility: KeychainAccessibility.first_unlock);

