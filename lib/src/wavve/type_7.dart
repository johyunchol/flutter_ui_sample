import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home.dart';

Widget type7(String title, List<ContentsItem> list) {
  Widget _item(ContentsItem item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Image.network(item.imageUrl, width: 180, height: 270, fit: BoxFit.cover),
              ),
              Positioned(top: 0, right: 6, child: Text('${index + 1}', style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w700)))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 180,
            child: Text(
              item.title,
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
        // child: Row(mainAxisAlignment: MainAxisAlignment.start, children: list.map((item) => _item(item, index)).toList()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(list.length, (index) => _item(list[index], index)),
        ),
      ),
    ],
  );
}
