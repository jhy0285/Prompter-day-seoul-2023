import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:ai_hack/provider/fun3_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fun1_provider.dart';

class Header extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final Color? iconColor;
  final Color? headerColor;
  final bool? isMain;
  const Header({
    Key? key,
    required this.globalKey,
    this.iconColor,
    this.headerColor,
    this.isMain,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.headerColor,
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20,
          ),
          (widget.isMain == null || widget.isMain == false)
              ? IconButton(
                  color: widget.iconColor,
                  splashRadius: 15,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                )
              : const SizedBox(),
          const Spacer(),
          IconButton(
            color: widget.iconColor,
            splashRadius: 15,
            onPressed: () {
              widget.globalKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          Container(
            width: 20,
          ),
        ],
      ),
    );
  }
}
