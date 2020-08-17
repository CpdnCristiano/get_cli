import 'dart:io';

import 'package:get_cli/arctekko.dart';

void createRoutes(String nameRoute) async {
  var routesFile = 'lib/infrastructure/navigation/routes.dart';
  if (!await Utils.existsFile(routesFile)) {
    await Utils.createFile(routesFile);
    await Utils.writeFile(routesFile, InitFiles.files['routes.dart']);
  }

  _addRoute(nameRoute);
}

void _addRoute(String nameRoute) async {
  var routesFile = 'lib/infrastructure/navigation/routes.dart';
  var lines = await File(routesFile).toDynamicFile().readAsLinesSync();

  while (lines.last.isEmpty) {
    lines.removeLast();
  }
  lines.removeLast();
  lines.add(
      '  static const ${nameRoute.toUpperCase()} = \'${nameRoute.toLowerCase().replaceAll('_', '-')}\';');

  _routesSort(lines);

  await File(routesFile).toDynamicFile().writeAsStringSync(lines.join('\n'));
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
