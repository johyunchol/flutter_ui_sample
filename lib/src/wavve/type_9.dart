import 'dart:async';

import 'package:flutter/material.dart';

class Type9 extends StatefulWidget {
  const Type9({Key? key}) : super(key: key);

  @override
  State<Type9> createState() => _Type9State();
}

class _Type9State extends State<Type9> {
  PageController noticePageController = PageController();
  Timer? timer;

  List<String> list = [
    "HBO시리즈 시청이벤트 안내",
    "[안드로이드 app] 구글플레이결제 적용 안내 (2022.4.1 업데이트)",
    "wavve오리지널 'EXO의 사다리 타고 세계여행3' 시청 이벤트 안내",
  ];

  _timer() async {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      int page = noticePageController.page!.toInt();
      page++;
      if (page >= (list.length)) page = 0;
      setState(() {
        noticePageController.animateToPage(page, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      });
    });
  }

  @override
  void initState() {
    _timer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _notice() {
      return Container(
        height: 50,
        color: Color(0xFF161616),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Stack(
                children: [
                  Icon(Icons.volume_up),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: PageView(
                controller: noticePageController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List.generate(
                    list.length,
                    (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )),
              ),
            ),
          ],
        ),
      );
    }

    Widget _linkSNS() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Row(
          children: [
            Image.network('https://m.wavve.com/img/common/footer-icon-facebook.png', width: 40),
            const SizedBox(width: 16),
            Image.network('https://m.wavve.com/img/common/footer-icon-naver.png', width: 40),
            const SizedBox(width: 16),
            Image.network('https://m.wavve.com/img/common/footer-icon-youtube.png', width: 40),
          ],
        ),
      );
    }

    Widget _linkPolicy() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('이용약관', style: TextStyle(color: Colors.grey)),
              VerticalDivider(color: Colors.grey),
              Text('개인정보 처리방침', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
              VerticalDivider(color: Colors.grey),
              Text('고객센터', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }

    Widget _info() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('콘텐츠웨이브 주식회사 / 대표이사: 이태현', style: TextStyle(color: Colors.grey)),
            Text('주소: 서울특별시 영등포구 여의나루로 60 포스트타워 19층', style: TextStyle(color: Colors.grey)),
            Text('사업자등록번호 220-88-38020', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
            Text('통신판매업 신고번호 : 제 2021-서울영등포-0585호', style: TextStyle(color: Colors.grey)),
            Text('통신판매업 정보 공개 : http://www.ftc.go.kr/bizCommPop.do?wrkr_no=220-88-38020', style: TextStyle(color: Colors.grey)),
            Text('호스팅서비스제공자 : 마이크로소프트 유한회사', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
            Text('전자우편주소 : helpdesk@wavve.com', style: TextStyle(color: Colors.grey)),
            Text('고객센터 1599-3709 (평일 09:00~18:00 / 점심시간 12:00~13:00 / 주말 및 공휴일 휴무)', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
            Text('Copyright© 콘텐츠웨이브(주) All rights reserved.', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 80)
          ],
        ),
      );
    }

    return Column(
      children: [
        _notice(),
        _linkSNS(),
        _linkPolicy(),
        _info(),
      ],
    );
  }
}
