import 'dart:developer';
import 'dart:io';

import 'package:cpdn_cli/src/common/ultils/files_exemple.utils.dart';
import 'package:cpdn_cli/src/common/ultils/ultils.dart';

void createRoutes(String nameRoute) async {
  var routesFile =
      Utils.autoPathConvert('lib/infrastructure/navigation/routes.dart');
  if (!await Utils.existsFile(routesFile)) {
    await Utils.createFile(routesFile);
    await Utils.writeFile(routesFile, FileExempleUtils.createTextRoutes());
  }

  _addRoute(nameRoute);
}

void _addRoute(String nameRoute) async {
  var routesFile =
      Utils.autoPathConvert('lib/infrastructure/navigation/routes.dart');
  var lines = await File(routesFile).readAsLinesSync();

  while (lines.last.isEmpty) {
    lines.removeLast();
  }
  lines.removeLast();
  lines.add(

      '  static const ${nameRoute.toUpperCase()} = \'${nameRoute.toLowerCase()}\';');

  _routesSort(lines);

  await File(routesFile).writeAsStringSync(lines.join('\n'));
}

List<String> _routesSort(List<String> lines) {
  var routes = <String>[];
  var lines2 = <String>[];
  lines2.addAll(lines);
  lines2.forEach((line) {
    if (line.contains('static const')) {
      routes.add('$line');
      lines.remove(line);
    }
  });
  routes.sort();
  lines.addAll(routes);
  lines.add('}');
  return lines;
}
