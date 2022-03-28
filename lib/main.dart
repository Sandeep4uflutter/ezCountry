// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/allCountry/allCountryCubit.dart';
import 'cubit/searchIndex/searchIndexCubit.dart';
import 'cubit/searchList/searchListCubit.dart';
import 'cubit/selectedLanguage/selectedLanguageCubit.dart';
import 'presentation/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchListCubit>(
            create: (BuildContext context) => SearchListCubit(),
          ),
          BlocProvider<AllCountryCubit>(
            create: (BuildContext context) => AllCountryCubit(),
          ),
          BlocProvider<SearchIndexCubit>(
            create: (BuildContext context) => SearchIndexCubit(),
          ),
          BlocProvider<SelectedLanguageCubit>(
            create: (BuildContext context) => SelectedLanguageCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ez Country',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ));
  }
}
