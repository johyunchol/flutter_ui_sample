import 'package:flutter/material.dart';
import 'package:sample/src/toss/account_page.dart';
import 'package:sample/src/toss/contact_page.dart';
import 'package:sample/src/toss/recommand_page.dart';

class TossRemittance extends StatefulWidget {
  const TossRemittance({Key? key}) : super(key: key);

  @override
  State<TossRemittance> createState() => _TossRemittanceState();
}

class _TossRemittanceState extends State<TossRemittance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('어디로 돈을 보낼까요?', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 24),
                    Theme(
                      data: Theme.of(context).copyWith(highlightColor: Colors.transparent, splashColor: Colors.transparent),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TabBar(
                          padding: const EdgeInsets.all(4),
                          indicator: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(50)),
                          labelColor: Colors.white,
                          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          tabs: const [Tab(text: '추천'), Tab(text: '계좌'), Tab(text: '연락처')],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [RecommandPage(), AccountPage(), ContactPage()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
