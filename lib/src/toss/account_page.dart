import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String bankName = '';
  String bankAccount = '';

  @override
  Widget build(BuildContext context) {
    Widget _bankInfo() {
      return GestureDetector(
        onTap: () {
          setState(() {
            bankName = '카카오뱅크';
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('은행 선택', style: TextStyle(color: bankName.isEmpty ? Colors.transparent : Colors.grey, fontSize: 12, fontWeight: FontWeight.w400)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(bankName.isEmpty ? '은행 선택' : bankName, style: TextStyle(color: bankName.isEmpty ? Colors.grey : Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ]),
              SizedBox(height: 8),
              Divider(height: 1, color: Color(0xffe7e7e7)),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _bankInfo(),
                  const SizedBox(height: 16),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(label: Text('계좌번호 입력')),
                      onChanged: (value) {
                        setState(() {
                          bankAccount = value;
                        });
                      })
                ],
              ),
            ),
          ),
          (bankName.isEmpty || bankAccount.isEmpty)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Ink(
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 71, 254), borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: const SizedBox(width: double.infinity, height: 50, child: Center(child: Text('확인'))),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
