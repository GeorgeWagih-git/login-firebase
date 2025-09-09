abstract class ThemeEvents {}

class InitTheme extends ThemeEvents {}

class ChangeTheme extends ThemeEvents {
  bool isDark;
  ChangeTheme({required this.isDark});
}
