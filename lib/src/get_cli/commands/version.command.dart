import 'dart:io';

import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

void versionCommand() async {
  var pathToPubLock =
      join(dirname(Platform.script.toFilePath()), '../pubspec.lock');
  final file = File(pathToPubLock);
  var text = loadYaml(await file.readAsString());
  var version = text['packages']['get_cli']['version'].toString();
  print('Cli arctekko \n version: $version');
}
