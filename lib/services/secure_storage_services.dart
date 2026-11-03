import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServices {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _noteKey = 'Waqas-Notes-Key';

  /// === Save Note Method ====
  Future<void> saveNotes(String note) async {
    await _storage.write(key: _noteKey, value: note);
  }

  /// ==== Read Note Method ===
  Future<String> readNotes() async {
    return await _storage.read(key: _noteKey) ?? '';
  }

  /// ==== delete Notes Method ====
  Future<void> deleteNotes() async {
    await _storage.delete(key: _noteKey);
  }
}
