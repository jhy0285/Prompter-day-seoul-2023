import 'package:ai_hack/model/response/user_plant_list.dart';
import 'package:ai_hack/provider/fun2_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fun3_provider.dart';

class UserPlantDropDownMenu extends StatefulWidget {
  const UserPlantDropDownMenu({Key? key}) : super(key: key);

  @override
  State<UserPlantDropDownMenu> createState() => DropDownMenuStateContainer();
}

class DropDownMenuStateContainer extends State<UserPlantDropDownMenu> {
  void _handleValueChanged(String? value) {
    String target = value!.replaceAll(RegExp(r'[()]'), '');
    var userPlantList =
        Provider.of<Fun2Provider>(context, listen: false).userPlantList;
    for (UserPlant userPlant in userPlantList) {
      if (userPlant.name + userPlant.plantType == target) {
        Provider.of<Fun2Provider>(context, listen: false)
            .rememberSelectedPlantId(id: userPlant.id);
        Provider.of<Fun3Provider>(context, listen: false)
            .rememberSelectedPlantId(id: userPlant.id);
      }
    }
    Provider.of<Fun2Provider>(context, listen: false)
        .changeUserPlantSelected(value: value!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Fun2Provider>(
      builder: (_, provider, __) {
        return DropdownButtonFormField(
          value: provider.userPlantSelected,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: provider.userPlantList.map((UserPlant userPlant) {
            return DropdownMenuItem<String>(
              value: userPlant.name + "(" + userPlant.plantType + ")",
              child: Text(userPlant.name + "(" + userPlant.plantType + ")"),
            );
          }).toList(),
          onChanged: _handleValueChanged,
        );
      },
    );
  }
}
