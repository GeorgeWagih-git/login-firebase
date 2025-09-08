import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/theme_bloc/theme_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvents, bool> {
  ThemeBloc() : super(true) {
    on<InitTheme>((event, emit) async {
      var shared = await SharedPreferences.getInstance();
      final isflase = shared.getBool('theme') ?? false;
      emit(isflase);
    });
    on<ChangeTheme>((event, emit) async {
      var shared = await SharedPreferences.getInstance();
      await shared.setBool('theme', event.isLight);
      print('from event 🖨️ : ${event.isLight} ');
      emit(event.isLight);
    });
  }
}
