import 'package:flutter/material.dart';

class Type5 extends StatelessWidget {
  const Type5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('커리어 성장을 위한\n맞춤 이벤트', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: double.infinity, height: 180, decoration: BoxDecoration(color: Colors.purpleAccent, borderRadius: BorderRadius.circular(4))),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(border: Border.all(color: Colors.deepPurpleAccent), borderRadius: BorderRadius.circular(4)),
                                child: const Text('네트워킹', style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 12)),
                              ),
                              SizedBox(width: 4),
                              Container(
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: const [Icon(Icons.wifi_tethering, color: Colors.black, size: 12), SizedBox(width: 2), Text('온라인', style: TextStyle(color: Colors.black, fontSize: 12))],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text("앤틀러 : 스타트업 제너레이터 프로그램 참가자 모집", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 32),
                          const Text('2022.04.04 ~ 2022.05.31', style: TextStyle(color: Colors.grey, fontSize: 12)),
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
