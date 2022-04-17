import 'package:flutter/material.dart';

class Type2 extends StatelessWidget {
  const Type2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('3분만에 읽는\nwanted+ 아티클', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Text('더보기', style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 16),
              ...List.generate(10, (index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("3,600만 메시지를 배달한 '내 트리를 꾸며줘!'", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                          SizedBox(height: 16),
                          Text('#개발 #UX/UI #IT/기술', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                );
              }),
              SizedBox(width: 8),
            ],
          ),
        ),
        SizedBox(height: 36)
      ],
    );
  }
}
