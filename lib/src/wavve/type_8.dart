import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home.dart';

class Type8 extends StatefulWidget {
  const Type8({Key? key, required this.title, required this.list}) : super(key: key);
  final String title;
  final List<ContentsItem> list;
  @override
  State<Type8> createState() => _Type8State();
}

class _Type8State extends State<Type8> {
  Widget _textComponent({required String title, required Color color}) {
    return Container(decoration: BoxDecoration(color: Colors.black, border: Border.all(color: color)), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0), child: Text(title, style: TextStyle(color: color, fontSize: 12))));
  }

  Widget _item(ContentsItem item, int index) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          SizedBox(width: 120, height: 180,
            child: Stack(
              children: [
                Image.network(item.imageUrl, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textComponent(title: '이벤트', color: Colors.blueAccent),
                      Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        _textComponent(title: '개별구매', color: Colors.redAccent),
                        const SizedBox(height: 4),
                        _textComponent(title: '자막', color: Colors.grey),
                      ])
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(margin: const EdgeInsets.only(top: 4), width: 100, child: Text(item.title, style: const TextStyle(color: Colors.grey, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(widget.title, style: TextStyle(fontSize: 18, color: Colors.white)), Text('더보기 〉', style: TextStyle(fontSize: 18, color: Colors.white))]),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(mainAxisAlignment: MainAxisAlignment.start, children: List.generate(widget.list.length, (index) => _item(widget.list[index], index)))),
      ],
    );
  }
}
