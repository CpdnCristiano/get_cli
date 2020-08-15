import 'dart:io';

import 'package:path/path.dart';

void versionCommand() async {
  var pathToYaml =
      join(dirname(Platform.script.toFilePath()), '../pubspec.yaml');

  var f = File(pathToYaml);
  f.readAsLinesSync().forEach((element) {
    if (element.startsWith('version:')) {
      var version = element.split(':').last;
      print('Cli arctekko \n version: $version');
    }
  });
}
