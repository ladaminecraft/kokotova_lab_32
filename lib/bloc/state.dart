import 'package:equatable/equatable.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class InitialState extends CharactersState {}

class LoadingState extends CharactersState {}

class LoadedState extends CharactersState {
  
    final dynamic data ;
  
  const LoadedState({
   required this.data,
  });
  
}

class FailedState extends CharactersState {
  final String errorMessage;

  const FailedState({
    required this.errorMessage,
  });
}