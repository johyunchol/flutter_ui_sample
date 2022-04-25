import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample/src/kakaobank/constants/colors.dart';
import 'package:sample/src/kakaobank/enum/account_type.dart';
import 'package:sample/src/kakaobank/enum/item_type.dart';

class ContentsItem {
  final ItemType itemType;
  final String title;
  final int? money;
  final Color? backgroundColor;
  final Color? fontColor;
  final bool isHeader;
  final bool isFavorite;
  final AccountType accountType;

  ContentsItem({
    required this.itemType,
    required this.title,
    this.money,
    this.backgroundColor,
    this.fontColor,
    this.isHeader = false,
    this.isFavorite = false,
    this.accountType = AccountType.DEPOSIT,
  });
}

class KakaoBankPage extends StatefulWidget {
  const KakaoBankPage({Key? key}) : super(key: key);

  @override
  State<KakaoBankPage> createState() => _KakaoBankPageState();
}

class _KakaoBankPageState extends State<KakaoBankPage> {
  List<ContentsItem> list = [
    ContentsItem(itemType: ItemType.CONTENTS, title: '자유적금', money: 10000, backgroundColor: KakaoColors.appColorRed100, fontColor: Colors.black54, accountType: AccountType.FREE_SAVINGS),
    ContentsItem(itemType: ItemType.CONTENTS, title: '조현철의 통장', money: 10000, backgroundColor: KakaoColors.appColorBlue300, fontColor: Colors.white60),
    ContentsItem(itemType: ItemType.DIVIDER, title: '위 순서로 홈 화면에 보입니다'),
  ];

  Widget _item(int index, ContentsItem item) {
    var f = NumberFormat('###,###,###,###');
    return Material(
      color: Colors.transparent,
      key: ValueKey(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: index == -1 ? KakaoColors.appColorMain : item.backgroundColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item.accountType == AccountType.DEPOSIT ? Icon(Icons.star, color: item.isFavorite ? Colors.black : Colors.black38) : const SizedBox(width: 24),
            const SizedBox(width: 16),
            Expanded(child: Text(item.title, style: TextStyle(color: item.fontColor))),
            Text('${f.format(item.money)}원', style: TextStyle(color: item.fontColor)),
            const SizedBox(width: 16),
            ReorderableDragStartListener(index: index, child: index == -1 ? const SizedBox(width: 24) : Icon(Icons.menu, color: item.fontColor)),
          ],
        ),
      ),
    );
  }

  _itemDivider(int index, ContentsItem item) {
    return Padding(
      key: ValueKey(index),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: DottedLine(direction: Axis.horizontal, lineThickness: 1.0, dashLength: 4.0, dashColor: Colors.grey)),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text(item.title, style: const TextStyle(color: Colors.black54))),
          const Expanded(child: DottedLine(direction: Axis.horizontal, lineThickness: 1.0, dashLength: 4.0, dashColor: Colors.grey)),
        ],
      ),
    );
  }

  Widget _listView() {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      proxyDecorator: (Widget child, int index, Animation<double> animation) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: child,
        );
      },
      header: _item(-1, ContentsItem(itemType: ItemType.CONTENTS, title: '조현철의 통장', money: 10000, backgroundColor: KakaoColors.appColorMain, fontColor: Colors.black54, isFavorite: true)),
      children: List.generate(list.length, (index) {
        switch (list[index].itemType) {
          case ItemType.CONTENTS:
            return _item(index, list[index]);
          case ItemType.DIVIDER:
            return _itemDivider(index, list[index]);
        }
      }),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          final ContentsItem item = list.removeAt(oldIndex);
          list.insert(newIndex, item);
        });
      },
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
        Ink(
          decoration: const BoxDecoration(color: KakaoColors.appColorMain),
          child: InkWell(
            onTap: () {},
            child: SafeArea(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: const Text('저장'),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.black), onPressed: () => Navigator.of(context).pop()),
        title: const Text('화면 편집', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Expanded(child: _listView()), _bottom()],
      ),
    );
  }
}
