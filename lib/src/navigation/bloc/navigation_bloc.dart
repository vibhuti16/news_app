import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(Opened(pageIndex: 0)){
    on<NavigationEvent>(loadNavigation);
  }

  void loadNavigation(event, Emitter<NavigationState> emitter) async{
    if (event is Navigate) {
      emit(Opened(pageIndex: event.pageIndex));
    }
  }

  // @override
  // Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
  //   if (event is Navigate) {
  //     yield Opened(pageIndex: event.pageIndex);
  //   }
  // }
}
