import 'dart:io';
import 'package:get_cli/arctekko.dart';

void CreateDirectory(String path, bool skipExample) async {
  var widgetFile = File('./test/widget_test.dart');
  if (await widgetFile.existsSync()) await widgetFile.deleteSync();
  var dirs = [
    'lib/common/widgets/',
    'lib/domain/core/interfaces/',
    'lib/infrastructure/navigation/bindings/controllers/',
    'lib/infrastructure/navigation/bindings/domains/',
    'lib/infrastructure/dal/daos/',
    'lib/infrastructure/dal/services',
    'lib/presentation/'
  ];
  var dirTheme = 'lib/infrastructure/theme/';
  dirs.add(dirTheme);

  var themeFiles = [
    'app_bar.theme.dart',
    'button.theme.dart',
    'colors.theme.dart',
    'text.theme.dart',
    'theme.dart'
  ];
  var orthersFiles = [
    {
      'filename': 'main.dart',
      'path': 'lib/',
      'content': InitFiles.files['main.dart']
    },
    {
      'filename': 'navigation.dart',
      'path': 'lib/infrastructure/navigation/',
      'content': InitFiles.files['navigation.dart']
    },
    {
      'filename': 'routes.dart',
      'path': 'lib/infrastructure/navigation/',
      'content': InitFiles.files['routes.dart']
    },
  ];

  dirs.forEach((dir) async {
    path = path.endsWith('/') ? path : '$path/';
    await Utils.createDiretory('$path$dir');
  });
  themeFiles.forEach((fileName) async {
    path = path.endsWith('/') ? path : '$path/';
    dirTheme = dirTheme.endsWith('/') ? dirTheme : '$dirTheme/';
    await _createFile('$path$dirTheme', fileName);
    await _writeFile('$path$dirTheme', fileName);
  });
  _createOrtherFiles(orthersFiles);
  if (!skipExample) {
    await _createCounter();
  }
}

void _createFile(String path, String name) async {
  path = path.endsWith('/') ? path : '$path/';
  if (!await Utils.existsFile('$path$name')) {
    await Utils.createFile('$path$name');
  }
}

void _createOrtherFiles(orthersFiles) async {
  orthersFiles.forEach((e) async {
    var path = e['path'].endsWith('/') ? e['path'] : '${e["path"]}/';
    var name = e['filename'];
    var content = e['content'];
    await _createFile(path, name);
    await Utils.writeFile('$path$name', content);
  });
}

void _writeFile(String path, String name) async {
  path = path.endsWith('/') ? path : '$path/';
  if (await Utils.existsFile('$path$name')) {
    await Utils.writeFile('$path$name', InitFiles.files[name]);
  }
}

void _createCounter() async {
  var counterfiles = [
    {
      'filename': 'navigation.dart',
      'path': 'lib/infrastructure/navigation/',
      'content': InitFiles.files['navigation.dart.example']
    },
    {
      'filename': 'routes.dart',
      'path': 'lib/infrastructure/navigation/',
      'content': InitFiles.files['routes.dart.example']
    },
    {
      'filename': 'counter.controller.binding.dart',
      'path': 'lib/infrastructure/navigation/bindings/controllers',
      'content': InitFiles.files['counter.controller.binding.dart']
    },
    {
      'filename': 'counter.screen.dart',
      'path': 'lib/presentation/counter',
      'content': InitFiles.files['counter.screen.dart']
    },
    {
      'filename': 'counter.controller.dart',
      'path': 'lib/presentation/counter/controllers',
      'content': InitFiles.files['counter.controller.dart']
    },
  ];
  await _createOrtherFiles(counterfiles);
}
