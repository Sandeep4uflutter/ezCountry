// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../models/model.dart';
import '../queries/allCountryQuery.dart';
import 'api.dart';

Future<List<Countrys>> getAllCountries() async {
  var result = await client.query(
    QueryOptions(
      document: gql(getCountries),
    ),
  );
  if (result.hasException) {
    throw result.exception!;
  }
  debugPrint(result.toString());
  var json = result.data!["countries"];
  List<Countrys> countries = [];
  for (var res in json) {
    var country = Countrys.fromJson(res);
    countries.add(country);
  }
  return countries;
}