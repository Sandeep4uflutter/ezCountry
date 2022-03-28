// ignore_for_file: file_names
import 'package:graphql/client.dart';
import '../models/languageModel.dart';
import '../queries/allLanguageQuery.dart';
import 'api.dart';

Future<List<Languages>> getAllLanguages() async {
  var result = await client.query(
    QueryOptions(
      document: gql(getAllLanguage),
    ),
  );
  if (result.hasException) {
    throw result.exception!;
  }
  var json = result.data!["languages"];
  List<Languages> lang = [];
  for (var res in json) {
    var languages = Languages.fromJson(res);
    lang.add(languages);
  }
  return lang;
}