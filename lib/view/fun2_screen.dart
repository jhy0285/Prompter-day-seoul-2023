import 'dart:typed_data';

import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/view/fun2_result_screen.dart';
import 'package:ai_hack/widget/age_unit_dropdown_menu.dart';
import 'package:ai_hack/widget/date_dropdown_menu.dart';
import 'package:ai_hack/widget/drawer.dart';
import 'package:ai_hack/widget/header.dart';
import 'package:ai_hack/widget/main_list_container.dart';
import 'package:ai_hack/widget/text_input_container.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../widget/user_plant_dropdown_menu.dart';

class Fun2Screen extends StatefulWidget {
  const Fun2Screen({Key? key}) : super(key: key);

  @override
  State<Fun2Screen> createState() => _Fun2ScreenState();
}

class _Fun2ScreenState extends State<Fun2Screen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Fun2Provider>(context, listen: false).clearProviderStates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<Fun2Provider>(context, listen: false).clearProviderStates();
        // true를 반환하면 페이지를 빠져나가고, false를 반환하면 뒤로가기 무시됨
        return true;
      },
      child: Scaffold(
        endDrawer: const CustomDrawer(currentScreen: 'fun2'),
        key: _globalKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    // colorFilter: ColorFilter.mode(color, blendMode),
                    image: AssetImage('assets/images/background2.jpg'),
                    fit: BoxFit.cover),
              ),
              height: 1200,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      globalKey: _globalKey,
                      iconColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    SizedBox(
                      height: 70,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              const Text(
                                "더 잘 키우기 위한 시작,   ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.24,
                                  fontSize: 18,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              Container(
                                height: 30,
                                margin: const EdgeInsets.only(bottom: 10), //
                                // color: Colors.amber,
                                child: Image.asset(
                                    fit: BoxFit.cover,
                                    'assets/images/logo.png'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text("내 식물이\n잘 크고 있는 건가요?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: Color(0xffffffff))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0), // 왼쪽 위 모서리
                            topRight: Radius.circular(24.0), // 오른쪽 위 모서리
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: Consumer<Fun2Provider>(
                                builder: (_, provider, __) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 30),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "식물 선택",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff131313)),
                                          ),
                                          SizedBox(height: 15),
                                          UserPlantDropDownMenu(),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      const Text("이미지를 업로드 해주세요!",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff131313))),
                                      const SizedBox(height: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        height: 80,
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                provider.pickImage();
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffE0E0E0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      16,
                                                    ),
                                                  ),
                                                  width: 60,
                                                  height: 60,
                                                  alignment: Alignment.center,
                                                  child: const Icon(
                                                      Icons.photo_camera)),
                                            ),
                                            const SizedBox(width: 12),
                                            GestureDetector(
                                              onTap: () {
                                                if (provider.pickedImageUrl !=
                                                    null) {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content: Image.network(
                                                          provider
                                                              .pickedImageUrl!,
                                                          fit: BoxFit
                                                              .contain, // 원본 이미지를 보여줍니다.
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // 다이얼로그 닫기
                                                            },
                                                            child: const Text(
                                                                '닫기'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    16,
                                                  ),
                                                  child: provider
                                                              .pickedImageUrl ==
                                                          null
                                                      ? null
                                                      : Image.network(
                                                          width: 60,
                                                          height: 60,
                                                          fit: BoxFit.cover,
                                                          provider
                                                              .pickedImageUrl!)),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      TextInputContainer(
                                        title: "잎 길이",
                                        labelText: "cm단위로 숫자만 입력",
                                        controller:
                                            provider.leafLengthController,
                                      ),
                                      const SizedBox(height: 30),
                                      TextInputContainer(
                                        title: "잎 크기",
                                        labelText: "cm단위로 숫지만 입력",
                                        controller: provider.leafSizeController,
                                      ),
                                      const SizedBox(height: 100),
                                      Center(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8), // 원하는 둥글기 설정
                                              ),
                                            ),
                                            // 버튼의 크기 설정
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(350, 50)),
                                            // 버튼 텍스트 색상 설정
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            //버튼 색
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color(0xffAFAFAF)),
                                          ),
                                          onPressed: () {
                                            if (provider.isReadyToResult()) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Fun2ResultScreen()));
                                            } else {}
                                          },
                                          child: const Text('다음'),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 20)
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
