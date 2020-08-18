class InitFiles {
  static Map<String, String> files = {
    'main.dart': '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/theme.dart';

void main() async {

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: themeData,
    );
    
  }
}
  ''',
    'counter.screen.dart': '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/counter.controller.dart';

class CounterScreen extends GetView<CounterController> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page with GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                // Use Obx(()=> to update Text() whenever count is changed.
                controller.count.string,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: controller.increment),
    );
  }
}
''',
    'counter.controller.dart': '''
import 'package:get/get.dart';

class CounterController extends GetxController{
  var count = 0.obs;
  increment() => count.value++;
}

''',
    'counter.controller.binding.dart': '''
import '../../../../presentation/counter/controllers/counter.controller.dart';
import 'package:get/get.dart';

class CounterControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(
          () => CounterController(),
    );
  }
}''',
    'app_bar.theme.dart': '''
import 'package:flutter/material.dart';

AppBarTheme appBarTheme = AppBarTheme();
''',
    'button.theme.dart': '''
import 'package:flutter/material.dart';

ButtonThemeData buttonTheme = ButtonThemeData();
''',
    'colors.theme.dart': '''
import 'package:flutter/material.dart';

class ColorsTheme {
  static Color primaryColor = Color(0xFF1976D2);
}
''',
    'text.theme.dart': '''
import 'package:flutter/material.dart';

TextTheme textTheme = TextTheme();
''',
    'theme.dart': '''
import 'package:flutter/material.dart';

import 'app_bar.theme.dart';
import 'button.theme.dart';
import 'colors.theme.dart';
import 'text.theme.dart';

ThemeData themeData = ThemeData(
  primaryColor: ColorsTheme.primaryColor,
  appBarTheme: appBarTheme,
  buttonTheme: buttonTheme,
  textTheme: textTheme,
);
''',
    'routes.dart': '''
class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    return null;
  }
}''',
    'routes.dart.example': '''
class Routes {
  static Future<String> get initialRoute async {
    return COUNTER;
  }
  static const COUNTER = 'counter';
}''',
    'navigation.dart': '''
import '../../infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class Nav {
  static List<GetPage> routes = [
  ];
}
''',
    'navigation.dart.example': '''
import '../../infrastructure/navigation/bindings/controllers/counter.controller.binding.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../presentation/counter/counter.screen.dart';
import 'package:get/get.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.COUNTER,
      page: () => CounterScreen(),
      binding: CounterControllerBinding(),
    ),
  ];
}
'''
  };
}
