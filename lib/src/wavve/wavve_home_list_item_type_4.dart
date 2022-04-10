import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home_list_item_base.dart';

class ListItemType4 extends StatelessWidget {
  const ListItemType4({Key? key}) : super(key: key);

  Widget _item({required String image, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Stack(children: [Image.network(image, width: 100, height: 140, fit: BoxFit.cover)]),
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
      title: '#심장아 침착해, 내 연애 아니야',
      onTapMore: () {
        print("111");
      },
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            14,
            (index) => _item(image: 'https://img2.sbs.co.kr/img/sbs_cms/SR/2018/02/01/SR94496579_w1280_h720.jpg', title: '인해지중우견니'),
          ),
        ),
      ),
    );
  }
}
