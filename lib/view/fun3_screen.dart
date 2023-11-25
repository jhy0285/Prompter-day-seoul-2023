import 'dart:typed_data';

import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/provider/fun3_provider.dart';
import 'package:ai_hack/view/fun3_result_screen.dart';
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

class Fun3Screen extends StatefulWidget {
  const Fun3Screen({Key? key}) : super(key: key);

  @override
  State<Fun3Screen> createState() => _Fun3ScreenState();
}

class _Fun3ScreenState extends State<Fun3Screen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Fun3Provider>(context, listen: false).clearProviderStates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<Fun3Provider>(context, listen: false).clearProviderStates();
        return true;
      },
      child: Scaffold(
        endDrawer: const CustomDrawer(currentScreen: 'fun3'),
        key: _globalKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background3.jpg'),
                    fit: BoxFit.cover),
              ),
              height: 800,
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
                    Container(
                      height: 70,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
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
                          Text("키우면서 궁금한 부분\n자유롭게 물어보세요!",
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 30),
                                  const Row(
                                    children: [
                                      Text("궁금한 점이 무엇인가요?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Color(0xff131313),
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                          flex: 10,
                                          child: UserPlantDropDownMenu()),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 200,
                                    child: TextFormField(
                                      controller:
                                          Provider.of<Fun3Provider>(context)
                                              .controller,
                                      maxLines: 8,
                                      onChanged: (str) {
                                        setState(() {});
                                      },
                                      style: const TextStyle(
                                          fontSize: 20), // 텍스트 스타일 설정
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.all(12), // 텍스트 안의 여백 설정
                                        hintText: '무엇이든 질문해 보세요!', // 힌트 텍스트 설정
                                        border: OutlineInputBorder(
                                          // 테두리 스타일 설정
                                          borderRadius: BorderRadius.circular(
                                              10), // 테두리의 둥근 정도 설정
                                          borderSide: const BorderSide(
                                              color: Colors.blue,
                                              width: 2), // 테두리 선 스타일 설정
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 현재 글자 수와 총 글자 수 표시
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                          "${Provider.of<Fun3Provider>(context).controller.text.length}/${400}"),
                                    ],
                                  ),
                                  const SizedBox(height: 130),
                                  Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // 원하는 둥글기 설정
                                          ),
                                        ),
                                        // 버튼의 크기 설정
                                        minimumSize: MaterialStateProperty.all(
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Fun3ResultScreen()));
                                      },
                                      child: const Text('다음'),
                                    ),
                                  )
                                ],
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
