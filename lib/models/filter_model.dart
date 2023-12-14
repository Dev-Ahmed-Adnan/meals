class FilterModel {
  FilterModel({
    required this.title,
    required this.descriptrion,
    required this.value,
    this.acive,
  });

  final String title;
  final String descriptrion;
  final String value;
  final bool? acive;
}
