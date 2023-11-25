class RequestFun1 {
  final String name;
  final String plantType;
  final String meetDate;
  final int isChecked;
  final String ageUnit;
  final int ageQuantity;

  RequestFun1({
    required this.name,
    required this.plantType,
    required this.meetDate,
    required this.isChecked,
    required this.ageUnit,
    required this.ageQuantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'plantType': plantType,
      'meetDate': meetDate,
      'isChecked': isChecked,
      'ageUnit': ageUnit,
      'ageQuantity': ageQuantity,
    };
  }
}
