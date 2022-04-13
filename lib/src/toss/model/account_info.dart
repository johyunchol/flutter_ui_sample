import 'package:sample/src/toss/model/bank_info.dart';

class AccountInfo {
  final BankType bankType;
  final bool? isMainBank;
  final String bankAccountName;
  final String bankAccountNumber;
  final bool? isFavorite;

  AccountInfo({required this.bankType, this.isMainBank, required this.bankAccountName, required this.bankAccountNumber, this.isFavorite});
}