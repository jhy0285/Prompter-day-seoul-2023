import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fun1_provider.dart';

class AgeUnitDropDownMenu extends StatefulWidget {
  const AgeUnitDropDownMenu({
    Key? key,
  }) : super(key: key);
  @override
  State<AgeUnitDropDownMenu> createState() => AgeUnitDropDownMenuState();
}

class AgeUnitDropDownMenuState extends State<AgeUnitDropDownMenu> {
  List<DropdownMenuItem<String>>? items;
  @override
  void initState() {
    items = ["월", "주"].map((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Text(option),
      );
    }).toList();
    super.initState();
  }

  void _handleValueChanged(String? value) {
    Provider.of<Fun1Provider>(context, listen: false)
        .changeAgeUnitSelected(value: value!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Fun1Provider>(builder: (_, provider, __) {
      return DropdownButtonFormField(
        value: provider.ageUnitSelected,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        items: items,
        onChanged: _handleValueChanged,
      );
    });
  }
}
