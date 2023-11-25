import 'dart:typed_data';

import 'package:ai_hack/model/response/user_plant_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class Fun2Provider with ChangeNotifier {
  TextEditingController _leafLengthController = TextEditingController();
  TextEditingController get leafLengthController => _leafLengthController;

  TextEditingController _leafSizeController = TextEditingController();
  TextEditingController get leafSizeController => _leafSizeController;

  late String _userPlantSelected;
  String get userPlantSelected => _userPlantSelected;

  late List<UserPlant> _userPlantList;
  List<UserPlant> get userPlantList => _userPlantList;

  final ImagePicker _picker = ImagePicker();
  String? _pickedImageUrl; // 이미지 바이트 배열을 저장할 변수 추가
  String? get pickedImageUrl => _pickedImageUrl;

  Future<void> pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _pickedImageUrl = pickedImage.path; // 이미지를 바이트 배열로 변환
    }
    notifyListeners();
  }

  Future<bool> isUserPlantThenGetData() async {
    final response = await http.get(Uri.parse(
        'http://seunghee-assistant.duckdns.org:8001/user_plant/get-list'));
    if (response.statusCode == 200) {
      // API 응답이 성공한 경우
      final Map<String, dynamic> data =
          jsonDecode(utf8.decode(response.bodyBytes));
      if (data["isExist"] == false) {
        return false;
      } else {
        List<dynamic> upList = data["userPlantList"].map((userPlantJson) {
          return UserPlant.fromJson(userPlantJson);
        }).toList();

        _userPlantList = upList!.cast<UserPlant>();
        _userPlantSelected =
            _userPlantList[0].name + "(" + userPlantList[0].plantType + ")";
        _selectedPlantId = _userPlantList[0].id;
        notifyListeners();
        return true;
      }
    } else {
      // API 응답이 실패한 경우
      throw Exception('API 요청 실패');
    }
  }

  void changeUserPlantSelected({required String value}) {
    _userPlantSelected = value;
    notifyListeners();
  }

  int _selectedPlantId = -1;
  int get selectedPlantId => _selectedPlantId;

  void rememberSelectedPlantId({required int id}) {
    _selectedPlantId = id;
    notifyListeners();
  }

  void clearProviderStates() {
    _leafLengthController = TextEditingController();
    _leafSizeController = TextEditingController();
    _userPlantSelected =
        _userPlantList[0].name + "(" + _userPlantList[0].plantType + ")";

    _pickedImageUrl = null;
    notifyListeners();
  }

  void _showToast() {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 3,
      msg: '잎의 길이와 크기 그리고 이미지를 넣어주세요!!',
      toastLength: Toast.LENGTH_LONG,
      // 토스트 메시지 지속 시간 (SHORT 또는 LONG)
      gravity: ToastGravity.CENTER,
      // 토스트 메시지 위치 (TOP, CENTER, BOTTOM)
      backgroundColor: Colors.black.withOpacity(0.7),
      // 배경색
      textColor: Colors.white,
      // 텍스트 색상
      fontSize: 16.0, // 텍스트 크기
    );
  }

  bool isReadyToResult() {
    if (_leafLengthController.text.isNotEmpty &&
        _leafSizeController.text.isNotEmpty &&
        _pickedImageUrl != null) {
      return true;
    } else {
      _showToast();
      return false;
    }
  }

  late Uint8List _imageBytes;
  Uint8List get imageBytes => _imageBytes;
  List<Image> _imageList = [];
  List<Image> get imageList => _imageList;
  List<Image> _originalImageList = [];
  List<Image> get originalImageList => _originalImageList;
  List<String> _imageInfo = [];
  List<String> get imageInfo => _imageInfo;

  Future<bool> getProperImage() async {
    final response = await http.get(Uri.parse(
        'http://seunghee-assistant.duckdns.org:8001/user_plant/review-image?user_plant_id=${_selectedPlantId}&leaf_length=${_leafLengthController.text}&size=${_leafSizeController.text}&image_size=1024x1024'));
    if (response.statusCode == 200) {
      // API 응답이 성공한 경우
      final Map<String, dynamic> data =
          jsonDecode(utf8.decode(response.bodyBytes));

      _imageBytes = base64Decode(data["base64_image"]);
      _imageInfo.add(data["review"]);
      DateTime now = DateTime.now();
      _imageInfo.add(
          "${now.year}년 ${now.month}월 ${now.day}일 시점의 일반적인 모습입니다.\n\n${_userPlantSelected}의 현재 모습과 한 번 비교해 보세요!");
      _imageList.add(Image.network(
          width: 320, height: 300, fit: BoxFit.cover, pickedImageUrl!));
      _originalImageList
          .add(Image.network(fit: BoxFit.contain, pickedImageUrl!));
      _imageList.add(Image.memory(
          width: 320, height: 300, fit: BoxFit.cover, _imageBytes));
      _originalImageList.add(Image.memory(fit: BoxFit.contain, _imageBytes));
      notifyListeners();
      return true;
    } else {
      // API 응답이 실패한 경우
      throw Exception('API 요청 실패');
    }
//보통 Provider의 값을 변경하기 위한 함수는 read를 통해 접근하며, 상태값을 사용할 때에는 watch를 사용합니다.
  }
}
