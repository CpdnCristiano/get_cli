import 'package:cpdn_cli/src/commands/sub_commands/create_controller.command.dart';
import 'package:cpdn_cli/src/commands/sub_commands/create_routes.command.dart';
import 'package:cpdn_cli/src/common/service/log.service.dart';
import 'package:cpdn_cli/src/common/ultils/files_exemple.utils.dart';
import 'package:cpdn_cli/src/common/ultils/string.ultils.dart';
import 'package:cpdn_cli/src/common/ultils/ultils.dart';

void createScreenCommand(List<String> args) async {
  var name = args.firstWhere(
      (el) => el.startsWith('--name=') || el.startsWith('--n='),
      orElse: () => null);
  if (name == null) {
    LogService.error('argument --name not found');
    return;
  }
  name = name.split('=')[1];
  if (name.isEmpty) {
    LogService.error('argument --name not found');
    return;
  }
  name = name.toLowerCase();
  var nameSnakeCase = StringUtils.toSnakeCase(name);
  var screenFileName = '$nameSnakeCase.screen.dart';
  var screenDirectory = 'lib/presentation/$nameSnakeCase';
  await Utils.createDiretory(screenDirectory);
  await Utils.createDiretory('${screenDirectory}/controllers');
  await Utils.createDiretory('${screenDirectory}/widgets');

  var screenFilePath = '${screenDirectory}/${screenFileName}';

  if (!await Utils.existsFile(screenFilePath)) {
    await Utils.createFile(screenFilePath);
    await Utils.writeFile(
        screenFilePath,
        await FileExempleUtils.createTextScreen(
            StringUtils.toPascalCase(name), nameSnakeCase));
  }
  await createController(
      '${screenDirectory}/controllers/$nameSnakeCase.controller.dart', name);
  await createRoutes(nameSnakeCase);
}
