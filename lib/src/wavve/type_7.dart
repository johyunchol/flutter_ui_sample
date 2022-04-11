import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home.dart';

class Type7 extends StatefulWidget {
  const Type7({Key? key, required this.title, required this.list}) : super(key: key);

  final String title;
  final List<ContentsItem> list;

  @override
  State<Type7> createState() => _Type7State();
}

class _Type7State extends State<Type7> {
  @override
  Widget build(BuildContext context) {
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
              child: Text(item.title, style: const TextStyle(color: Colors.grey, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
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
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(widget.title, style: const TextStyle(fontSize: 18, color: Colors.white))]),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(widget.list.length, (index) => _item(widget.list[index], index)),
          ),
        ),
      ],
    );
  }
}
