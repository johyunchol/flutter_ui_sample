import 'package:flutter/material.dart';

Widget type8() {
  Widget _textComponent({
    required String title,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: color),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ),
    );
  }
  
  Widget _item({required String image, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 180,
            child: Stack(
              children: [
                Image.network(image, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textComponent(title: '개별구매', color: Colors.redAccent),
                      const SizedBox(height: 4),
                      _textComponent(title: '자막', color: Colors.grey),
                      /*Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textComponent(title: '개별구매', color: Colors.redAccent),
                          const SizedBox(height: 4),
                          _textComponent(title: '자막', color: Colors.grey),
                        ],
                      )*/
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 100,
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('#시청 중 콘텐츠', style: TextStyle(fontSize: 18, color: Colors.white)),
            Text('더보기 〉', style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
      const SizedBox(height: 8),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            14,
            (index) => _item(image: 'https://img.wavve.com/201802/20180212/1afc3f891f8ea85030a0cb1f176f6f7d_w504_square.jpg?timestamp=1649598683657', title: '뿌리깊은 나무'),
          ),
        ),
      ),
    ],
  );
}

