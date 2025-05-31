import 'dart:convert';
import 'package:crypto/crypto.dart';

String getUuidFromString(String input) {
  // Hash the input string
  final bytes = utf8.encode(input);
  final hash = sha256.convert(bytes).bytes;

  // Set version to 4 (UUIDv4)
  hash[6] = (hash[6] & 0x0F) | 0x40;
  // Set variant to DCE 1.1
  hash[8] = (hash[8] & 0x3F) | 0x80;

  // Format as UUID: 8-4-4-4-12
  String toHex(int start, int end) =>
      hash.sublist(start, end).map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  return '${toHex(0, 4)}-${toHex(4, 6)}-${toHex(6, 8)}-${toHex(8, 10)}-${toHex(10, 16)}';
}