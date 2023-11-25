import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/view/fun1_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fun3_provider.dart';
import '../view/fun2_screen.dart';
import '../view/fun3_screen.dart';

class MainListContainer extends StatefulWidget {
  final String title;
  final String description;
  final String imgUrl;
  final String pushName;

  const MainListContainer({
    Key? key,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.pushName,
  }) : super(key: key);

  @override
  State<MainListContainer> createState() => _MainListContainerState();
}

class _MainListContainerState extends State<MainListContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(14.0),
        onTap: () async {
          if (widget.pushName == "fun2" || widget.pushName == "fun3") {
            if (await Provider.of<Fun2Provider>(context, listen: false)
                    .isUserPlantThenGetData() ==
                false) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('경고'),
                  content: const Text('현재 유저의 식물정보가 없습니다.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('네'),
                    ),
                  ],
                ),
              );
            } else {
              pushScreen(widget.pushName, context);
            }
          } else {
            pushScreen(widget.pushName, context);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(14.0),
          ),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              // Column이 양옆 패딩 주고 사이시작
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Image.asset(
                widget.imgUrl, // 이미지 URL
                width: 70,
                height: 70, // 원하는 너비
                fit: BoxFit.fill, // 이미지가 영역에 맞게 조절되도록 설정
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void pushScreen(String pushName, BuildContext context) {
  switch (pushName) {
    case "fun1":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Fun1Screen()));
      break;
    case "fun2":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Fun2Screen()));
      break;
    case "fun3":
      int id =
          Provider.of<Fun2Provider>(context, listen: false).selectedPlantId;

      Provider.of<Fun3Provider>(context, listen: false)
          .rememberSelectedPlantId(id: id);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Fun3Screen()));
      break;
  }
}
