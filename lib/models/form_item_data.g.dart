// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormItemData _$FormItemDataFromJson(Map<String, dynamic> json) => FormItemData(
      key: json['key'] as String? ?? '',
      itemType: $enumDecodeNullable(_$FormItemTypeEnumMap, json['type']) ??
          FormItemType.unknown,
      title: json['title'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FormItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      validators: (json['validators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultValue: json['defaultValue'],
      hint: json['hint'] as String?,
      style: json['style'] as String?,
      minWidth: json['minWidth'] as int?,
      maxWidth: json['maxWidth'] as int?,
      minHeight: json['minHeight'] as int?,
      maxHeight: json['maxHeight'] as int?,
    );

Map<String, dynamic> _$FormItemDataToJson(FormItemData instance) {
  final val = <String, dynamic>{
    'key': instance.key,
    'type': _$FormItemTypeEnumMap[instance.itemType]!,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items);
  writeNotNull('properties', instance.properties);
  writeNotNull('validators', instance.validators);
  writeNotNull('defaultValue', instance.defaultValue);
  writeNotNull('hint', instance.hint);
  writeNotNull('style', instance.style);
  writeNotNull('minWidth', instance.minWidth);
  writeNotNull('maxWidth', instance.maxWidth);
  writeNotNull('minHeight', instance.minHeight);
  writeNotNull('maxHeight', instance.maxHeight);
  return val;
}

const _$FormItemTypeEnumMap = {
  FormItemType.unknown: 'unknown',
  FormItemType.tabs: 'tabs',
  FormItemType.expander: 'expander',
  FormItemType.input: 'input',
  FormItemType.notes: 'notes',
  FormItemType.date: 'date',
  FormItemType.checkbox: 'checkbox',
  FormItemType.radio: 'radio',
  FormItemType.combobox: 'combobox',
  FormItemType.checkboxGroup: 'checkboxGroup',
  FormItemType.radioGroup: 'radioGroup',
  FormItemType.group: 'group',
  FormItemType.text: 'text',
  FormItemType.column: 'column',
  FormItemType.wrap: 'wrap',
};
