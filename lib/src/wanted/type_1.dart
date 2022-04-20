import 'dart:async';

import 'package:flutter/material.dart';

class Type1 extends StatefulWidget {
  const Type1({Key? key}) : super(key: key);

  @override
  State<Type1> createState() => _Type1State();
}

class _Type1State extends State<Type1> {
  late PageController _pageController;
  List<Color> pageColors = [Colors.blue, Colors.green, Colors.black, Colors.orange, Colors.cyan];
  Timer? timer;
  int currentIndex = 0;

  _timer() async {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      setState(() {
        _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      });
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: pageColors.length * 100, viewportFraction: 0.8);
    _timer();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          backgroundColor: pageColors[currentIndex],
          shadowColor: Colors.transparent,
          leading: const SizedBox(),
          leadingWidth: 0,
          title: const Text('wanted', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30)),
          actions: [
            const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search_outlined, size: 30)),
            Stack(
              children: [
                const Center(child: Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.add_alert_outlined))),
                Positioned(top: 12, right: 8, child: Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle))),
              ],
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Container(width: 30, height: 30, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)))
          ],
        ),
        const Divider(height: 0.5, color: Colors.grey),
        Container(
          width: double.infinity,
          color: pageColors[currentIndex],
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text('EVENT', style: TextStyle(color: pageColors[currentIndex], fontWeight: FontWeight.w900)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text("'더 나은 리더'가 되는 법", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
              const SizedBox(height: 8),
              const Text("[무료] 리더십 아티클, 영상 공개", style: TextStyle(fontSize: 16))
            ],
          ),
        ),
        Stack(
          children: [
            Container(height: 120, color: pageColors[currentIndex]),
            Container(
              height: 140,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => currentIndex = index % pageColors.length);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(decoration: BoxDecoration(color: pageColors[index % pageColors.length], borderRadius: BorderRadius.circular(8))),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
