// ignore_for_file: file_names
import 'package:ezcountry/cubit/searchIndex/searchIndexCubit.dart';
import 'package:ezcountry/cubit/searchList/searchListCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SearchCountry {
  List dummyItems = [];
  List indexVal = [];
  Future<void> filterSearchResults(
      BuildContext context, String query, var countries) async {
    BlocProvider.of<SearchIndexCubit>(context).indexList([]);
    List dummySearchList = [];
    dummySearchList.addAll(countries);
    if (query.isNotEmpty) {
      List dummyListData = [];
      for (var item in dummySearchList) {
        if (item.code.toString().toLowerCase() == query.toLowerCase()) {
          dummyListData.add(item);
        }
      }
      BlocProvider.of<SearchListCubit>(context).listItems([]);
      dummyItems.clear();
      BlocProvider.of<SearchListCubit>(context).listItems(dummyListData);
      dummyItems.addAll(dummyListData);
      indexVal.clear();
      BlocProvider.of<SearchIndexCubit>(context).indexList([]);
      for (var i = 0; i < dummyItems.length; i++) {
        final index = dummySearchList
            .indexWhere((element) => element.code == dummyItems[i].code);
        indexVal.add(index);
      }
      BlocProvider.of<SearchIndexCubit>(context).indexList(indexVal);
      if (indexVal.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No country with this country code"),
            duration: Duration(milliseconds: 300),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {}
      BlocProvider.of<SearchListCubit>(context).listItems([]);
      dummyItems.clear();
      for (var i = 0; i < indexVal.length; i++) {
        dummyItems.add(countries[int.parse(indexVal[i].toString())]);
      }
      BlocProvider.of<SearchListCubit>(context).listItems(dummyItems);
      return;
    } else {
      BlocProvider.of<SearchListCubit>(context).listItems([]);
      dummyItems.clear();
    }
  }
}
