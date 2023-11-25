import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:ai_hack/view/fun1_result_screen.dart';
import 'package:ai_hack/widget/age_unit_dropdown_menu.dart';
import 'package:ai_hack/widget/date_dropdown_menu.dart';
import 'package:ai_hack/widget/drawer.dart';
import 'package:ai_hack/widget/header.dart';
import 'package:ai_hack/widget/main_list_container.dart';
import 'package:ai_hack/widget/text_input_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fun1Screen extends StatefulWidget {
  const Fun1Screen({Key? key}) : super(key: key);

  @override
  State<Fun1Screen> createState() => _Fun1ScreenState();
}

class _Fun1ScreenState extends State<Fun1Screen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Fun1Provider>(context, listen: false).clearProviderStates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<Fun1Provider>(context, listen: false).clearProviderStates();
        // true를 반환하면 페이지를 빠져나가고, false를 반환하면 뒤로가기 무시됨
        return true;
      },
      child: Scaffold(
        endDrawer: const CustomDrawer(currentScreen: 'fun1'),
        key: _globalKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background1.png'),
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
                    //더 잘 키우기 위한 시작, Plant Pal
                    Container(
                      height: 70,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Text(
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
                                margin: EdgeInsets.only(bottom: 10), //
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
                    //어떤 식물과 함꼐 하고 있나요?
                    Container(
                      height: 95,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text("어떤 식물과 함께\n하고 있나요?",
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
                    //하얀색 컨테이너
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
                            //하얀색컨테이너 좌 여백
                            const SizedBox(width: 20),
                            Expanded(
                              child: Consumer<Fun1Provider>(
                                builder: (_, provider, __) {
                                  return Column(
                                    children: [
                                      const SizedBox(height: 30),
                                      TextInputContainer(
                                        title: "식물 이름",
                                        labelText: "20자 이내",
                                        controller:
                                            provider.plantNameController,
                                      ),
                                      const SizedBox(height: 30),
                                      TextInputContainer(
                                        title: "식물 종류",
                                        labelText: "20자 이내",
                                        controller:
                                            provider.plantTypeController,
                                      ),
                                      const SizedBox(height: 30),
                                      //함께한 시작일 과 년,월,일 드롭다운 메뉴
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("함께한 시작일",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff131313))),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              Flexible(
                                                  flex: 7,
                                                  child: DateDropDownMenu(
                                                      selected:
                                                          provider.yearSelected,
                                                      dateMode: "year")),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  flex: 5,
                                                  child: DateDropDownMenu(
                                                      selected: provider
                                                          .monthSelected,
                                                      dateMode: "month")),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  flex: 5,
                                                  child: DateDropDownMenu(
                                                      selected:
                                                          provider.daySelected,
                                                      dateMode: "day")),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      //나이(월/주) 랑 월 드롭다운 메뉴랑 텍스트필드
                                      //거기다가 나이 체크박스까지
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("나이(월/주)",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff131313))),
                                          const SizedBox(height: 15),
                                          Row(children: [
                                            const Flexible(
                                              flex: 2,
                                              child: AgeUnitDropDownMenu(),
                                            ),
                                            const SizedBox(width: 15),
                                            Flexible(
                                              flex: 5,
                                              child: TextFormField(
                                                controller:
                                                    provider.ageController,
                                                decoration: InputDecoration(
                                                    labelText: "숫자로 입력해주세요.",
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    )),
                                              ),
                                            )
                                          ]),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  splashRadius: 12,
                                                  value: provider.isChecked,
                                                  onChanged:
                                                      provider.toggleCheckbox),
                                              const Text("나이는 확실하지 않아요...",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff131313)))
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 80),
                                      //다음 버튼
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                        onPressed: () async {
                                          //텍스트필드가 전부 채워져있다면
                                          if (provider.isReadyToResult()) {
                                            //yyyy년mm월mm일로 완성된 년도를 셋팅하고
                                            provider.setResultDate();
                                            //fun1-result화면으로 넘어간다.
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Fun1ResultScreen()));
                                            //안채워져있으면 아무것도 안함. 토스트는 isReadyToResult여기서 띄움
                                          } else {}
                                        },
                                        child: const Text('다음'),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            //하얀색컨테이너 우 여백
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
