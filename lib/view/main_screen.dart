import 'package:ai_hack/widget/drawer.dart';
import 'package:ai_hack/widget/header.dart';
import 'package:ai_hack/widget/main_list_container.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(currentScreen: "main"),
      key: _globalKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 750,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Header(globalKey: _globalKey, isMain: true),
              const SizedBox(
                height: 11,
              ),
              SizedBox(
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "  더 잘 키우기 위한 시작",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.24,
                            fontSize: 15,
                            color: Color(0xff131313),
                          ),
                        ),
                        Image.asset(
                            width: 300,
                            height: 70,
                            'assets/images/logoBlack.png')
                      ],
                    ),
                  ],
                ),
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 32),
                            MainListContainer(
                              title: "내 친구, 앞으로 어떻게 자랄까",
                              description:
                                  "내 반려식물이 앞으로 언제, 얼마나 \n성장하게 될지 미리 알아보세요",
                              imgUrl: 'assets/images/fun1moji.png',
                              pushName: "fun1",
                            ),
                            SizedBox(height: 24),
                            MainListContainer(
                              title: "얼마나 잘 크고 있는 걸까",
                              description: "내 반려식물의 상태와 \n이상적인 성장수준을 비교해 보세요 ",
                              imgUrl: 'assets/images/fun2moji.png',
                              pushName: "fun2",
                            ),
                            SizedBox(height: 24),
                            MainListContainer(
                              title: "조언이 필요할 때",
                              description: "반려식물과 함께 하면서 \n생긴 궁금한 모든 것을 물어보세요",
                              imgUrl: 'assets/images/fun3moji.png',
                              pushName: "fun3",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
