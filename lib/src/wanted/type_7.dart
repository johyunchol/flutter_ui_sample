import 'package:flutter/material.dart';
import 'package:sample/src/wanted/model/contents_item.dart';

class Type7 extends StatelessWidget {
  Type7({Key? key}) : super(key: key);

  List<ContentsItem> list = [
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통2', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
    ContentsItem('', '급 성장한 조직의 개발 성장통', '1인 개발자에서, 50명 개발 조직의 CTO로!'),
  ];

  Widget _item(ContentsItem item) {
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
            children: [
              SizedBox(height: 8),
              Text(
                item.title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(item.desc, style: TextStyle(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  List<Widget> _buildList(List<ContentsItem> list) {
    List<Widget> list2 = [];
    for (int i = 0; i < list.length; i = i + 2) {
      list2.add(Column(
        children: [
          _item(list[i]),
          list.length < (i + 1)
              ? Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _item(list[i + 1]),
                )
              : SizedBox(),
        ],
      ));
    }

    return list2;
  }

  Widget _buildGridView(List<ContentsItem> list) {
    return GridView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
      ),
      children: List.generate(list.length, (index) => _item(list[index])),
    );
  }

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
        //_buildGridView(list),
        SizedBox(
          height: 260,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              mainAxisExtent: 336,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            children: List.generate(list.length, (index) => _item(list[index])),
          ),
        ),
        //SingleChildScrollView(
        //  scrollDirection: Axis.horizontal,
        //  child: Row(
        //    children: [
        //      const SizedBox(width: 16),
        //      _buildGridView(list),
        //      const SizedBox(width: 8),
        //    ],
        //  ),
        //),
        const SizedBox(height: 36)
      ],
    );
  }
}
