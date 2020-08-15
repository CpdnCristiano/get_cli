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
  lines.removeLast();
  lines.add(
      ' static const ${nameRoute.toUpperCase()} = \'${nameRoute.toLowerCase()}\';');
  lines.add('}');
  await File(routesFile).writeAsStringSync(lines.join('\n'));
}
