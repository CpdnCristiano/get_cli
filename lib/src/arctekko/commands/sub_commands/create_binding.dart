import 'package:get_cli/arctekko.dart';

void createBinding(String name) async {
  var bindingnFile =
      'lib/infrastructure/navigation/bindings/controllers/${name.toSnakeCase()}.controller.binding.dart';
  if (!await Utils.existsFile(bindingnFile)) {
    await Utils.createFile(bindingnFile);
    await Utils.writeFile(
        bindingnFile, FileExempleUtils.createTextBinding(name));
  }
}
