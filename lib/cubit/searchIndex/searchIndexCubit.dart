// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
part 'searchIndexState.dart';

class SearchIndexCubit extends Cubit<SearchIndexList> {
  SearchIndexCubit() : super(SearchIndexList(searchIndex: []));
  void indexList(var searchIndex) =>
      emit(SearchIndexList(searchIndex: searchIndex));
}
