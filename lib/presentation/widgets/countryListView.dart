// ignore_for_file: file_names
import 'package:ezcountry/cubit/allCountry/allCountryCubit.dart';
import 'package:ezcountry/cubit/searchList/searchListCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/model.dart';
import 'countryViewCard.dart';

class CountryListView extends StatefulWidget {
  const CountryListView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<List<Countrys>> snapshot;

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  @override
  Widget build(BuildContext context) {
      BlocProvider.of<AllCountryCubit>(context).listAllCountries(widget.snapshot.data);
      return BlocConsumer<SearchListCubit, SearchListState>(
        listener: (searchListContext, searchListState) {
        },
        builder: (searchListContext, searchListState) {
          return searchListState.items.isEmpty?
          ListView.builder(
              itemCount: widget.snapshot.data==null?0:widget.snapshot.data!.length,
              itemBuilder: (BuildContext context, index) {
                Countrys project = widget.snapshot.data![index];
                widget.snapshot.data!
                    .sort((a, b) => a.name.compareTo(b.name));
                return CountryViewCard(
                  countryName: project.name,
                  countryCode: project.code,
                  flag: project.emoji!,
                  languages: project.languages!,
                );
              }):
          ListView.builder(
              itemCount: searchListState.items.length,
              itemBuilder: (BuildContext context, index) {
                Countrys project = searchListState.items[index];
                searchListState.items
                    .sort((a, b) => a.name.compareTo(b.name));
                return CountryViewCard(
                  countryName: project.name,
                  countryCode: project.code,
                  flag: project.emoji!,
                  languages: project.languages!,
                );
              });
        },
      );
  }
}
