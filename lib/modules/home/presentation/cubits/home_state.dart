import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object?> get props => [];
}

class HomeSucees extends HomeState {
  // final Pokemon pokemon;
  const HomeSucees();

  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  const HomeError();

  @override
  List<Object?> get props => [];
}
