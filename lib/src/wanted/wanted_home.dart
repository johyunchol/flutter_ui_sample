import 'package:flutter/material.dart';
import 'package:sample/src/wanted/type_1.dart';
import 'package:sample/src/wanted/type_2.dart';
import 'package:sample/src/wanted/type_3.dart';
import 'package:sample/src/wanted/type_4.dart';
import 'package:sample/src/wanted/type_5.dart';
import 'package:sample/src/wanted/type_6.dart';

class WantedHome extends StatelessWidget {
  const WantedHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff434343),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Type1(),
                Type2(),
                Container(height: 8, color: Colors.black),
                Type3(),
                Type4(),
                Type5(),
                Container(height: 8, color: Colors.black),
                Type6(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
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
