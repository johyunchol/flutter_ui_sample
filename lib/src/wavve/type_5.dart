import 'package:flutter/material.dart';
import 'package:sample/src/common/itcha_toast.dart';
import 'package:sample/src/wavve/wavve_home.dart';

class Type5 extends StatefulWidget {
  const Type5({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<Type5> createState() => _Type5State();
}

class _Type5State extends State<Type5> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (0.173333333),
      child: Stack(
        children: [
          Image.network(widget.imageUrl, fit: BoxFit.cover),
          Material(
            color: Colors.transparent,
            child: Ink(
              child: InkWell(
                onTap: () {
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
