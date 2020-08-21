import 'dart:io';

import 'package:get_cli/arctekko.dart';

void createNavigation(String name) async {
  var navigationFile = 'lib/infrastructure/navigation/navigation.dart';
  if (!await Utils.existsFile(navigationFile)) {
    await Utils.createFile(navigationFile);
    await Utils.writeFile(navigationFile, InitFiles.files['navigation.dart']);
  }
  _addNav(name);
}

void _addNav(String name) async {
  var routesFile = 'lib/infrastructure/navigation/navigation.dart';
  var lines = await File(routesFile).toDynamicFile().readAsLinesSync();

  while (lines.last.isEmpty) {
    lines.removeLast();
  }

  lines.insert(lines.length - 2, '    GetPage(');
  lines.insert(lines.length - 2,
      '    name: Routes.${name.toSnakeCase().toUpperCase()},');
  lines.insert(
      lines.length - 2, '    page: () => ${name.toPascalCase()}Screen(),');
  lines.insert(lines.length - 2,
      '    binding: ${name.toPascalCase()}ControllerBinding()');
  lines.insert(lines.length - 2, '  ),');
  lines.insert(0,
      '''import '../../presentation/${name.toSnakeCase()}/${name.toSnakeCase()}.screen.dart';''');
  lines.insert(0,
      '''import '../../infrastructure/navigation/bindings/controllers/${name.toSnakeCase()}.controller.binding.dart';''');

  await File(routesFile).toDynamicFile().writeAsStringSync(lines.join('\n'));
}
