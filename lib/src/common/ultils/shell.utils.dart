import 'package:cpdn_cli/arctekko.dart';
import 'package:process_run/process_run.dart';

class ShellUtils {
  static void pubGet() async {
    LogService.info('run flutter pub get');
    await run('flutter', ['pub', 'get'], verbose: true);
  }
}
