import 'dart:io';

import 'package:cpdn_cli/arctekko.dart';

void initCommand(List<String> args) async {
  if (args.isEmpty) {
    LogService.error('directory or \'.\' argument was not informed');
    LogService.info(
        'correct use: arctekko init . or arctekko init my_fist_project');
    return;
  }

  String dir;
  var skipExample = false;
  var argsjoin = args.join().toLowerCase();
  if (argsjoin.contains('-')) {
    dir = argsjoin.split('-')[0].toSnakeCase();
    skipExample =
        argsjoin.contains('--skipExample') | argsjoin.contains('--se');
  } else {
    dir = argsjoin.toSnakeCase();
  }
  print(dir = dir == '.' ? Directory('').path : dir);
  dir = dir == '.' ? Directory('').path : dir;
  await ShellUtils.flutterCreate(dir);
  await ShellUtils.cdDir(dir);
  await PubspecUtils.addDependencies('get', '3.4.6');
  await ShellUtils.pubGet();
  await CreateDirectory(dir, skipExample);
  await ShellUtils.cdDir('..');
}
