import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/provider/fun3_provider.dart';
import 'package:ai_hack/widget/age_unit_dropdown_menu.dart';
import 'package:ai_hack/widget/date_dropdown_menu.dart';
import 'package:ai_hack/widget/drawer.dart';
import 'package:ai_hack/widget/good_tip_container_list_column.dart';
import 'package:ai_hack/widget/header.dart';
import 'package:ai_hack/widget/main_list_container.dart';
import 'package:ai_hack/widget/text_input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Fun3ResultScreen extends StatefulWidget {
  const Fun3ResultScreen({Key? key}) : super(key: key);

  @override
  State<Fun3ResultScreen> createState() => _Fun3ResultScreenState();
}

class _Fun3ResultScreenState extends State<Fun3ResultScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Provider.of<Fun3Provider>(context, listen: false).clearProviderStates();
        //여기 contex받는거 최악임
        return true;
      },
      child: Scaffold(
        endDrawer: const CustomDrawer(currentScreen: 'fun3-result'),
        key: _globalKey,
        body: FutureBuilder<bool>(
          future:
              Provider.of<Fun3Provider>(context, listen: false).getGoodTips(),
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
                      Text("당신의 고민을 위한 해결책을 알려드릴게요.",
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
                  SizedBox(
                      width: 300,
                      height: 500,
                      child: Text('꿀팁을 받아오지 못했네요!: ${snapshot.error}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24))),
                ],
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
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
                                // height: 180,
                                color: const Color(0xff141414),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 40),
                                    Row(children: [
                                      const SizedBox(width: 20),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Q.",
                                              style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff00D67A)),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                "${Provider.of<Fun2Provider>(context).userPlantSelected}의 고민",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white)),
                                            const SizedBox(height: 10),
                                            Text(
                                                softWrap: true,
                                                Provider.of<Fun3Provider>(
                                                        context)
                                                    .controller
                                                    .text,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ]),
                                    const SizedBox(height: 30),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          children: [
                            SizedBox(width: 20),
                            Text("A.",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        GoodTipContainerListColumn(
                            result:
                                Provider.of<Fun3Provider>(context).goodTipList),
                        const SizedBox(height: 50)
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
