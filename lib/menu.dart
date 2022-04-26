import 'package:get/get.dart';
import 'package:sample/src/baemin/baemin_home.dart';
import 'package:sample/src/carrot/carrot_home.dart';
import 'package:sample/src/kakaobank/kakaobank_page.dart';
import 'package:sample/src/kakaotalk/chat_room_list.dart';
import 'package:sample/src/modu/modu_home.dart';
import 'package:sample/src/toss/toss_remittance.dart';
import 'package:sample/src/wanted/wanted_home.dart';
import 'package:sample/src/wavve/wavve_home.dart';

List<Map<String, dynamic>> list = [
  {
    'title': '모두의 주차장 UI',
    'func': () => Get.to(const ModuParkingHome()),
  },
  {
    'title': '카카오뱅크 화면편집',
    'func': () => Get.to(const KakaoBankPage()),
  },
  {
    'title': 'Wanted Home UI',
    'func': () => Get.to(const WantedHome()),
  },
  {
    'title': 'Toss 송금 UI',
    'func': () => Get.to(const TossRemittance()),
  },
  {
    'title': 'WAVVE 홈 UI',
    'func': () => Get.offAll(const WavveHome()),
  },
  {
    'title': '당근마켓 홈 UI',
    'func': () => Get.offAll(const CarrotHome()),
  },
  {
    'title': '배달의민족 홈 UI',
    'func': () => Get.to(const BaeminHome()),
  },
  {
    'title': '카카오 채팅방 UI',
    'func': () => Get.to(const ChatRoomList()),
  },
];
