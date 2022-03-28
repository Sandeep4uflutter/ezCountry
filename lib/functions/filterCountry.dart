// ignore_for_file: file_names
import 'package:ezcountry/cubit/searchIndex/searchIndexCubit.dart';
import 'package:ezcountry/cubit/searchList/searchListCubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/model.dart';

mixin FilterCountry {
  List dummyItems = [];
  List indexVal = [];
  Future<void> filter(BuildContext context, String query, var countries) async {
    BlocProvider.of<SearchIndexCubit>(context).indexList([]);
    List dummySearchList = [];
    dummySearchList.addAll(countries);
    if(query.isNotEmpty) {
      List dummyListData = [];
      for (var item in dummySearchList) {
        debugPrint(item.toString());
        for(var i=0; i<item.languages.length; i++) {
          Language lang = item.languages![i];
          if(lang.name.toString().toLowerCase()==query.toLowerCase()) {
              dummyListData.add(item);
          }
        }
        if (kDebugMode) {
          print(dummyListData.toString());
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
            content: Text("No country with this language"),
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
