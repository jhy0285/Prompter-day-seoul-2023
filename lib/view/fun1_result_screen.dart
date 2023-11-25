import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:ai_hack/widget/age_unit_dropdown_menu.dart';
import 'package:ai_hack/widget/date_dropdown_menu.dart';
import 'package:ai_hack/widget/drawer.dart';
import 'package:ai_hack/widget/header.dart';
import 'package:ai_hack/widget/main_list_container.dart';
import 'package:ai_hack/widget/text_input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Fun1ResultScreen extends StatefulWidget {
  const Fun1ResultScreen({Key? key}) : super(key: key);

  @override
  State<Fun1ResultScreen> createState() => _Fun1ResultScreenState();
}

class _Fun1ResultScreenState extends State<Fun1ResultScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  List<String> svgList = [
    'assets/images/seed.jpg',
    'assets/images/sprout.jpg',
    'assets/images/roots.jpg',
    'assets/images/flower.jpg',
    'assets/images/plant.jpg'
  ];
  List<String> imageList = [
    'assets/images/g1.jpg',
    'assets/images/g2.jpg',
    'assets/images/g3.jpg',
    'assets/images/g4.jpg',
    'assets/images/g5.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Provider.of<Fun1Provider>(context, listen: false).clearProviderStates();
        return true;
      },
      child: Scaffold(
        endDrawer: const CustomDrawer(currentScreen: 'fun1-result'),
        key: _globalKey,
        body: FutureBuilder<bool>(
          future:
              //fun1 api 요청해서 plant
              Provider.of<Fun1Provider>(context, listen: false).getGPTResult(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Header(
                    globalKey: _globalKey,
                    iconColor: Colors.black,
                    headerColor: Colors.white,
                  ),
                  const SizedBox(height: 100),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator()),
                      SizedBox(height: 15),
                      Text(
                        "Loading...",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Text("앞으로의 성장모습을 추정하고 있습니다.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24)),
                      Text("조금만 기다려주세요.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24)),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Header(
                    globalKey: _globalKey,
                    iconColor: Colors.black,
                    headerColor: Colors.white,
                  ),
                  const SizedBox(height: 100),
                  Container(
                      width: 300,
                      height: 500,
                      child: Text('식물 가이드를 받아오지 못했습니다!: ${snapshot.error}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24))),
                ],
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: 860,
                    color: const Color(0xfff4f4f4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(
                          globalKey: _globalKey,
                          iconColor: Colors.black,
                          headerColor: Colors.white,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 20),
                                        Text(
                                          Provider.of<Fun1Provider>(
                                            context,
                                          ).plantNameController.text,
                                          style: const TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff131313),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Color(
                                                      0xffE4E4E4), // 테두리 색상
                                                  width: 2.0, // 테두리 두께
                                                ),
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xffE4E4E4), // 테두리 색상
                                                  width: 2.0, // 테두리 두께
                                                ),
                                              ),
                                            ),
                                            height: 80,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 15),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "종류: ${Provider.of<Fun1Provider>(
                                                              context,
                                                            ).plantTypeController.text}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff141414),
                                                            )),
                                                        Text(
                                                            "함께한 시점: ${Provider.of<Fun1Provider>(
                                                              context,
                                                            ).resultDate}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff141414),
                                                            ))
                                                      ],
                                                    )
                                                    //Column
                                                    //text 2개
                                                  ],
                                                ),
                                                const SizedBox(height: 15)
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                  height: 410,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      14.0), // 경계 반경 설정
                                            ),
                                            width: 300,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(14.0),
                                                    topRight:
                                                        Radius.circular(14.0),
                                                  ),
                                                  child: Image.asset(
                                                    fit: BoxFit.fill,
                                                    imageList[index],
                                                    width: 300,
                                                    height: 180, // 세로 크기
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  Provider.of<Fun1Provider>(
                                                                          context)
                                                                      .stageList[index],
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xff131313),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                    "예상 시점: ${Provider.of<Fun1Provider>(context).expectedDateList[index]}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Color(
                                                                          0xff000000),
                                                                    )),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                width: 30),
                                                            Image.asset(
                                                              fit: BoxFit.fill,
                                                              svgList[index],
                                                              height: 45,
                                                              width: 45,
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 30),
                                                        Row(
                                                          children: [
                                                            const Text("평균길이",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xff000000),
                                                                )),
                                                            const SizedBox(
                                                                width: 20),
                                                            Text(
                                                              Provider.of<Fun1Provider>(
                                                                          context)
                                                                      .averageLengthList[
                                                                  index],
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Row(
                                                          children: [
                                                            const Text("잎크기",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xff000000),
                                                                )),
                                                            SizedBox(width: 33),
                                                            Text(
                                                              Provider.of<Fun1Provider>(
                                                                          context)
                                                                      .leafSizeList[
                                                                  index],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              child: const Text(
                                                                  "Tip",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xff000000),
                                                                  )),
                                                            ),
                                                            const SizedBox(
                                                                width: 51),
                                                            Container(
                                                              width: 200,
                                                              child: Text(
                                                                Provider.of<Fun1Provider>(
                                                                        context)
                                                                    .tipList[index],
                                                                softWrap: true,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 15)
                                        ],
                                      );
                                    },
                                  )),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
