import 'package:flutter/material.dart';
import 'package:sample/src/toss/model/account_info.dart';
import 'package:sample/src/toss/model/bank_info.dart';

enum BlockType { MY_ACCOUNT, RECENT_ACCOUNT }

class RecommandPage extends StatefulWidget {
  const RecommandPage({Key? key}) : super(key: key);

  @override
  State<RecommandPage> createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  List<AccountInfo> myAccountList = [
    AccountInfo(bankType: BankType.SHINHAN, isMainBank: true, bankAccountName: 'U드림 저축예금 (인터넷전용)', bankAccountNumber: '11100123456'),
    AccountInfo(bankType: BankType.TOSS, isMainBank: false, bankAccountName: '토스뱅크 통장', bankAccountNumber: '1234567890'),
    AccountInfo(bankType: BankType.WOORI, isMainBank: false, bankAccountName: '저축예금', bankAccountNumber: '2737192736716232'),
    AccountInfo(bankType: BankType.KAKAO, isMainBank: false, bankAccountName: '저축예금', bankAccountNumber: '3333333333333333'),
  ];

  List<AccountInfo> recentAccountList = [
    AccountInfo(bankType: BankType.SHINHAN, bankAccountName: 'U드림 저축예금 (인터넷전용)', bankAccountNumber: '11100123456', isFavorite: true),
    AccountInfo(bankType: BankType.KAKAO, bankAccountName: '카카오뱅크 저축예금', bankAccountNumber: '333333323123123123', isFavorite: false),
    AccountInfo(bankType: BankType.TOSS, bankAccountName: '토스뱅크 통장', bankAccountNumber: '718625376152367', isFavorite: false),
    AccountInfo(bankType: BankType.WOORI, bankAccountName: '우리은행 저축예금', bankAccountNumber: '1927386172367', isFavorite: false),
    AccountInfo(bankType: BankType.SHINHAN, bankAccountName: 'U드림 저축예금 (인터넷전용)', bankAccountNumber: '11100123456', isFavorite: false),
    AccountInfo(bankType: BankType.KAKAO, bankAccountName: '카카오뱅크 저축예금', bankAccountNumber: '333333323123123123', isFavorite: true),
    AccountInfo(bankType: BankType.TOSS, bankAccountName: '토스뱅크 통장', bankAccountNumber: '718625376152367', isFavorite: false),
    AccountInfo(bankType: BankType.WOORI, bankAccountName: '우리은행 저축예금', bankAccountNumber: '1927386172367', isFavorite: false),
    AccountInfo(bankType: BankType.SHINHAN, bankAccountName: 'U드림 저축예금 (인터넷전용)', bankAccountNumber: '11100123456', isFavorite: false),
    AccountInfo(bankType: BankType.KAKAO, bankAccountName: '카카오뱅크 저축예금', bankAccountNumber: '333333323123123123', isFavorite: false),
    AccountInfo(bankType: BankType.TOSS, bankAccountName: '토스뱅크 통장', bankAccountNumber: '718625376152367', isFavorite: true),
    AccountInfo(bankType: BankType.WOORI, bankAccountName: '우리은행 저축예금', bankAccountNumber: '1927386172367', isFavorite: false),
    AccountInfo(bankType: BankType.SHINHAN, bankAccountName: 'U드림 저축예금 (인터넷전용)', bankAccountNumber: '11100123456', isFavorite: false),
    AccountInfo(bankType: BankType.KAKAO, bankAccountName: '카카오뱅크 저축예금', bankAccountNumber: '333333323123123123', isFavorite: false),
    AccountInfo(bankType: BankType.TOSS, bankAccountName: '토스뱅크 통장', bankAccountNumber: '718625376152367', isFavorite: false),
    AccountInfo(bankType: BankType.WOORI, bankAccountName: '우리은행 저축예금', bankAccountNumber: '1927386172367', isFavorite: true),
  ];

  Widget _accountItem(BlockType blockType, AccountInfo accountInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: accountInfo.bankType.backgroundColor, shape: BoxShape.circle),
                child: Center(child: Text(accountInfo.bankType.logoImg)),
              ),
              blockType == BlockType.MY_ACCOUNT && (accountInfo.isMainBank ?? false)
                  ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  child: const Center(child: Icon(Icons.star, color: Colors.white, size: 8)),
                  decoration: const BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
                ),
              )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(accountInfo.bankAccountName),
                  const SizedBox(height: 4),
                  Text(
                    '${accountInfo.bankType.bankName} ${accountInfo.bankAccountNumber}',
                      style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )),
          blockType == BlockType.RECENT_ACCOUNT ? Icon(Icons.star, color: (accountInfo.isFavorite ?? false) ? Colors.white : Colors.grey) : const SizedBox(),
        ],
      ),
    );
  }

  Widget _accountList({required BlockType blockType, required List<AccountInfo> list}) {
    String title = '';
    int visibleCount = list.length;

    switch (blockType) {
      case BlockType.MY_ACCOUNT:
        title = '내 계좌로';
        visibleCount = visibleCount > 3 ? 3 : visibleCount;
        break;
      case BlockType.RECENT_ACCOUNT:
        title = '최근 보낸 계좌로';
        visibleCount = list.length;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              blockType == BlockType.MY_ACCOUNT ? Text('${list.length}개 >', style: const TextStyle(color: Colors.grey)) : const SizedBox()
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(visibleCount, (index) => _accountItem(blockType, list[index])),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _accountList(list: myAccountList, blockType: BlockType.MY_ACCOUNT),
          _accountList(list: recentAccountList, blockType: BlockType.RECENT_ACCOUNT),
        ],
      ),
    );
  }
}
