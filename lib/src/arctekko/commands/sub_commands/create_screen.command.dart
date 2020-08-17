import 'package:get_cli/arctekko.dart';

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
  name = name.toLowerCase().trimLeft();
  var nameSnakeCase = name.toSnakeCase();
  var screenFileName = '$nameSnakeCase.screen.dart';
  var screenDirectory = 'lib/presentation/$nameSnakeCase';
  await Utils.createDiretory(screenDirectory);
  await Utils.createDiretory('${screenDirectory}/controllers');
  await Utils.createDiretory('${screenDirectory}/widgets');

  var screenFilePath = '${screenDirectory}/${screenFileName}';

  if (!await Utils.existsFile(screenFilePath)) {
    await Utils.createFile(screenFilePath);
    await Utils.writeFile(
        screenFilePath, await FileExempleUtils.createTextScreen(name));
  }
  await createController(
      '${screenDirectory}/controllers/$nameSnakeCase.controller.dart', name);
  await createRoutes(nameSnakeCase);
}
