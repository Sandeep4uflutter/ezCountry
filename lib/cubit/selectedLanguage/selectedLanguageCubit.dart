// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
part 'selectedLanguageState.dart';

class SelectedLanguageCubit extends Cubit<SelectedLanguageState>{
  SelectedLanguageCubit() : super(SelectedLanguageState(selectedLanguage: null));
  void setSelectedLang(String? selectedLanguage) => emit(SelectedLanguageState(selectedLanguage: selectedLanguage));
}