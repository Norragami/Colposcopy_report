import 'package:colposcopy_report/models/form_item_data.dart';
import 'package:colposcopy_report/ui/fomr_item.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:pdf/widgets.dart' as _;

abstract class SchemeItem<T> {
  SchemeItem({required this.fid, required this.formGroup});
  final FormItemData fid;
  final FormGroup formGroup;

  Widget build();
  _.Widget? buildReport();
}

abstract class SchemeItems<T> extends SchemeItem<T> {
  SchemeItems(
      {required this.items, required super.fid, required super.formGroup});
  final List<SchemeItem> items;
}

// Container
class SchemeItemContainer extends SchemeItem {
  SchemeItemContainer(
      {this.item, required super.fid, required super.formGroup});
  SchemeItemContainer.empty()
      : item = null,
        super(fid: FormItemData(), formGroup: FormGroup({}));

  final SchemeItem? item;

  // @override
  // String get

  @override
  _.Widget? buildReport() {
    var w = item?.buildReport();
    if (w != null) return _.Container(child: item?.buildReport());
  }

  @override
  Widget build() {
    var w = item?.build();
    return Container(child: w);
  }
}

class SchemeItemColumn extends SchemeItems {
  SchemeItemColumn({
    required super.items,
    required super.fid,
    required super.formGroup,
  });

  @override
  _.Widget? buildReport() {
    var list = [for (var item in items) item.build()];
    if (list.isNotEmpty) {
      return _.Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        ),
      );
    }
  }
  @override
  Widget build() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [for (var item in items) item.build()],
        ),
      );
}

class SchemeItemWrap extends SchemeItems {
  SchemeItemWrap({
    required super.items,
    required super.fid,
    required super.formGroup,
  });

  @override
  Widget build() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Wrap(
          spacing: 30,
          runSpacing: 0,
          children: [for (var item in items) item.build()],
        ),
      );
}

class SchemeItemTabs extends SchemeItems {
  SchemeItemTabs({
    required super.items,
    required super.fid,
    required super.formGroup,
  });

  @override
  Widget build() => FormItemTabs(this);
}

class SchemeItemExpander extends SchemeItems<bool> {
  SchemeItemExpander(
      {required super.items, required super.fid, required super.formGroup}) {
    _value.addListener(onExpand);
  }

  ValueNotifier<bool> get value => _value;
  final _value = ValueNotifier<bool>(false);
  ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build() {
    return FormItemExpander(this);
  }

  void onExpand() {
    print('ssss');
    if (value.value) {
      controller.collapse();
    } else {
      controller.expand();
    }
  }
}

// Inputs
class SchemeItemInput extends SchemeItem<String> {
  SchemeItemInput({
    required super.fid,
    required super.formGroup,
  });

  @override
  Widget build() => FormItemInputLine(this);

  @override
  _.Widget? buildReport() {
    if (formGroup.controls[fid.key] != null &&
        formGroup.controls[fid.key]!.value != null) {
      return _.Text(formGroup.controls[fid.key]!.value.toString());
    }
  }
}

class SchemeItemNotes extends SchemeItem<String> {
  SchemeItemNotes({
    required super.fid,
    required super.formGroup,
  });
  @override
  Widget build() => FormItemInputLine(this);
}

class SchemeItemDate extends SchemeItem<String> {
  SchemeItemDate({required super.fid, required super.formGroup});

  @override
  Widget build() => FormItemDate(this);
}

class SchemeItemText extends SchemeItem<String> {
  SchemeItemText({required super.fid, required super.formGroup});

  @override
  Widget build() => Text(fid.title);
}
