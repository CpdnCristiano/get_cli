import 'dart:io';

import 'package:cpdn_cli/arctekko.dart';
import 'package:cpdn_cli/src/common/ultils/shell.utils.dart';

class Cli {
  static void ProcessCommand(List<String> args) async {
    if (args.isEmpty) {
      LogService.error('unquoted command');
      LogService.info('in the future I will create a help');
      return;
    }
    var command = args.first.toLowerCase();
    args.removeAt(0);
    switch (command) {
      case 'create':
      case 'c':
        createCommand(args);
        break;
      case '--v':
      case '--version':
        versionCommand();
        break;
      case 'install':
        await PubspecUtils.addDependencies('get', '3.4.6');
        await ShellUtils.pubGet();
        break;
      default:
        LogService.error(
            'the command: ${command} not\'s find. expected [create]');
    }
  }
}
