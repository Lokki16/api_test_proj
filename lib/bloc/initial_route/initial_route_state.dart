part of 'initial_route_bloc.dart';

@immutable
abstract class InitialRouteState {}

class InitialRouteInitialState extends InitialRouteState {
  final bool isAuthorized;

  InitialRouteInitialState({required this.isAuthorized});
}
