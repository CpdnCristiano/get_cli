import 'package:cpdn_cli/src/common/ultils/files_exemple.utils.dart';
import 'package:cpdn_cli/src/common/ultils/string.ultils.dart';
import 'package:cpdn_cli/src/common/ultils/ultils.dart';

void createController(path, name) async {
  if (!await Utils.existsFile(path)) {
    await Utils.createFile(path);
    await Utils.writeFile(path,
        FileExempleUtils.createTextController(StringUtils.toPascalCase(name)));
  }
}
