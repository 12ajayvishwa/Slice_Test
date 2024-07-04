import 'package:encrypt/encrypt.dart' as encrypt;

const String keyString = 'xlhF31NeOlibJcoOW9tvZg7TkHcAZI3a';
const String ivString = 'qwertyuiopasdfgh';

Future<String> decryptData(String ciphertext, String key, String iv) async {
  final keyBytes = encrypt.Key.fromUtf8(key);
  final ivBytes = encrypt.IV.fromUtf8(iv);
  final encrypter = encrypt.Encrypter(encrypt.AES(
    keyBytes,
    mode: encrypt.AESMode.cbc,
  ));
  final decrypted = encrypter.decrypt64(ciphertext, iv: ivBytes);
  return decrypted;
}
