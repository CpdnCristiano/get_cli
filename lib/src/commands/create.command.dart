import 'package:cpdn_cli/src/commands/sub_commands/create_screen.command.dart';
import 'package:cpdn_cli/src/commands/sub_commands/create_widget.command.dart';
import 'package:cpdn_cli/src/common/service/log.service.dart';

void createCommand(List<String> args) {
  if (args.isEmpty) {
    logError('Create <type> --name="home" --path="path"');
    logError('Create type is null');
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
      logError('the type: ${type} not\'s find. expected [screen, widget]');
  }
}
