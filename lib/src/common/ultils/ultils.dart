import 'dart:io';

import 'package:cpdn_cli/src/common/service/log.service.dart';

class Utils {
  static String currentPath = Directory.current.path;
  static void createDiretory(String directory) async {
    logInfo('Creating "${directory}"');
    await Directory('${currentPath}/${directory}/').createSync(recursive: true);
    logSuccess('Create "${directory}" with Success');
  }

  static Future<bool> existsFile(String path) async {
    return await File('$currentPath/$path').existsSync();
  }

  static void createFile(String path) async {
    await File('$currentPath/$path').createSync(recursive: true);
  }

  static void writeFile(String path, String text) async {
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
    var presentationDir = Directory('$currentPath/lib/presentation');
    List allContents = presentationDir.listSync();
    for (var dir in allContents) {
      if (dir is Directory) {
        print(dir.path.split('/').last);
        print(dir.path.split('/').last.endsWith(screen));
        if (dir.path.split('/').last == screen) {
          return true;
        }
      }
    }
    return false;
  }
}
