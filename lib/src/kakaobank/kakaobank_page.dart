import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/src/kakaobank/constants/KakaoColors.dart';

class KakaoBankPage extends StatefulWidget {
  const KakaoBankPage({Key? key}) : super(key: key);

  @override
  State<KakaoBankPage> createState() => _KakaoBankPageState();
}

class _KakaoBankPageState extends State<KakaoBankPage> {
  Widget _item(int index) {
    return Material(
      key: ValueKey(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(color: index == 1111 ? Colors.red : KakaoColors.appColorMain, borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          trailing: ReorderableDragStartListener(
            index: index,
            child: Icon(Icons.menu),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star),
              SizedBox(width: 16),
              Expanded(child: Text('조현철의 통장')),
              Text('10,000원'),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listView() {
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      proxyDecorator: (Widget child, int index, Animation<double> animation) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: child,
        );
      },
      header: _item(1111),
      itemBuilder: (BuildContext context, int index) {
        return _item(index);
      },
      itemCount: 10,
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
        leading: const Icon(Icons.close, color: Colors.black),
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
