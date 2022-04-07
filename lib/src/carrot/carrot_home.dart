import 'package:flutter/material.dart';

class CarrotHome extends StatelessWidget {
  const CarrotHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 1,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('금정동', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Colors.black)),
          IconButton(onPressed: () {}, icon: Icon(Icons.doorbell, color: Colors.black)),
        ],
      ),
      body: Container(color: Colors.purpleAccent),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    Widget _item(IconData icon, String title, {Widget? notification, onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(icon, size: 28),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(fontSize: 12)),
              ]),
            ),
            notification ?? const SizedBox(),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _item(Icons.home, '홈'),
        _item(Icons.receipt_long_outlined, '동네생활'),
        _item(Icons.pin_drop_outlined, '내 근처'),
        _item(
          Icons.chat_bubble_outline,
          '채팅',
          notification: Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                child: Text('1', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ),
        ),
        _item(
          Icons.person_outline,
          '나의 당근',
          notification: Positioned(
            top: 6,
            right: 8,
            child: Container(width: 5, height: 5, decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle)),
          ),
        ),
      ],
    );
  }
}

enum MenuType { HOME, TOWN, LOCATION, CHAT, MYPAGE }

