import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_32/bloc/event.dart';
import 'package:lab_32/bloc/state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(InitialState()) {
    on<LoadDataEvent>(_loadData);
   
  }

  Future<void> _loadData(
    LoadDataEvent event,
    Emitter<CharactersState> emit
  ) async {
    try {
      emit(LoadingState());
      final String myurl="https://www.breakingbadapi.com/api/characters/${event.url}";
      final url = Uri.parse(myurl);
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(url);
      if (response.statusCode != 200) {
        emit(FailedState(errorMessage: response.statusCode.toString()));
      }
      final decodedResponse = jsonDecode(response.body);
      emit(LoadedState(data: decodedResponse));
    } catch (e) {
      emit(FailedState(errorMessage: e.toString()));
    }
  }
}