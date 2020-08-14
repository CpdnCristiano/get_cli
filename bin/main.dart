import 'package:cpdn_cli/src/cli.dart';
import 'package:cpdn_cli/src/common/service/log.service.dart';
import 'package:cpdn_cli/src/common/ultils/ultils.dart';

void main(List<String> arguments) async {
  final cli = Cli();
  if (!await Utils.isFlutterDirectory()) {
    logError('pubspec.yaml was not found');
    logInfo('run the command in the flutter project directory');
    return;
  }
  cli.ProcessCommand(List<String>.from(arguments));
}
