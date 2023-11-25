import 'package:ai_hack/model/request/request_fun1.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ai_hack/model/response/user_plant_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/response/response_fun1.dart';

class Fun1Provider with ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  TextEditingController _plantNameController = TextEditingController();
  TextEditingController get plantNameController => _plantNameController;
  TextEditingController _plantTypeController = TextEditingController();
  TextEditingController get plantTypeController => _plantTypeController;
  TextEditingController _ageController = TextEditingController();
  TextEditingController get ageController => _ageController;
  String _yearSelected = "2020";
  String get yearSelected => _yearSelected;
  String _monthSelected = "1";
  String get monthSelected => _monthSelected;
  String _daySelected = "1";
  String get daySelected => _daySelected;
  String _ageUnitSelected = "월";
  String get ageUnitSelected => _ageUnitSelected;
  late String _resultDate;
  String get resultDate => _resultDate;

  void toggleCheckbox(bool? value) {
    _isChecked = value!;
    notifyListeners();
  }

  void changeDateSelected({required String dateMode, required String value}) {
    switch (dateMode) {
      case 'year':
        _yearSelected = value;
        break;
      case 'month':
        _monthSelected = value;
        break;
      case 'day':
        _daySelected = value;
        break;
      default:
    }
    notifyListeners();
  }

  void changeAgeUnitSelected({required String value}) {
    _ageUnitSelected = value;
    notifyListeners();
  }

  void setResultDate() {
    _resultDate =
        _yearSelected + "년 " + _monthSelected + "월 " + _daySelected + "일";
    notifyListeners();
  }

  void clearProviderStates() {
    _plantNameController = TextEditingController();
    _plantTypeController = TextEditingController();
    _ageController = TextEditingController();
    _yearSelected = "2020";
    _monthSelected = "1";
    _daySelected = "1";
    _ageUnitSelected = "월";
    _isChecked = false;
    notifyListeners();
  }

  void _showToast() {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 3,
      msg: '식물 이름, 종류 그리고 나이를 모두 입력해주세요!!',
      toastLength: Toast.LENGTH_LONG, // 토스트 메시지 지속 시간 (SHORT 또는 LONG)
      gravity: ToastGravity.CENTER, // 토스트 메시지 위치 (TOP, CENTER, BOTTOM)
      backgroundColor: Colors.black.withOpacity(0.7), // 배경색
      textColor: Colors.white, // 텍스트 색상
      fontSize: 16.0, // 텍스트 크기
    );
  }

  bool isReadyToResult() {
    if (_plantNameController.text.isNotEmpty &&
        _plantTypeController.text.isNotEmpty &&
        _ageController.text.isNotEmpty) {
      return true;
    } else {
      _showToast();
      return false;
    }
  }

  Future<bool> getGPTResult() async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final request = RequestFun1(
      name: _plantNameController.text,
      plantType: _plantTypeController.text,
      meetDate: _yearSelected + "-" + _monthSelected + "-" + _daySelected,
      isChecked: _isChecked == true ? 1 : 0,
      ageUnit: _ageUnitSelected,
      ageQuantity: int.parse(_ageController.text),
    );
    final requestJson = request.toJson();

    final response = await http.post(
      headers: headers,
      Uri.parse('http://seunghee-assistant.duckdns.org:8001/user_plant/create'),
      body: jsonEncode(requestJson),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> result = data['result'];

      plantStageList =
          result.map((dynamic item) => ResponseFun1.fromJson(item)).toList();

      setFun1Result();

      return true;
    } else {
      // API 응답이 실패한 경우
      throw Exception('API 요청 실패');
    }
  }

  late List<ResponseFun1> plantStageList;
  List<String> _stageList = List<String>.filled(5, '');
  List<String> get stageList => _stageList;
  late List<String> _expectedDateList = List<String>.filled(5, '');
  List<String> get expectedDateList => _expectedDateList;
  late List<String> _averageLengthList = List<String>.filled(5, '');
  List<String> get averageLengthList => _averageLengthList;
  late List<String> _leafSizeList = List<String>.filled(5, '');
  List<String> get leafSizeList => _leafSizeList;
  late List<String> _tipList = List<String>.filled(5, '');
  List<String> get tipList => _tipList;

  void setFun1Result() {
    for (int i = 0; i < 5; i++) {
      switch (plantStageList[i].code) {
        case "G1":
          _stageList[i] = "발아 단계";
          break;
        case "G2":
          _stageList[i] = "모종 형성";
          break;
        case "G3":
          _stageList[i] = "식물 성장";
          break;
        case "G4":
          _stageList[i] = "개화";
          break;
        case "G5":
          _stageList[i] = "열매 형성";
          break;
      }
      _expectedDateList[i] = plantStageList[i].datePoint;
      _averageLengthList[i] = (plantStageList[i].leafLength).toString() + "cm";
      _leafSizeList[i] = (plantStageList[i].size).toString() + "cm";
      _tipList[i] = plantStageList[i].tip;
    }
    notifyListeners();
  }
}
