// ignore_for_file: file_names
const getCountries = r'''
query {
  countries {
    code,
    name,
    emoji,
    languages {
      code,
      name
    }
  }
  }
''';