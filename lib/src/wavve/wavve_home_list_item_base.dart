import 'package:flutter/material.dart';

class ListItemBase extends StatelessWidget {
  const ListItemBase({Key? key, this.title, this.onTapMore, this.body}) : super(key: key);

  final String? title;
  final GestureTapCallback? onTapMore;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? '', style: TextStyle(fontSize: 18, color: Colors.white)),
              onTapMore != null
                  ? InkWell(
                      onTap: onTapMore,
                      child: const Text(
                        '더보기 〉',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        body ?? const SizedBox(),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: List.generate(
        //       14,
        //       (index) => _item(image: 'https://img2.sbs.co.kr/img/sbs_cms/SR/2018/02/01/SR94496579_w1280_h720.jpg', title: '뿌리깊은 나무'),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
