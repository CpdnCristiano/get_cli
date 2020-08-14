import 'package:cpdn_cli/src/commands/sub_commands/create_screen.command.dart';
import 'package:cpdn_cli/src/commands/sub_commands/create_widget.command.dart';
import 'package:cpdn_cli/src/common/service/log.service.dart';
import 'package:cpdn_cli/src/common/ultils/ultils.dart';

void createCommand(List<String> args) async {
  if (!await Utils.isFlutterDirectory()) {
    LogService.error('pubspec.yaml was not found');
    LogService.info('run the command in the flutter project directory');
    return;
  }
  if (args.isEmpty) {
    LogService.error('Create <type> [screen , widget]');
    return;
  }
  var type = args.first;
  args.removeAt(0);
  switch (type) {
    case 'screen':
    case 's':
      createScreenCommand(args);
      break;
    case 'widget':
    case 'w':
      createWidgetCommand(args);
      break;

    default:
      LogService.error(
          'the type: ${type} not\'s find. expected [screen, widget]');
  }
}
