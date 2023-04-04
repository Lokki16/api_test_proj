import 'package:api_test_proj/presentation/template/template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'initial_route_event.dart';
part 'initial_route_state.dart';

class InitialRouteBloc extends Bloc<InitialRouteEvent, InitialRouteState> {
  bool isAuthorized;

  InitialRouteBloc({this.isAuthorized = false})
      : super(InitialRouteInitialState(isAuthorized: false)) {
    on<InitialRouteEvent>(_initialRouteEvent);
  }

  void _initialRouteEvent(
    InitialRouteEvent event,
    Emitter<InitialRouteState> emit,
  ) async {
    isAuthorized = await RenewTokenRepository().renewToken();

    emit(InitialRouteInitialState(isAuthorized: isAuthorized));
  }
}
