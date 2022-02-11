import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';

import './provider/constants.dart';
import './screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemTheme.accentInstance.load();
  runApp(const MyApp());
  doWhenWindowReady(() {
    final initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final accentColor = SystemTheme.accentInstance.accent;
    return ChangeNotifierProvider(
      create: (ctx) => Const(),
      builder: (context, _) {
        return FluentApp(
          debugShowCheckedModeBanner: false,
          title: 'Chamting',
          theme: ThemeData(
            accentColor: Colors.green,
            brightness: Brightness.dark,
            visualDensity: VisualDensity.comfortable,

            // navigationPaneTheme: const NavigationPaneThemeData(
            //
            //   backgroundColor: Color.fromRGBO(161, 208, 0, 0.432),
            //   animationDuration: Duration(milliseconds: 20),
            // ),
          ),

          // home: HomeScreen(),
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
