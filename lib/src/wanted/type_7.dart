import 'package:flutter/material.dart';

class Type7 extends StatelessWidget {
  const Type7({Key? key}) : super(key: key);

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
              Text('트렌디한 직장인 이라면\n꼭 봐야할 추천 토픽', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Text('더보기', style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 16),
              ...List.generate(10, (index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 8),
                          Text('급 성장한 조직의 개발 성장통', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          SizedBox(height: 8),
                          Text('1인 개발자에서, 50명 개발 조직의 CTO로!', style: TextStyle(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                );
              }),
              const SizedBox(width: 8),
            ],
          ),
        ),
        const SizedBox(height: 36)
      ],
    );
  }
}
