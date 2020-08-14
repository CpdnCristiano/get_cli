import 'dart:io';

import 'package:cpdn_cli/src/common/service/log.service.dart';

class Utils {
  static String currentPath = Directory.current.path;
  static void createDiretory(String directory) async {
    LogService.info('Creating "${directory}"');
    if (Platform.isWindows) {
      await Directory('${currentPath}\\${directory}')
          .createSync(recursive: true);
    } else {
      await Directory('${currentPath}/${directory}/')
          .createSync(recursive: true);
    }
    LogService.success('Create "${directory}" with Success');
  }

  static Future<bool> existsFile(String path) async {
    if (Platform.isWindows) {
      path = path.replaceAll('/', '\\');
      return await File('$currentPath\\$path').existsSync();
    }
    return await File('$currentPath/$path').existsSync();
  }

  static void createFile(String path) async {
    if (Platform.isWindows) {
      path = path.replaceAll('/', '\\');
      await File('$currentPath\\$path').createSync(recursive: true);
      return;
    }
    await File('$currentPath/$path').createSync(recursive: true);
  }

  static void writeFile(String path, String text) async {
    if (Platform.isWindows) {
      path = path.replaceAll('/', '\\');
      await File('$currentPath\\$path').writeAsStringSync(text);
      return;
    }
    await File('$currentPath/$path').writeAsStringSync(text);
  }

  static String nameInCamelCase(String name) {
    var listWords = name.split(' ');
    var word = '';
    listWords.forEach((element) {
      element =
          '${element[0].toUpperCase()}${element.substring(1).toLowerCase()}';
      word += element;
    });
    return word;
  }

  static Future<bool> existsScreen(String screen) async {
    var presentationDir = Platform.isWindows
        ? Directory('$currentPath\\lib\\presentation')
        : Directory('$currentPath/lib/presentation');
    ;
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
}
