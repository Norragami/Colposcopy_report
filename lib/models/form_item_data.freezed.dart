// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormItemData _$FormItemDataFromJson(Map<String, dynamic> json) {
  return _FormItemData.fromJson(json);
}

/// @nodoc
mixin _$FormItemData {
  String get key => throw _privateConstructorUsedError;
  FormItemType get itemType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<FormItemData>? get items => throw _privateConstructorUsedError;
  List<String>? get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$FormItemDataImpl implements _FormItemData {
  const _$FormItemDataImpl(
      {this.key = '',
      this.itemType = FormItemType.inputLine,
      this.title = '',
      final List<FormItemData>? items,
      final List<String>? properties})
      : _items = items,
        _properties = properties;

  factory _$FormItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormItemDataImplFromJson(json);

  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final FormItemType itemType;
  @override
  @JsonKey()
  final String title;
  final List<FormItemData>? _items;
  @override
  List<FormItemData>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _properties;
  @override
  List<String>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FormItemDataImplToJson(
      this,
    );
  }
}

abstract class _FormItemData implements FormItemData {
  const factory _FormItemData(
      {final String key,
      final FormItemType itemType,
      final String title,
      final List<FormItemData>? items,
      final List<String>? properties}) = _$FormItemDataImpl;

  factory _FormItemData.fromJson(Map<String, dynamic> json) =
      _$FormItemDataImpl.fromJson;

  @override
  String get key;
  @override
  FormItemType get itemType;
  @override
  String get title;
  @override
  List<FormItemData>? get items;
  @override
  List<String>? get properties;
}
