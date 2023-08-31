class Indicator {
  final String name;
  final int indicatorToMoId;
  final int parentId;
  final int order;

  Indicator({
    required this.name,
    required this.indicatorToMoId,
    required this.parentId,
    required this.order,
  });

  factory Indicator.fromJson(Map<String, dynamic> json) {
    return Indicator(
      name: json['name'],
      indicatorToMoId: json['indicator_to_mo_id'],
      parentId: json['parent_id'],
      order: json['order'],
    );
  }
}
