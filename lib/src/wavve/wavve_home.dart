import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageItem {
  final String background;
  final String foreground;

  ImageItem({required this.background, required this.foreground});
}

class WavveHome extends StatefulWidget {
  const WavveHome({Key? key}) : super(key: key);

  @override
  State<WavveHome> createState() => _WavveHomeState();
}

class _WavveHomeState extends State<WavveHome> with SingleTickerProviderStateMixin {
  List<ImageItem> list = [
    ImageItem(background: 'https://img.wavve.com/banner/pooq/2022/20220402_banner_003538.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220402_003637253.png'),
    ImageItem(background: 'https://img.wavve.com/banner/pooq/2022/20220330_banner_233740.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220330_233816417.png'),
    ImageItem(background: 'https://img.wavve.com/banner/pooq/2022/20220405_banner_144445.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220405_144523608.png'),
    ImageItem(background: 'https://img.wavve.com/banner/pooq/2022/20220322_banner_131410.jpg', foreground: 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220322_131725459.png'),
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

  Widget _type2() {
    Widget _item() {
      return Column(
        children: [
          ClipOval(
            child: Stack(
              children: [
                Image.network(
                  'https://img2.sbs.co.kr/img/sbs_cms/SR/2018/02/01/SR94496579_w1280_h720.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 60,
            child: Text(
              '뿌리깊은 나무',
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('#시청 중 콘텐츠'),
              Text('더보기>'),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) => Row(children: [_item(), SizedBox(width: 8)],)),
            ),
          ),
          /*ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _item();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(color: Colors.transparent);
            },
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),*/
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
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
                  PageView(
                    controller: pageController,
                    children: list.map((item) => _images(item.background, item.foreground)).toList(),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 4,
                      effect: const WormEffect(dotWidth: 6, dotHeight: 6, activeDotColor: Colors.white, dotColor: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([_type2()])),
        ],
      ),
    );
  }
}
