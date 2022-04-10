import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home.dart';

Widget type4(String title, List<ContentsItem> list) {
  Widget _item({required String image, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Image.network(image, width: 120, height: 180, fit: BoxFit.cover),
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
          children: [Text(title, style: TextStyle(fontSize: 18, color: Colors.white)), Text('더보기 〉', style: TextStyle(fontSize: 18, color: Colors.white))],
        ),
      ),
      const SizedBox(height: 8),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: list.map((item) => _item(image: item.imageUrl, title: item.title)).toList()),
      ),
    ],
  );
}
