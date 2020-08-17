import 'dart:io';

import 'package:get_cli/arctekko.dart';

class Utils {
  static final String _currentPath = Directory.current.path;
  static void createDiretory(String directory) async {
    LogService.info('Creating "${directory}"');
    await Directory('${_currentPath}/${directory}/')
        .toDynamicDirectory()
        .createSync(recursive: true);

    LogService.success('Create "${directory}" with Success');
  }

  static Future<bool> existsFile(String path) async {
    return await File('$_currentPath/$path').toDynamicFile().existsSync();
  }

  static void createFile(String path) async {
    await File('$_currentPath/$path')
        .toDynamicFile()
        .createSync(recursive: true);
  }

  static void writeFile(String path, String text) async {
    await File('$_currentPath/$path').toDynamicFile().writeAsStringSync(text);
  }

  static Future<bool> existsScreen(String screen) async {
    var presentationDir =
        Directory('$_currentPath/lib/presentation').toDynamicDirectory();
    List allContents = presentationDir.listSync();
    for (var dir in allContents) {
      if (dir is Directory) {
        if (Platform.isWindows) {
          if (dir.path.split('\\').last == screen) {
            return true;
          }
        } else {
          if (dir.path.split('/').last == screen) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static Future<bool> isFlutterDirectory() async {
    var dir = Directory.current;
    List allContents = await dir.listSync();
    for (var dir in allContents) {
      if (dir is File) {
        if (extractFileName(dir.path) == 'pubspec.yaml') return true;
      }
    }
    return false;
  }

  static String extractFileName(String path) {
    return Platform.isWindows ? path.split('\\').last : path.split('/').last;
  }
}
