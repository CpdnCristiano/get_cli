import 'package:get_cli/arctekko.dart';
import 'package:get_cli/src/get_cli/commands/intall.command.dart';

class GetCli {
  static void ProcessCommand(List<String> args) async {
    if (args.isEmpty) {
      LogService.error('comando não infomafo');
      LogService.info('in the future I will create a help');
      return;
    }
    var command = args.first.toLowerCase();
    args.removeAt(0);
    switch (command) {
      case 'arctekko':
      case 'arc':
        Arctekko.ProcessCommand(args);
        break;
      case 'install':
      case 'i':
        commandInstall(args);
        break;
      case 'upgrade':
        ShellUtils.update();
        break;
      default:
        LogService.error('comando invalido');
    }
  }
}
