import 'package:get_cli/arctekko.dart';

class Arctekko {
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
      case 'init':
        initCommand(args);
        break;
      default:
        LogService.error('comando invalido');
    }
  }
}
