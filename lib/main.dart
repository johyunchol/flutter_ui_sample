import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/src/baemin/baemin_home.dart';
import 'package:sample/src/carrot/carrot_home.dart';
import 'package:sample/src/kakaotalk/chat_room_list.dart';
import 'package:sample/src/toss/toss_remittance.dart';
import 'package:sample/src/wavve/wavve_home.dart';

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
        brightness: Brightness.dark,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
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
  List<Map<String, dynamic>> list = [
    {
      'title': '카카오 채팅방 UI',
      'func': () => Get.to(const ChatRoomList()),
    },
    {
      'title': '배달의민족 홈 UI',
      'func': () => Get.to(const BaeminHome()),
    },
    {
      'title': '당근마켓 홈 UI',
      'func': () => Get.offAll(const CarrotHome()),
    },
    {
      'title': 'WAVVE 홈 UI',
      'func': () => Get.offAll(const WavveHome()),
    },
    {
      'title': 'Toss 송금 UI',
      'func': () => Get.offAll(const TossRemittance()),
    }
  ];

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
        )
        /*body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChatRoomList()));
              },
              child: Text('카톡채팅방 UI'))
        ],
      ),*/
        );
  }
}
