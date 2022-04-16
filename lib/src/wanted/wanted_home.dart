import 'package:flutter/material.dart';
import 'package:sample/src/wanted/type_1.dart';

class WantedHome extends StatefulWidget {
  const WantedHome({Key? key}) : super(key: key);

  @override
  State<WantedHome> createState() => _WantedHomeState();
}

class _WantedHomeState extends State<WantedHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff434343),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Type1(),
          ],
        ),
      ),
    );
  }
}
