import 'dart:io';

import 'package:cpdn_cli/src/cli.dart';

void main(List<String> arguments) {
  final cli = Cli();
  cli.ProcessCommand(List<String>.from(arguments));
}
