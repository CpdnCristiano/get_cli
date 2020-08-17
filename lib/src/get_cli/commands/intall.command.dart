import 'package:get_cli/arctekko.dart';

void commandInstall(List<String> args) async {
  if (args.isEmpty) {
    LogService.error('enter the name of a package');
    LogService.info('''exemple:
  get install get:3.4.6
  or 
  get intall get
  that way the latest version will be installed''');
    return;
  }
  var padkageInfo = args.first.split(':');
  if (padkageInfo.length == 1) {
    await PubspecUtils.addDependencies(padkageInfo.first);
  } else {
    await PubspecUtils.addDependencies(padkageInfo.first,
        version: padkageInfo[1]);
  }
  await ShellUtils.pubGet();
}
