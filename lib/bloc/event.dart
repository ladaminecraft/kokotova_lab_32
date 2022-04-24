import 'package:equatable/equatable.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends CharactersEvent {
  final String url;


  const LoadDataEvent({required this.url,});
}