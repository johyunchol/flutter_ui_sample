import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.keyboard_arrow_down),
                label: Text('은행 선택'),
                enabled: false
              ),
            ),

            SizedBox(height: 16),

            TextFormField(
              decoration: InputDecoration(
                  label: Text('계좌번호 입력'),
                  enabled: false
              ),
            ),
          ],
        ),
      ),
    );
  }
}
