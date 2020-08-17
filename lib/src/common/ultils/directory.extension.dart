import 'dart:io';

extension DirectoryUtils on Directory {
  Directory toDynamicDirectory() {
    return Platform.isWindows ? path.replaceAll('/', '\\') : this;
  }
}

extension FileUtils on File {
  File toDynamicFile() {
    return Platform.isWindows ? path.replaceAll('/', '\\') : this;
  }
}
