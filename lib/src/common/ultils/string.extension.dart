extension StringUtils on String {
  String toPascalCase() {
    trim();
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
    trim();
    return replaceAll(' ', '_').toLowerCase();
  }

  String replaceSpaceTo(String value) {
    trim();
    return replaceAll(' ', value).toLowerCase();
  }
}
