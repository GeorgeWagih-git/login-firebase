import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/theme_bloc/theme_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvents, bool> {
  ThemeBloc() : super(false) {
    on<InitTheme>((event, emit) async {
      var shared = await SharedPreferences.getInstance();
      final isDark = shared.getBool('theme') ?? false;
      emit(isDark);
    });

    on<ChangeTheme>((event, emit) async {
      var shared = await SharedPreferences.getInstance();
      await shared.setBool('theme', event.isDark);

      emit(event.isDark);
    });
  }
}
