import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/provider/fun3_provider.dart';
import 'package:ai_hack/view/fun1_screen.dart';
import 'package:ai_hack/view/fun2_screen.dart';
import 'package:ai_hack/view/fun3_screen.dart';
import 'package:ai_hack/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fun1_provider.dart';

class CustomDrawer extends StatefulWidget {
  final String currentScreen;
  const CustomDrawer({required this.currentScreen, Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              IconButton(
                splashRadius: 15,
                iconSize: 35, //
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      clearCurrentScreenProviderStatesBeforePush(
                          widget.currentScreen, context);
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    child: const Text('홈    ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xff111111),
                        )),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      clearCurrentScreenProviderStatesBeforePush(
                          widget.currentScreen, context);
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Fun1Screen()));
                    },
                    child: const Text('어떻게 자랄까',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xff111111),
                        )),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      if (await Provider.of<Fun2Provider>(context,
                                  listen: false)
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
                        clearCurrentScreenProviderStatesBeforePush(
                            widget.currentScreen, context);
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Fun2Screen()));
                      }
                    },
                    child: const Text('잘 크고 있는걸까',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xff111111),
                        )),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      if (await Provider.of<Fun2Provider>(context,
                                  listen: false)
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
                        clearCurrentScreenProviderStatesBeforePush(
                            widget.currentScreen, context);

                        int id =
                            Provider.of<Fun2Provider>(context, listen: false)
                                .selectedPlantId;

                        Provider.of<Fun3Provider>(context, listen: false)
                            .rememberSelectedPlantId(id: id);
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Fun3Screen()));
                      }
                    },
                    child: const Text('조언이 필요해요',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xff111111),
                        )),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

void clearCurrentScreenProviderStatesBeforePush(
    String currentScreen, BuildContext context) {
  switch (currentScreen) {
    case "main":
      break;
    case "fun1":
      Provider.of<Fun1Provider>(context, listen: false).clearProviderStates();
      break;
    case "fun1-result":
      break;
    case "fun2":
      Provider.of<Fun2Provider>(context, listen: false).clearProviderStates();
      break;
    case "fun2-result":
      break;
    case "fun3":
      Provider.of<Fun3Provider>(context, listen: false).clearProviderStates();
      break;
    case "fun3-result":
      break;
  }
}
