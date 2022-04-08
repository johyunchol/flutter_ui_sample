import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WavveHome extends StatefulWidget {
  const WavveHome({Key? key}) : super(key: key);

  @override
  State<WavveHome> createState() => _WavveHomeState();
}

class _WavveHomeState extends State<WavveHome> {
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
    PageController pageController = new PageController();
    Widget _indicatorItem() {
      return Container(
        width: 6,
        height: 6,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SvgPicture.asset('assets/svg/wavve/wavve_logo.svg'), SvgPicture.asset('assets/svg/wavve/live.svg')],
            ),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(

            ),
            /*flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    children: [
                      _images('https://img.wavve.com/banner/pooq/2022/20220402_banner_003538.jpg', 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220402_003637253.png'),
                      _images('https://img.wavve.com/banner/pooq/2022/20220402_banner_003538.jpg', 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220402_003637253.png'),
                    ],
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: SmoothPageIndicator(controller: pageController, count: 2,
                      effect: WormEffect(
                        dotWidth: 6, dotHeight: 6, activeDotColor: Colors.white, dotColor: Colors.grey
                      ),
                    ),
                  )
                ],
              ),
            ),*/
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: MediaQuery.of(context).size.width * 1440 / 1125,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    PageView(
                      controller: pageController,
                      children: [
                        _images('https://img.wavve.com/banner/pooq/2022/20220402_banner_003538.jpg', 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220402_003637253.png'),
                        _images('https://img.wavve.com/banner/pooq/2021/20211117_banner_152621.jpg', 'https://img.wavve.com/banner/pooq/2022/imgbuild_20220119_143144870.png'),
                      ],
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: SmoothPageIndicator(controller: pageController, count: 2,
                        effect: WormEffect(
                            dotWidth: 6, dotHeight: 6, activeDotColor: Colors.white, dotColor: Colors.grey
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(height: 80, color: Colors.transparent),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.purple),
              Container(height: 80, color: Colors.green),
              Container(height: 80, color: Colors.orange),
              Container(height: 80, color: Colors.yellow),
              Container(height: 80, color: Colors.pink),
            ]
          )),
          SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.width * 1440 / 1125,
            delegate: SliverChildListDelegate(
              [

              ],
            ),
          ),
        ],
      ),
    );
  }
}
