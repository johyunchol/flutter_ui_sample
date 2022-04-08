import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WavveHome extends StatefulWidget {
  const WavveHome({Key? key}) : super(key: key);

  @override
  State<WavveHome> createState() => _WavveHomeState();
}

class _WavveHomeState extends State<WavveHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/svg/wavve/wavve_logo.svg'),
                SvgPicture.asset('assets/svg/wavve/live.svg')
              ],
            ),
            backgroundColor: Colors.black54,
            expandedHeight: MediaQuery.of(context).size.width * 1440/1125,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network('https://img.wavve.com/banner/pooq/2022/20220402_banner_003538.jpg', fit: BoxFit.cover),
                  Image.network('https://img.wavve.com/banner/pooq/2022/imgbuild_20220402_003637253.png', fit: BoxFit.cover),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red),
                Container(color: Colors.purple),
                Container(color: Colors.green),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
