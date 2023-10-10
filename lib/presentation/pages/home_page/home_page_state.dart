 import 'package:appskeleton/domain/entities/json_placeholder/json_placeholder.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageLoaded extends HomePageState {
  final List<JsonPlaceholder> jsonPlaceholder;
  const HomePageLoaded(this.jsonPlaceholder);


  @override
  List<Object> get props => [jsonPlaceholder];
}
