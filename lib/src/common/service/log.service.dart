
import 'package:ansicolor/ansicolor.dart';

final AnsiPen _penError = AnsiPen()..red(bold: true);
final AnsiPen _penSuccess = AnsiPen()..green(bold: true);
final AnsiPen _penInfo = AnsiPen()..yellow(bold: true);
void logError(msg){
  print(_penError(msg));
}
void logSuccess(msg){
  print(_penSuccess(msg));
}
void logInfo(msg){
  print(_penInfo(msg));
}
