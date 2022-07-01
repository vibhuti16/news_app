import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc() : super(SelectedTheme(themeType: ThemeType.Light)){
    on<ThemeEvent>(onLoadTheme);
  }

  void onLoadTheme(event, Emitter<ThemeState> emitter) async{
    if (event is LightMode) {
      emit(SelectedTheme(themeType: ThemeType.Light));
    } else {
      emit(SelectedTheme(themeType: ThemeType.Dark));
    }
  }

  // @override
  // Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
  //   if (event is LightMode) {
  //     yield SelectedTheme(themeType: ThemeType.Light);
  //   } else {
  //     yield SelectedTheme(themeType: ThemeType.Dark);
  //   }
  // }
}
