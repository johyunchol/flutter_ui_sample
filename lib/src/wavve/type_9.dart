import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget type9() {
  List<String> list = [
    '1111111111111111111111111111',
    '2222222222222222222222222222',
    '3333333333333333333333333333',
    '4444444444444444444444444444',
    '5555555555555555555555555555',
  ];

  PageController controller = PageController(initialPage: 0);

  void timer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      int page = controller.page!.toInt();

      if (page >= (list.length - 1)) {
        page = 0;
      }

      controller.animateToPage(page, duration: const Duration(seconds: 400), curve: Curves.easeIn);
    });
  }

  Widget _notice() {
    timer();

    return Container(
      height: 50,
      color: Color(0xFF161616),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Stack(
              children: [
                Icon(Icons.volume_up),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(color: Colors.purpleAccent, shape: BoxShape.circle),
                    )),
              ],
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(list[index]),
                  ],
                );
              },
              itemCount: list.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  return Column(
    children: [
      _notice(),
    ],
  );
}
