// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormItemDataImpl _$$FormItemDataImplFromJson(Map<String, dynamic> json) =>
    _$FormItemDataImpl(
      key: json['key'] as String? ?? '',
      itemType: $enumDecodeNullable(_$FormItemTypeEnumMap, json['itemType']) ??
          FormItemType.inputLine,
      title: json['title'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FormItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FormItemDataImplToJson(_$FormItemDataImpl instance) {
  final val = <String, dynamic>{
    'key': instance.key,
    'itemType': _$FormItemTypeEnumMap[instance.itemType]!,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items);
  writeNotNull('properties', instance.properties);
  return val;
}

const _$FormItemTypeEnumMap = {
  FormItemType.unknown: 'unknown',
  FormItemType.title: 'title',
  FormItemType.inputLine: 'inputLine',
  FormItemType.inputNotes: 'inputNotes',
  FormItemType.inputDate: 'inputDate',
  FormItemType.radioButton: 'radioButton',
  FormItemType.checkBox: 'checkBox',
  FormItemType.toggleButton: 'toggleButton',
  FormItemType.toggleButtonExpander: 'toggleButtonExpander',
  FormItemType.comboBox: 'comboBox',
  FormItemType.items: 'items',
  FormItemType.expander: 'expander',
  FormItemType.checkBoxGroup: 'checkBoxGroup',
  FormItemType.comboBoxMd: 'comboBoxMd',
  FormItemType.slider: 'slider',
};
