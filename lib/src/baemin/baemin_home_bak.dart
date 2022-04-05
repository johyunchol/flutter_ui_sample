import 'package:flutter/material.dart';

class BaeminHome extends StatelessWidget {
  const BaeminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _appBar() {
      return SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromARGB(255, 93, 190, 187)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              Container(width: 50, height: 50),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('경기 안양시 동안구 동편로 1111-2222', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20))),
                  Icon(Icons.keyboard_arrow_down),
                ],
              )),
              IconButton(onPressed: () {}, icon: Icon(Icons.add_alert_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            ],
          ),
        ),
      );
    }

    Widget _contents() {
      Widget _search() {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 93, 190, 187),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(child: Text('닭발? 순대? 곱창?', style: TextStyle(color: Colors.grey, fontSize: 16)))
                ],
              ),
            ),
          ),
        );
      }

      Widget _delivery() {
        double squareSize = (MediaQuery.of(context).size.width - 48) / 2;
        return Row(
          children: [
            Container(width: squareSize, height: squareSize, color: Colors.red),
            SizedBox(width: 16),
            Container(width: squareSize, height: squareSize, color: Colors.red),
          ],
        );
      }

      return Expanded(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 60, color: Color.fromARGB(255, 93, 190, 187)),
            _search(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _delivery(),
                  SizedBox(height: 16),
                  Container(height: 80, color: Colors.blue),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(flex: 1, child: Container(height: 80, color: Colors.yellow)),
                      SizedBox(width: 16),
                      Expanded(flex: 1, child: Container(height: 80, color: Colors.orange)),
                      SizedBox(width: 16),
                      Expanded(flex: 1, child: Container(height: 80, color: Colors.green)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 140,
                    child: PageView(
                      children: [
                        Container(color: Colors.purpleAccent),
                        Container(color: Colors.deepPurple),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 80,
                    color: Colors.brown,
                  ),
                ],
              ),
            )
          ],
        ),
      ));
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: Column(children: [_appBar(), _contents()]),
    );
  }
}
