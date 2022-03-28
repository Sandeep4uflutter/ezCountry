// ignore_for_file: file_names
import '../api/getAllCountries.dart';
import '../models/model.dart';

mixin GetAllCountries{
  Future<List<Countrys>> future = getAllCountries();
}