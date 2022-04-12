import 'package:flutter/material.dart';

class RecommandPage extends StatefulWidget {
  const RecommandPage({Key? key}) : super(key: key);

  @override
  State<RecommandPage> createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  Widget _accountItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    child: Center(child: Icon(Icons.star, color: Colors.white, size: 8)),
                    decoration: BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
                  ))
            ],
          ),
          SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('U드림 저축예금 (인터넷전용)'),
              SizedBox(height: 4),
              Text(
                '신한은행 27382123345',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )),
          
          Icon(Icons.star, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _accountList({required String title, int moreCount = 0}) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              moreCount <= 0
                  ? SizedBox()
                  : Text(
                      '$moreCount개 >',
                      style: TextStyle(color: Colors.grey),
                    ),
            ],
          ),
          SizedBox(height: 12),
          ...List.generate(3, (index) => _accountItem()),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _accountList(title: '내 계좌로', moreCount: 12),
          _accountList(title: '최근 보낸 계좌로'),
        ],
      ),
    );
  }
}
