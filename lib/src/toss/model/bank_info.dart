import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BankType { TOSS, SHINHAN, WOORI, KAKAO }

extension ParseToBankType on BankType {
  String get bankName {
    switch (this) {
      case BankType.TOSS:
        return '토스뱅크';
      case BankType.SHINHAN:
        return '신한은행';
      case BankType.WOORI:
        return '우리은행';
      case BankType.KAKAO:
        return '카카오뱅크';
      default:
        return '';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case BankType.TOSS:
        return const Color.fromARGB(255, 0, 71, 254);
      case BankType.SHINHAN:
        return const Color.fromARGB(255, 17, 35, 98);
      case BankType.WOORI:
        return const Color.fromARGB(255, 75, 143, 232);
      case BankType.KAKAO:
        return const Color.fromARGB(255, 241, 213, 72);
      default:
        return Colors.white;
    }
  }

  String get logoImg {
    switch (this) {
      case BankType.TOSS:
        return 'TS';
      case BankType.SHINHAN:
        return 'SH';
      case BankType.WOORI:
        return 'WR';
      case BankType.KAKAO:
        return 'KK';
      default:
        return '';
    }
  }
}