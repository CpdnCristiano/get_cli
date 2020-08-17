import 'dart:io';

extension DirectoryUtils on Directory {
  Directory toDynamicDirectory() {
    return Platform.isWindows ? Directory(path.replaceAll('/', '\\')) : this;
  }
}

extension FileUtils on File {
  File toDynamicFile() {
    return Platform.isWindows ? File(path.replaceAll('/', '\\')) : this;
  }
}
