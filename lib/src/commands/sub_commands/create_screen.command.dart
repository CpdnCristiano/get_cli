import 'package:cpdn_cli/src/common/service/log.service.dart';
import 'package:cpdn_cli/src/common/ultils/ultils.dart';

void createScreenCommand(List<String> args) async {
  var name = args.firstWhere(
      (el) => el.startsWith('--name=') || el.startsWith('--n='),
      orElse: () => null);
  if (name == null) {
    logError('argument --name not found');
    return;
  }
  name = name.split('=')[1];
  if (name.isEmpty) {
    logError('argument --name not found');
    return;
  }
  name = name.toLowerCase();
  var screenFileName = '${name.replaceAll(' ', '_')}.screen.dart';
  var screenDirectory = 'lib/presentation/' + name.replaceAll(' ', '_');
  await Utils.createDiretory(screenDirectory);
  await Utils.createDiretory('${screenDirectory}/controllers');
  await Utils.createDiretory('${screenDirectory}/widgets');

  var screenFilePath = '${screenDirectory}/${screenFileName}';

  if (!await Utils.existsFile(screenFilePath)) {
    await Utils.createFile(screenFilePath);
    await Utils.writeFile(
        screenFilePath, _createScreenFile(Utils.nameInCamelCase(name)));
  }
}

String _createScreenFile(String name) {
  var screenText = '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ${name}Screen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
''';
  return screenText;
}
