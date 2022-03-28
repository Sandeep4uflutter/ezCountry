// ignore_for_file: file_names

import '../api/getAllLanguages.dart';
import '../models/languageModel.dart';

mixin GetAllLanguage{
  Future<List<Languages>> futureLang = getAllLanguages();
}