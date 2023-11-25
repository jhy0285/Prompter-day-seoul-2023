import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/widget/age_unit_dropdown_menu.dart';
import 'package:ai_hack/widget/date_dropdown_menu.dart';
import 'package:ai_hack/widget/drawer.dart';
import 'package:ai_hack/widget/header.dart';
import 'package:ai_hack/widget/main_list_container.dart';
import 'package:ai_hack/widget/text_input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Fun2ResultScreen extends StatefulWidget {
  const Fun2ResultScreen({Key? key}) : super(key: key);

  @override
  State<Fun2ResultScreen> createState() => _Fu21ResultScreenState();
}

class _Fu21ResultScreenState extends State<Fun2ResultScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> title = ["내 반려의 현재", "다른 친구들은 보통 이만큼 커요"];
    return WillPopScope(
      onWillPop: () async {
        // Provider.of<Fun2Provider>(context, listen: false).clearProviderStates();
        return true;
      },
      child: Scaffold(
        endDrawer: const CustomDrawer(currentScreen: 'fun2-result'),
        key: _globalKey,
        body: FutureBuilder<bool>(
          future: Provider.of<Fun2Provider>(context, listen: false)
              .getProperImage(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
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
                      Text("적당한 성장수준을 보여드릴게요.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24)),
                      Text("조금만 기다려주세요",
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
                  SizedBox(
                      width: 300,
                      height: 500,
                      child: Text('사진을 받아오지 못했습니다!: ${snapshot.error}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24))),
                ],
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: 900,
                    color: const Color(0xfff4f4f4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(
                          globalKey: _globalKey,
                          iconColor: Colors.black,
                          headerColor: Colors.white,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 180,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 40),
                                    Row(children: [
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Provider.of<Fun2Provider>(context)
                                                .userPlantSelected,
                                            style: const TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff131313)),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                              "${Provider.of<Fun2Provider>(context).userPlantSelected}의 ${now.year}.${now.month}.${now.day}일 성장단계로 볼 떄,",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black)),
                                          const Text("적절한 모습은 아래와 같습니다.",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black))
                                        ],
                                      )
                                    ]),
                                    const SizedBox(height: 30),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                  height: 600,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          SizedBox(
                                            width: 320,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title[index],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20),
                                                ),
                                                const SizedBox(height: 15),
                                                Container(
                                                  height: 460,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    14.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    14.0),
                                                          ),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    content: Provider.of<Fun2Provider>(
                                                                            context)
                                                                        .originalImageList[index],
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop(); // 다이얼로그 닫기
                                                                        },
                                                                        child: const Text(
                                                                            '닫기'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Provider.of<
                                                                        Fun2Provider>(
                                                                    context)
                                                                .imageList[index],
                                                          )),
                                                      const SizedBox(
                                                          height: 25),
                                                      Row(
                                                        children: [
                                                          const SizedBox(
                                                              width: 14),
                                                          Expanded(
                                                            child: Container(
                                                              child: Text(
                                                                  Provider.of<Fun2Provider>(
                                                                              context)
                                                                          .imageInfo[
                                                                      index],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          16)),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 14),
                                                        ],
                                                      )
                                                    ],
                                                  ),
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
