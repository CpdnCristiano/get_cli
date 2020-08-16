import 'dart:io';

import 'package:cpdn_cli/arctekko.dart';

class Utils {
  static String currentPath = Directory.current.path;
  static void createDiretory(String directory) async {
    LogService.info('Creating "${directory}"');
    await Directory(autoPathConvert('${currentPath}/${directory}/'))
        .createSync(recursive: true);

    LogService.success('Create "${directory}" with Success');
  }

  static Future<bool> existsFile(String path) async {
    return await File(autoPathConvert('$currentPath/$path')).existsSync();
  }

  static void createFile(String path) async {
    await File(autoPathConvert('$currentPath/$path'))
        .createSync(recursive: true);
  }

  static void writeFile(String path, String text) async {
    await File(autoPathConvert('$currentPath/$path')).writeAsStringSync(text);
  }

  static Future<bool> existsScreen(String screen) async {
    var presentationDir =
        Directory(autoPathConvert('$currentPath/lib/presentation'));
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
    var presentationDir = Directory.current;
    List allContents = await presentationDir.listSync();
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

  static String autoPathConvert(String path) {
    return Platform.isWindows ? path.replaceAll('/', '\\') : path;
  }
}
