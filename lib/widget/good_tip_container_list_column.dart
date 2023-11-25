import 'package:flutter/material.dart';

class GoodTipContainerListColumn extends StatelessWidget {
  final List<dynamic> result;

  GoodTipContainerListColumn({required this.result});

  @override
  Widget build(BuildContext context) {
    List<Widget> goodTipList = [];

    for (int index = 0; index < result.length; index++) {
      goodTipList.add(
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            padding: EdgeInsets.fromLTRB(14, 24, 14, 34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("꿀팁 ${index + 1}",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                SizedBox(height: 10),
                Text(result[index]["title"],
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                SizedBox(height: 7),
                Text(result[index]["tip"],
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
              ],
            ),
          ),
        ),
      );

      goodTipList.add(SizedBox(
        height: 15,
      ));
    }

    return Column(
      children: goodTipList,
    );
  }
}
