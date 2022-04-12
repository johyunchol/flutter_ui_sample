import 'package:flutter/material.dart';

class TossRemittance extends StatefulWidget {
  const TossRemittance({Key? key}) : super(key: key);

  @override
  State<TossRemittance> createState() => _TossRemittanceState();
}

class _TossRemittanceState extends State<TossRemittance> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '어디로 돈을 보낼까요?',
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TabBar(
                      padding: const EdgeInsets.all(1),
                      indicator: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(50)),
                      controller: tabController,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      tabs: [
                        Tab(text: '추천'),
                        Tab(text: '계좌'),
                        Tab(text: '연락처'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Container(
                  height: 1000,
                  color: Colors.red,
                ),
                Container(
                  height: 1000,
                  color: Colors.blue,
                ),
              ],
            ))),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: '혜택'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined), label: '송금'),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_line_chart), label: '주식'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: '전체'),
        ],
      ),
    );
  }
}
