import 'package:flutter/material.dart';
import 'package:sample/src/wanted/type_1.dart';

class WantedHome extends StatefulWidget {
  const WantedHome({Key? key}) : super(key: key);

  @override
  State<WantedHome> createState() => _WantedHomeState();
}

class _WantedHomeState extends State<WantedHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff434343),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Type1(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '채용'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: '내 정보'),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined), label: 'MY 원티드'),
        ],
      ),
    );
  }
}
