extension StringUtils on String {
  String toPascalCase() {
    trimLeft();
    trimRight();
    var listWords = split(' ');
    var pascalCase = '';
    listWords.forEach((element) {
      element =
          '${element[0].toUpperCase()}${element.substring(1).toLowerCase()}';
      pascalCase += element;
    });
    return pascalCase;
  }

  String toSnakeCase() {
    trimLeft();
    trimRight();
    return replaceAll(' ', '_').toLowerCase();
  }
}
