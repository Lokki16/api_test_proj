part of 'initial_route_bloc.dart';

@immutable
abstract class InitialRouteState {}

class InitialRouteInitialState extends InitialRouteState {}

class InitialRouteErrorState extends InitialRouteState {}

class InitialRouteLoadedState extends InitialRouteState {
  final bool isAuthorized;

  InitialRouteLoadedState({required this.isAuthorized});
}
