// ignore_for_file: file_names, must_be_immutable
import 'package:ezcountry/constant/textConstants/appText.dart';
import 'package:ezcountry/cubit/selectedLanguage/selectedLanguageCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/colorConstant/colorConstants.dart';
import '../../functions/allCountries.dart';
import '../../functions/allLanguage.dart';
import '../../functions/filterCountry.dart';
import '../../functions/searchCountry.dart';
import '../../models/languageModel.dart';
import '../../models/model.dart';

class SearchFilter extends StatefulWidget with SearchCountry {
  SearchFilter({Key? key, required this.filterVisible, required this.snapshot})
      : super(key: key);
  final bool filterVisible;
  final AsyncSnapshot<List<Countrys>> snapshot;

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter>
    with FilterCountry, GetAllCountries, SearchCountry, GetAllLanguage {
  String? selectedLanguage;
  List<DropdownMenuItem<String>> buildDropDownItem(List<Languages> languages) {
    return languages
        .map((languages) => DropdownMenuItem<String>(
              child: Text(languages.name),
              value: languages.name,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.dashboardAppAppBarColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FutureBuilder<List<Languages>>(
                future: futureLang,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: snapshot.connectionState == ConnectionState.done
                        ? BlocConsumer<SelectedLanguageCubit, SelectedLanguageState>(
                            listener: (selectedLanguageContext, selectedLanguageState) {},
                            builder: (selectedLanguageContext, selectedLanguageState) {
                              return DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelText: "Filter Using Language",
                                  border: OutlineInputBorder(),
                                ),
                                items: buildDropDownItem(snapshot.data!),
                                value: selectedLanguageState.selectedLanguage,
                                onChanged: (String? lang) {
                                  BlocProvider.of<SelectedLanguageCubit>(context).setSelectedLang(lang);
                                  filter(context, lang!, widget.snapshot.data);
                                },
                              );
                            })
                        : const Center(
                            child: LinearProgressIndicator(),
                          ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: AppTextConstant.searchFieldHintText,
                        isDense: true,
                        prefixIconConstraints: BoxConstraints(
                            maxHeight: 20,
                            minHeight: 20,
                            maxWidth: 30,
                            minWidth: 30),
                        prefixIcon: Icon(Icons.search)),
                    onChanged: (text) {
                      filterSearchResults(context, text, widget.snapshot.data);
                      BlocProvider.of<SelectedLanguageCubit>(context).setSelectedLang(null);
                    },
                  )),
            ),
          )
        ],
      ),
    );
  }
}
