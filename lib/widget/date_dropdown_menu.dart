import 'package:ai_hack/provider/fun1_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateDropDownMenu extends StatefulWidget {
  final String dateMode;
  String selected;
  DateDropDownMenu({
    Key? key,
    required this.dateMode,
    required this.selected,
  }) : super(key: key);
  @override
  State<DateDropDownMenu> createState() => _DateDropDownMenuState();
}

class _DateDropDownMenuState extends State<DateDropDownMenu> {
  List<DropdownMenuItem<String>>? items;
  @override
  void initState() {
    super.initState();

    switch (widget.dateMode) {
      case 'year':
        items = List.generate(41, (index) => (1990 + index).toString())
            .map((String option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList();

        break;
      case 'month':
        items = List.generate(12, (index) => (1 + index).toString())
            .map((String option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList();
        break;
      case 'day':
        items = List.generate(31, (index) => (1 + index).toString())
            .map((String option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList();
        break;
      default:
    }
  }

  void _handleValueChanged(String? value) {
    Provider.of<Fun1Provider>(context, listen: false)
        .changeDateSelected(dateMode: widget.dateMode, value: value!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Fun1Provider>(
      builder: (_, provider, __) {
        return DropdownButtonFormField(
          value: widget.selected,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: items,
          onChanged: _handleValueChanged,
        );
      },
    );
  }
}
