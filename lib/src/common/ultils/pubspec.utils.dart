import 'dart:io';
import 'package:get_cli/src/common/ultils/ultils.dart';

class PubspecUtils {
  static Future<String> _getPubspecDir() async {
    var presentationDir = Directory.current;
    List allContents = await presentationDir.listSync();
    for (var dir in allContents) {
      if (dir is File) {
        if (Utils.extractFileName(dir.path) == 'pubspec.yaml') return dir.path;
      }
    }
    return null;
  }

  static Future<String> getProjectName() async {
    var dir = await _getPubspecDir();
    if (dir != null) {
      var f = File(dir);
      f.readAsLinesSync().forEach((line) {
        if (line.startsWith('name:')) {
          return line.split(':').last;
        }
      });
    }
    return null;
  }

  static void addDependencies(String package, String version) async {
    var pubspec = File('pubspec.yaml');
    var lines = pubspec.readAsLinesSync();
    var index =
        lines.indexWhere((element) => element.trim() == 'dev_dependencies:');
    while (lines[index - 1].isEmpty) {
      index--;
    }
    version != null ? ' ^$version' : '';
    lines.insert(index, '  $package: $version');
    await pubspec.writeAsStringSync(lines.join('\n'));
  }
}
