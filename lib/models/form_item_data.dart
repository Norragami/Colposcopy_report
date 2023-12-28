// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_item_data.freezed.dart';
part 'form_item_data.g.dart';

@Freezed(copyWith: false, equal: false, toStringOverride: false)
// @JsonSerializable(explicitToJson: true)
class FormItemData with _$FormItemData {
  @JsonSerializable(includeIfNull: false)
  const factory FormItemData({
    @Default('') String key,
    @Default(FormItemType.inputLine) FormItemType itemType,
    @Default('') String title,
    List<FormItemData>? items,
    List<String>? properties,
    // Object? defaultValue,
    // String? hint,
    // List<String>? validators,
    // String? style,
    // int? minWidth,
    // int? maxWidth,
    // int? minHeight,
    // int? maxHeight,
  }) = _FormItemData;
  // }) = _FormItemData;

  factory FormItemData.fromJson(Map<String, dynamic> json) =>
      _$FormItemDataFromJson(json);
}

enum FormItemType {
  unknown,
  title,
  inputLine,
  inputNotes,
  inputDate,
  radioButton,
  checkBox,
  toggleButton,
  toggleButtonExpander,
  comboBox,
  items,
  expander,
  checkBoxGroup,
  comboBoxMd,
  slider,
}
