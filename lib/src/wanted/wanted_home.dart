import 'package:flutter/material.dart';

class WantedHome extends StatefulWidget {
  const WantedHome({Key? key}) : super(key: key);

  @override
  State<WantedHome> createState() => _WantedHomeState();
}

class _WantedHomeState extends State<WantedHome> {
  PageController _pageController = PageController(viewportFraction: 0.8);

  Color backgroundColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff434343),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: backgroundColor,
              shadowColor: Colors.transparent,
              leading: SizedBox(),
              leadingWidth: 0,
              title: Text('wanted', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30)),
              actions: [
                Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.search_outlined, size: 30,)),
                Stack(
                  children: [
                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.add_alert_outlined))),
                    Positioned(
                        top: 12,
                        right: 8,
                        child: Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
            const Divider(height: 0.5, color: Colors.grey),

            Container(
              width: double.infinity,
              color: backgroundColor,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Text('EVENT', style: TextStyle(color: backgroundColor, fontWeight: FontWeight.w900),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 240,
              color: backgroundColor,
              child: PageView(
                controller: _pageController,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(50))),
                  Container(decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50))),
                  Container(decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(50))),
                  Container(decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50))),
                  Container(decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(50))),
                  Container(decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(50))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
