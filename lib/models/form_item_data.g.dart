// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormItemDataImpl _$$FormItemDataImplFromJson(Map<String, dynamic> json) =>
    _$FormItemDataImpl(
      key: json['key'] as String? ?? '',
      title: json['title'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => FormItemData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      itemType: $enumDecodeNullable(_$FormItemTypeEnumMap, json['itemType']) ??
          FormItemType.inputLine,
    );

Map<String, dynamic> _$$FormItemDataImplToJson(_$FormItemDataImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'items': instance.items,
      'properties': instance.properties,
      'itemType': _$FormItemTypeEnumMap[instance.itemType]!,
    };

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
