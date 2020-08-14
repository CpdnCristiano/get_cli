import 'package:cpdn_cli/src/commands/create.command.dart';
import 'package:cpdn_cli/src/commands/version.command.dart';
import 'package:cpdn_cli/src/common/service/log.service.dart';

class Cli {
  void ProcessCommand(List<String> args) async {
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
      default:
        LogService.error(
            'the command: ${command} not\'s find. expected [create]');
    }
  }
}
