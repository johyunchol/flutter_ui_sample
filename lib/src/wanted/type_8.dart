import 'package:flutter/material.dart';

class Type8 extends StatelessWidget {
  const Type8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '채용 정보를 찾고 계셨나요?',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.white12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(child: Column(children: const [Icon(Icons.search), Text('채용공고 >')])),
                    const VerticalDivider(width: 1),
                    Expanded(child: Column(children: [Icon(Icons.search), Text('내 프로필 >')])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
