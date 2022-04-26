import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        //brightness: Brightness.dark,
        brightness: Brightness.light,
        /* dark theme settings */
      ),
      //themeMode: ThemeMode.dark,
      themeMode: ThemeMode.light,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1);
        },
        itemBuilder: (BuildContext context, int index) {
          return Ink(
            child: InkWell(
              onTap: list[index]['func'],
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    list[index]['title'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
