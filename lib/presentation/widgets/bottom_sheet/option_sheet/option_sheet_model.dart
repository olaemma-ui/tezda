class OptionSheetModel<T> {
  final T? data;
  final dynamic id;
  final String title;
  final String? subTitle;
  final String? trailing;
  final bool? isSelected;

  OptionSheetModel({
    required this.id,
    required this.data,
    required this.title,
    this.subTitle,
    this.trailing,
    this.isSelected,
  });

  OptionSheetModel<T> copyWith({
    String? title,
    String? subTitle,
    String? trailing,
    T? data,
    bool? isSelected,
    dynamic id,
  }) =>
      OptionSheetModel(
        id: id ?? this.id,
        title: title ?? this.title,
        trailing: trailing ?? this.trailing,
        subTitle: subTitle ?? this.subTitle,
        data: data ?? this.data,
        isSelected: isSelected ?? this.isSelected,
      );
}
