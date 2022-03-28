// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
part 'allCountryState.dart';

class AllCountryCubit extends Cubit<AllCountryList> {
  AllCountryCubit() : super(AllCountryList(countries: []));
  void listAllCountries(var countries) =>
      emit(AllCountryList(countries: countries));
}
