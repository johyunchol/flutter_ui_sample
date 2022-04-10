import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home.dart';

Widget type6(String title, List<ContentsItem> list) {
  Widget _item(ContentsItem item) {
    return Builder(builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.imageUrl, width: MediaQuery.of(context).size.width * 0.7, height: 180, fit: BoxFit.cover),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        item.title,
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        item.subTitle!,
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: item.isChecked! ? Icon(Icons.add_box, color: Colors.blue) : Icon(Icons.add_box_outlined, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
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
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: list.map((item) => _item(item)).toList()),
      ),
    ],
  );
}
