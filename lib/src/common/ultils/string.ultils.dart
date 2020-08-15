class StringUtils {
  static String toPascalCase(String value) {
    var listWords = value.split(' ');
    var pascalCase = '';
    listWords.forEach((element) {
      element =
          '${element[0].toUpperCase()}${element.substring(1).toLowerCase()}';
      pascalCase += element;
    });
    return pascalCase;
  }

  static String toSnakeCase(String value) {
    return value.replaceAll(' ', '_');
  }
}
