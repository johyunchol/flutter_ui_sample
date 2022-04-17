import 'package:flutter/material.dart';

class Type4 extends StatelessWidget {
  const Type4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.lightBlue,
          ]
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            child: Text(
              '무제한으로 즐기는 700여편의\n커리어 콘텐츠 wanted+ 🎇',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16, height: 1.4),
            ),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}
