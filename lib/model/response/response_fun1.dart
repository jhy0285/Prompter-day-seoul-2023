class ResponseFun1 {
  final String code;
  final String stage;
  final String feature;
  final double leafLength;
  final double size;
  final String datePoint;
  final String tip;

  ResponseFun1({
    required this.code,
    required this.stage,
    required this.feature,
    required this.leafLength,
    required this.size,
    required this.datePoint,
    required this.tip,
  });

  factory ResponseFun1.fromJson(Map<String, dynamic> json) {
    return ResponseFun1(
      code: json['code'] ?? "",
      stage: json['stage'] ?? "",
      feature: json['feature'] ?? "",
      leafLength: json['leaf_length'] ?? 0,
      size: json['size'] ?? 0,
      datePoint: json['date_point'] ?? "",
      tip: json['tip'] ?? "",
    );
  }
}
