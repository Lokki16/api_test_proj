import 'package:api_test_proj/presentation/template/template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'initial_route_event.dart';
part 'initial_route_state.dart';

class InitialRouteBloc extends Bloc<InitialRouteEvent, InitialRouteState> {
  InitialRouteBloc() : super(InitialRouteInitialState()) {
    on<InitialRouteFetchEvent>(_initialRouteFetchEvent);
  }

  void _initialRouteFetchEvent(
    InitialRouteEvent event,
    Emitter<InitialRouteState> emit,
  ) async {
    emit(InitialRouteInitialState());

    try {
      final isAuthorized = await RenewTokenRepository().renewToken();
      emit(InitialRouteLoadedState(isAuthorized: isAuthorized));
    } catch (e) {
      emit(InitialRouteErrorState());
    }
  }
}
