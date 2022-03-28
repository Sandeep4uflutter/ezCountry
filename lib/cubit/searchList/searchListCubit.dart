// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
part 'searchListState.dart';

class SearchListCubit extends Cubit<SearchListState>{
  SearchListCubit() : super(SearchListState(items: []));
  void listItems(List items) => emit(SearchListState(items: items));
}