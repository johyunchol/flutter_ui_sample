import 'package:flutter/material.dart';
import 'package:sample/src/wavve/wavve_home_list_item_base.dart';

class ListItemType2 extends StatelessWidget {
  const ListItemType2({Key? key}) : super(key: key);

  Widget _item({required String image, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipOval(
              child: Stack(children: [
                Image.network(image, width: 80, height: 80, fit: BoxFit.cover), /// 컨텐츠 이미지
                Container(width: 80, height: 80, child: CircularProgressIndicator(value: 0.8, strokeWidth: 5)), /// 현재까지 얼마나 봤는지 progress
              ])),
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 60,
            child: Text(title, style: TextStyle(color: Colors.grey, fontSize: 16), textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListItemBase(
      title: '#시청 중 콘텐츠',
      onTapMore: () {
        print("111");
      },
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            14,
            (index) => _item(image: 'https://img.wavve.com/201802/20180212/1afc3f891f8ea85030a0cb1f176f6f7d_w504_square.jpg?timestamp=1649598683657', title: '뿌리깊은 나무'),
          ),
        ),
      ),
    );
  }
}
