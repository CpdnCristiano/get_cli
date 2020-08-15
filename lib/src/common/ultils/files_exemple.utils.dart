class FileExempleUtils {
  static String createTextController(String name) {
    return '''
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ${name}Controller extends GetxController{

  ${name}Controller({@required Map screenArgs});

  //TODO: ${name}Controller
}
''';
  }

  static String createTextScreen(String name, String snakeCase) {
    return '''
import 'controllers/$snakeCase.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ${name}Screen extends GetView<${name}Controller> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('${name}Screen '),
      centerTitle: true,),
      body: Center(
        child: Text('${name}Screen  is working', style: TextStyle(fontSize:20),),
      ),
    );
  }
}
''';
  }

  static String createTextWidget(String name) {
    return '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ${name}Widget extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
}''';
  }

  static String createTextRoutes() {
    return '''
class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    return null;
  }
}''';
  }
}
