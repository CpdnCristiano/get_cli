import 'package:get_cli/arctekko.dart';

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

  static String createTextScreen(String name) {
    return '''
import 'controllers/${name.toSnakeCase()}.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ${name.toPascalCase()}Screen extends GetView<${name.toPascalCase()}Controller> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('${name.toPascalCase()}Screen '),
      centerTitle: true,),
      body: Center(
        child: Text('${name.toPascalCase()}Screen  is working', style: TextStyle(fontSize:20),),
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

  static String createTextBinding(String name) {
    return '''
import '../../../../presentation/${name.toSnakeCase()}/controllers/${name.toSnakeCase()}.controller.dart';
import 'package:get/get.dart';

class ${name.toPascalCase()}ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${name.toPascalCase()}Controller>(
          () => ${name.toPascalCase()}Controller(screenArgs: Get.arguments),
    );
  }
}''';
  }
}
