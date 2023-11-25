import 'package:ai_hack/model/request/request_fun1.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ai_hack/model/response/user_plant_list.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../model/response/response_fun1.dart';
import 'fun2_provider.dart';

class Fun3Provider with ChangeNotifier {
  TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  late List<dynamic> _goodTipList;
  List<dynamic> get goodTipList => _goodTipList;

  int _selectedPlantId = -1;
  int get selectedPlantId => _selectedPlantId;

  void rememberSelectedPlantId({required int id}) {
    _selectedPlantId = id;
    notifyListeners();
  }

  Future<bool> getGoodTips() async {
    String text = _controller.text;

    final response = await http.get(Uri.parse(
        'http://seunghee-assistant.duckdns.org:8001/user_plant/diagnosis?user_plant_id=$_selectedPlantId&problem=$text'));
    if (response.statusCode == 200) {
      // API 응답이 성공한 경우
      final Map<String, dynamic> data =
          jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> result = data["result"];
      _goodTipList = result;
      // for (int index = 0; index < result.length; index++) {
      //   goodTipList.add(Center(
      //     child: Container(
      //         width: 400 - 40,
      //         padding:
      //             EdgeInsets.fromLTRB(14, 24, 14, 34), // 상, 우, 하, 좌 순서로 패딩 설정
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(14),
      //           color: Colors.white, // 배경색 설정
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text("꿀팁 ${index + 1}",
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
      //             SizedBox(height: 10),
      //             Text(result[index]["title"],
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
      //             SizedBox(height: 7),
      //             Text(result[index]["tip"],
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
      //           ],
      //         )),
      //   ));
      //   goodTipList.add(SizedBox(
      //     height: 15,
      //   ));
      // }
      notifyListeners();
      return true;
    } else {
      // API 응답이 실패한 경우
      throw Exception('API 요청 실패');
    }
//보통 Provider의 값을 변경하기 위한 함수는 read를 통해 접근하며, 상태값을 사용할 때에는 watch를 사용합니다.
  }

  void clearProviderStates() {
    _controller.text = "";
    notifyListeners();
  }
}
