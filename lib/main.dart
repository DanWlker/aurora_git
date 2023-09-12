import 'package:aurora_git/global_variables.dart';
import 'package:aurora_git/repo_list/repo_list_page.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  packageVersion = (await PackageInfo.fromPlatform()).version;

  const windowOptions = WindowOptions(
    size: Size(500, 800),
    minimumSize: Size(500, 750),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: true,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
      ),
      home: const RepoListPage(),
    );
  }
}
