import 'package:get_cli/arctekko.dart';

void createWidgetCommand(List<String> args) async {
  var name = args.firstWhere(
      (el) => el.startsWith('--name') || el.startsWith('--n'),
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
  args = args.join(' ').split('-');
  var dir = args.first.isNotEmpty ? args.first.replaceAll(' ', '') : 'common';

  if (!isCommonWidget(dir)) {
    print(dir);
    if (!await Utils.existsScreen(dir)) {
      LogService.error('Screen not found');
      return;
    }
  }

  name = name.toLowerCase().trimLeft();
  var nameSnakeCase = name.toSnakeCase();
  var widgetFileName = '$nameSnakeCase.widget.dart';
  var widgetDirectory = isCommonWidget(dir)
      ? 'lib/common/widgets/${name.replaceAll(' ', '_')}'
      : 'lib/presentation/$dir/widgets/${name.replaceAll(' ', '_')}';
  await Utils.createDiretory(widgetDirectory);
  var widgetFilePath = '${widgetDirectory}/${widgetFileName}';
  if (!await Utils.existsFile(widgetFilePath)) {
    await Utils.createFile(widgetFilePath);
    await Utils.writeFile(
        widgetFilePath, FileExempleUtils.createTextWidget(name.toPascalCase()));
  }
}

bool isCommonWidget(String screen) {
  return screen == 'common';
}
