import 'package:flutter/material.dart';

class CarrotHome extends StatelessWidget {
  const CarrotHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 1,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('금정동', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Colors.black)),
          IconButton(onPressed: () {}, icon: Icon(Icons.doorbell, color: Colors.black)),
        ],
      ),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 255, 136, 85),
        child: Text('+', style: TextStyle(fontSize: 40)),
      ),
    );
  }

  Widget _body() {
    String image = 'http://img.danawa.com/prod_img/500000/356/170/img/13170356_1.jpg?shrink=330:330&_v=20210119111223';

    Widget _button({required IconData icon, required int count}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(children: [Icon(icon), Text('$count', style: TextStyle(color: Colors.grey))]),
      );
    }

    Widget _item() {
      return Container(
        height: 100,
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(image, width: 100, height: 100, fit: BoxFit.cover)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// 위쪽 (제목, 메뉴버튼 관련)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('당근마켓 입점기념2탄!! 홍게 한마리에 천원꼴??', style: TextStyle(color: Colors.black, fontSize: 18), overflow: TextOverflow.ellipsis, maxLines: 2),
                              SizedBox(height: 4),
                              Text('삼동·지역광고', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.more_vert)
                      ],
                    ),
                  ),

                  /// 아래쪽 (댓글, 찜 관련)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _button(icon: Icons.chat_bubble_outline, count: 42),
                      _button(icon: Icons.chat_bubble_outline, count: 210),
                      _button(icon: Icons.favorite_border, count: 464),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int index) {
        return _item();
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 16);
      },
      itemCount: 20,
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Container(margin: const EdgeInsets.only(top: 8), child: Icon(Icons.home)), label: '홈'),
        BottomNavigationBarItem(icon: Container(margin: const EdgeInsets.only(top: 8), child: Icon(Icons.receipt_long_outlined)), label: '동네생활'),
        BottomNavigationBarItem(icon: Container(margin: const EdgeInsets.only(top: 8), child: Icon(Icons.pin_drop_outlined)), label: '내 근처'),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Icon(Icons.chat_bubble_outline),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                    child: Text('1', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              )
            ],
          ),
          label: '채팅',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Icon(Icons.person_outline),
              ),
              Positioned(
                  top: 4,
                  right: 0,
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                  ))
            ],
          ),
          label: '나의 당근',
        ),
      ],
    );
  }
}
