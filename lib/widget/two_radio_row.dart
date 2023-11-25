// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text("함께한 시점",
// style: TextStyle(
// fontSize: 17,
// fontWeight: FontWeight.w600,
// color: Color(0xff131313))),
// const SizedBox(height: 15),
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Radio(
// splashRadius: 13,
// value: 1,
// groupValue: _selectedValue,
// onChanged: _handleRadioValueChange,
// ),
// const Text("날짜선택",
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.w400,
// color: Color(0xff131313))),
// const SizedBox(width: 15),
// Radio(
// splashRadius: 13,
// value: 2,
// groupValue: _selectedValue,
// onChanged: _handleRadioValueChange,
// ),
// const Text("나이입력",
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.w400,
// color: Color(0xff131313))),
// ],
// ),
// const SizedBox(height: 10),
// _selectedValue == 1
// ? const Row(
// children: [
// Flexible(
// flex: 7,
// child: DateDropDownMenu(
// dateMode: "year")),
// SizedBox(width: 10),
// Flexible(
// flex: 5,
// child: DateDropDownMenu(
// dateMode: "month")),
// SizedBox(width: 10),
// Flexible(
// flex: 5,
// child: DateDropDownMenu(
// dateMode: "day")),
// ],
// )
//     : TextFormField(
// decoration: InputDecoration(
// labelText: "년도로 입력",
// border: OutlineInputBorder(
// borderRadius:
// BorderRadius.circular(8.0),
// )),
// ),
// ],
// ),
