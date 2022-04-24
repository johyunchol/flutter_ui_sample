import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sample/src/kakaobank/constants/colors.dart';

class ContentsItem {
  final String title;
  final int money;
  final Color backgroundColor;
  final Color fontColor;
  final bool isHeader;
  final bool isFavorite;

  ContentsItem({required this.title, required this.money, required this.backgroundColor, required this.fontColor, this.isHeader = false, this.isFavorite = false});
}

class KakaoBankPage extends StatefulWidget {
  const KakaoBankPage({Key? key}) : super(key: key);

  @override
  State<KakaoBankPage> createState() => _KakaoBankPageState();
}

class _KakaoBankPageState extends State<KakaoBankPage> {
  List<ContentsItem> list = [
    ContentsItem(title: '자유적금', money: 10000, backgroundColor: KakaoColors.appColorRed100, fontColor: Colors.black54),
    ContentsItem(title: '조현철의 통장', money: 10000, backgroundColor: KakaoColors.appColorBlue300, fontColor: Colors.white60),
  ];

  Widget _item(int index, ContentsItem item) {
    var f = NumberFormat('###,###,###,###');
    return Material(
      color: Colors.transparent,
      key: ValueKey(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(color: index == -1 ? KakaoColors.appColorMain : item.backgroundColor, borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.star),
              const SizedBox(width: 16),
              Expanded(child: Text(item.title, style: TextStyle(color: item.fontColor))),
              Text('${f.format(item.money)}원', style: TextStyle(color: item.fontColor)),
              const SizedBox(width: 16),
              ReorderableDragStartListener(
                index: index,
                child: index == -1
                    ? const SizedBox(width: 24)
                    : Icon(
                        Icons.menu,
                        color: item.fontColor,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listView() {
    return Column(
      children: [
        ReorderableListView(
          shrinkWrap: true,
          buildDefaultDragHandles: false,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          proxyDecorator: (Widget child, int index, Animation<double> animation) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: child,
            );
          },
          header: _item(-1, ContentsItem(title: '조현철의 통장', money: 10000, backgroundColor: KakaoColors.appColorMain, fontColor: Colors.black54)),
          children: [
            _item(0, ContentsItem(title: '자유적금', money: 10000, backgroundColor: KakaoColors.appColorRed100, fontColor: Colors.black54)),
            _item(1, ContentsItem(title: '조현철의 통장', money: 10000, backgroundColor: KakaoColors.appColorBlue300, fontColor: Colors.white60)),
          ],
          onReorder: (int oldIndex, int newIndex) {},
        ),
        _itemDivider()
      ],
    );
  }

  _itemDivider() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(child: DottedLine(direction: Axis.horizontal, lineThickness: 1.0, dashLength: 4.0, dashColor: Colors.grey)),
          Text(' 위 순서로 홈 화면에 보입니다 ', style: TextStyle(color: Colors.black54)),
          Expanded(child: DottedLine(direction: Axis.horizontal, lineThickness: 1.0, dashLength: 4.0, dashColor: Colors.grey)),
        ],
      ),
    );
  }

  Widget _listView2() {
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      proxyDecorator: (Widget child, int index, Animation<double> animation) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: child,
        );
      },
      header: _item(-1, ContentsItem(title: '조현철의 통장', money: 10000, backgroundColor: KakaoColors.appColorMain, fontColor: Colors.black54)),
      itemBuilder: (BuildContext context, int index) {
        return _item(index, list[index]);
      },
      itemCount: list.length,
      onReorder: (int oldIndex, int newIndex) {},
    );
  }

  Widget _bottom() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: KakaoColors.appColorGrey),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('홈 화면에 금액 표시'),
                CupertinoSwitch(value: true, onChanged: (value) {}, activeColor: KakaoColors.appColorMain),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: const BoxDecoration(color: KakaoColors.appColorMain),
          child: const Text('저장'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.close, color: Colors.black), onPressed: () => Get.back()),
        title: const Text('화면 편집', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _listView()),
          _bottom(),
        ],
      ),
    );
  }
}
