import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample/src/wavve/type_2.dart';
import 'package:sample/src/wavve/type_4.dart';
import 'package:sample/src/wavve/type_5.dart';
import 'package:sample/src/wavve/type_6.dart';
import 'package:sample/src/wavve/type_7.dart';
import 'package:sample/src/wavve/type_9.dart';
import 'package:sample/src/wavve/wavve_home_list_item_type_2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerItem {
  final String background;
  final String foreground;

  BannerItem({required this.background, required this.foreground});
}

class ContentsItem {
  final String imageUrl;
  final String title;
  final String? subTitle;
  final bool? isChecked;

  ContentsItem({required this.imageUrl, required this.title, this.subTitle, this.isChecked});
}

class WavveHome extends StatefulWidget {
  const WavveHome({Key? key}) : super(key: key);

  @override
  State<WavveHome> createState() => _WavveHomeState();
}

class _WavveHomeState extends State<WavveHome> with SingleTickerProviderStateMixin {
  List<BannerItem> list = [
    BannerItem(background: 'https://img.wavve.com/banner/pooq/2022/20220402_banner_003538.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220402_003637253.png'),
    BannerItem(background: 'https://img.wavve.com/banner/pooq/2022/20220330_banner_233740.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220330_233816417.png'),
    BannerItem(background: 'https://img.wavve.com/banner/pooq/2022/20220405_banner_144445.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220405_144523608.png'),
    BannerItem(background: 'https://img.wavve.com/banner/pooq/2022/20220322_banner_131410.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220322_131725459.png'),
  ];

  List<ContentsItem> nowList = [
    ContentsItem(imageUrl: 'https://img.wavve.com/202011/20201103/a4857c2e4833b023dc35080da5bdc4a5_w312_h468_q75.jpg', title: '구해줘! 홈즈'),
    ContentsItem(imageUrl: 'https://img.wavve.com/fz/202112/20211206/5cb676af50f89a4b808627465bbe62c0_w312_h468_q75.jpg', title: '태종 이방원'),
    ContentsItem(imageUrl: 'https://img.wavve.com/fz/202111/20211123/748592bd6f9bbc4f9878c67f58418909_w312_h468_q75.jpg', title: '슈퍼맨이 돌아왔다'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202112/S01_V0000330171_w312_h468_q75.jpg', title: '런닝맨'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202201/S01_V2000009613-2_w312_h468_q75.jpg', title: '미운 우리 새끼'),
    ContentsItem(imageUrl: 'https://img.wavve.com/202203/20220321/22839cc069aab4862eb6548371408057_w312_h468_q75.jpg', title: '현재는 아름다워'),
  ];

  List<ContentsItem> orgList = [
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202203/C9901_C99000000088-2_w312_h468_q75.jpg', title: 'EXO의 사다리 타고 세계여행 시즌3 : 남해편'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202203/C9901_C99000000087-2-RERERE_w312_h468_q75.jpg', title: 'MMM: Where are we now'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202203/C9902_C99000000007-2_w312_h468_q75.jpg', title: '돌싱글즈 외전: 가족의 탄생'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202203/C9902_C99000000008-2-RE_w312_h468_q75.jpg', title: '혼공, 조남호의 입시코드'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202201/C9902_C99000000006-2_w312_h468_q75.jpg', title: '홀인러브'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202110/C9901_C99000000076-2-RE_w312_h468_q75.jpg', title: '이렇게 된 이상 청와대로 간다'),
  ];

  List<ContentsItem> newHBOList = [
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202202/F3501_F35000000173-2_w312_h468_q75.jpg', title: '하이 메인터넌스 시즌1'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202202/F3501_F35000000172-2_w312_h468_q75.jpg', title: '컴백 시즌1'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202203/F3501_F35000000181-2_w312_h468_q75.jpg', title: '비만나라의 아이들'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202203/F3501_F35000000180-2_w312_h468_q75.jpg', title: '인 트리트먼트 시즌3'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202107/F3501_F35000000005-2-RE-RE_w312_h468_q75.jpg', title: '트루 디텍티브 시즌1'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202108/F3501_F35000000018-2-RE_w312_h468_q75.jpg', title: '섹스 앤 더 시티 시즌1'),
  ];

  List<ContentsItem> soonList = [
    ContentsItem(imageUrl: 'https://img.wavve.com/202203/20220330/2211efd579d71ecee462257313c6256e_w972_h546_q75.jpg?timestamp=1649598683533', title: '금천불시최후일천', subTitle: '4월 12일, 함께여서 빛나는 두 사람을 만나다', isChecked: true),
    ContentsItem(imageUrl: 'https://img.wavve.com/202203/20220329/02a21f5bb7117604a2956b2365f9a81d_w972_h546_q75.jpg?timestamp=1649598683533', title: '혼공, 조남호의 입시코드', subTitle: '4월 16일(토) 낮 12시 10분 첫 방송!', isChecked: false),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/NewProgramImg/K02_T2021-0320/2022033011320143_w972_h546_q75.jpg?timestamp=1649598683533', title: '너에게 가는 속도 493km', subTitle: '4월 20일 밤 9시 50분 첫 방송!', isChecked: false),
  ];

  List<ContentsItem> top20List = [
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202111/M_1002831100000100000-2_w312_h468_q75.jpg', title: '나 혼자 산다'),
    ContentsItem(imageUrl: 'https://img.wavve.com/202201/20220127/ae4465d001a0a8d3be382f9324b3eb5b_w312_h468_q75.jpg', title: '놀면 뭐하니?'),
    ContentsItem(imageUrl: 'https://img.pooq.co.kr/201805/20180530/d91633f8113409d77373de672f61739a_w312_h468_q75.jpg', title: '그것이 알고싶다'),
    ContentsItem(imageUrl: 'https://img.wavve.com/BMS/program_poster/202201/M_1003594100000100000-2_RE_w312_h468_q75.jpg', title: '전지적 참견 시점'),
  ];

  Widget _images(String backgroundImg, String foregroundImg) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(backgroundImg, fit: BoxFit.cover),
        Image.network(foregroundImg, fit: BoxFit.cover),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 16, 16, 16),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_outlined), label: '카테고리'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'MY'),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SvgPicture.asset('assets/svg/wavve/wavve_logo.svg'), SvgPicture.asset('assets/svg/wavve/live.svg')],
            ),
            backgroundColor: const Color.fromARGB(255, 27, 27, 27),
            expandedHeight: MediaQuery.of(context).size.width * 1440 / 1125,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                children: [
                  PageView(controller: pageController, children: list.map((item) => _images(item.background, item.foreground)).toList()),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: SmoothPageIndicator(controller: pageController, count: 4, effect: const WormEffect(dotWidth: 6, dotHeight: 6, activeDotColor: Colors.white, dotColor: Colors.grey)),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            type2(),
            SizedBox(height: 24),
            type4('실시간 인기 프로그램', nowList),
            SizedBox(height: 24),
            type4('wavve ORIGINAL #독점 #최초공개', orgList),
            SizedBox(height: 24),
            type4('매주 신작 업데이트! #HBO 시리즈', newHBOList),
            SizedBox(height: 24),
            type5('https://img.wavve.com/banner/pooq/2022/20220405_banner_094821_w2250_h390_q75.jpg'),
            SizedBox(height: 24),
            type6('두근두근 Coming Soon', soonList),
            SizedBox(height: 24),
            type7('오늘의 TOP 20', top20List),
            SizedBox(height: 24),
            Type9(),
            SizedBox(height: 24),
          ])),
        ],
      ),
    );
  }
}
