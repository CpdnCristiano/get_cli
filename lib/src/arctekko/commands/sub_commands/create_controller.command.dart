import 'package:get_cli/arctekko.dart';

void createController(String path, String name) async {
  if (!await Utils.existsFile(path)) {
    await Utils.createFile(path);
    await Utils.writeFile(
        path, FileExempleUtils.createTextController(name.toPascalCase()));
  }
}
