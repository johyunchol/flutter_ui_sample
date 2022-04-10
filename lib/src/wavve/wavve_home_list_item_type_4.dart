import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home_list_item_base.dart';

class ListItemType4 extends StatelessWidget {
  const ListItemType4({Key? key, required this.title, this.onTapMore}) : super(key: key);

  final String title;
  final GestureTapCallback? onTapMore;

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

  @override
  Widget build(BuildContext context) {
    return ListItemBase(
      title: title,
      onTapMore: onTapMore,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            14,
            (index) => _item(image: 'https://img.wavve.com/BMS/program_poster/202201/M_1003594100000100000-2_RE_w312_h468_q75.jpg', title: '전지적 참견시점'),
          ),
        ),
      ),
    );
  }
}