// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'form_item_data.freezed.dart';
part 'form_item_data.g.dart';

// @Freezed(equal: false, toStringOverride: false)
// @Freezed(copyWith: false, equal: false, toStringOverride: false)
@JsonSerializable(includeIfNull: false)
class FormItemData {
  FormItemData({
    this.key = '',
    this.itemType = FormItemType.unknown,
    this.title = '',
    this.items,
    this.properties,
    this.validators,
    this.defaultValue,
    this.hint,
    this.style,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });
  @Default('')
  String key;

  @JsonKey(name: 'type', defaultValue: FormItemType.unknown)
  FormItemType itemType;

  @Default('')
  String title;

  List<FormItemData>? items;
  List<String>? properties, validators;
  Object? defaultValue;
  String? hint, style;
  int? minWidth, maxWidth, minHeight, maxHeight;

  factory FormItemData.fromJson(Map<String, dynamic> json) =>
      _$FormItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormItemDataToJson(this);
}

@JsonEnum()
enum FormItemType {
  unknown,

  //containers
  tabs,
  expander, // vertical +weight

  // inputs
  input, // TextField
  notes, // TextField
  date, // DateTime
  checkbox,
  radio,

  combobox,

  checkboxGroup,
  radioGroup,

  group, // FormGroup

  text, 
  column,
  wrap,

}