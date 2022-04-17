import 'package:flutter/material.dart';

class Type3 extends StatelessWidget {
  const Type3({Key? key}) : super(key: key);

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
              Text('개발자를 위한\nwanted+ VOD', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.black12),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                                      child: Text(
                                        '50:01',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text("라쿠텐 김우혁", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 8),
                          const Text("성공적인 팀을 위해 당신이 찾던 마지막 열쇠, E2E 테스트 자동화 : The Top of the Test Pyramid", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 32),
                          const Text('개발자가 일 더 잘하는 법 : Wanted Con', style: TextStyle(color: Colors.white54, fontSize: 16)),
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
