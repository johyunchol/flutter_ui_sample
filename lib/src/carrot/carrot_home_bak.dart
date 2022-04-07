import 'package:flutter/material.dart';

class CarrotHome2 extends StatelessWidget {
  const CarrotHome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: Colors.purpleAccent),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.home),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                    ))
              ],
            ),
            label: 'title',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'title',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'title',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'title',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'title',
          ),
        ],
      ),

      /*bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.home, size: 30), SizedBox(height: 4), Text('홈')],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.receipt_long_outlined, size: 30, color: Colors.grey), SizedBox(height: 4), Text('동네생활')],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.pin_drop_outlined, size: 30, color: Colors.grey), SizedBox(height: 4), Text('내 근처')],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [Icon(Icons.pin_drop_outlined, size: 30, color: Colors.grey), SizedBox(height: 4), Text('내 근처')],
                    ),
                  ),
                  Positioned(top: 0, right: 0, child: Container(color: Colors.redAccent, child: Text('1', style: TextStyle(color: Colors.white))))
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                color: Colors.blue,
              ),
            ),
          ],
        )*/
    );
  }
}
