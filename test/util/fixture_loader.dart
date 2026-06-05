import 'dart:convert';
import 'dart:io';

List<Map<String, dynamic>> loadFixture(String name) {
  final file = File('test/fixtures/$name');
  final json = jsonDecode(file.readAsStringSync()) as List;
  return json.cast<Map<String, dynamic>>();
}