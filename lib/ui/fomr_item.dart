import 'package:colposcopy_report/ui/scheme_item.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

// TABS
class FormItemTabs extends StatelessWidget {
  const FormItemTabs(this.si, {super.key});
  final SchemeItems si;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 100),
      length: si.items.length,
      child: Column(
        children: [
          TabBar(
            tabs: [
              for (var item in si.items)
                Tab(
                    child: Text(
                  item.fid.title,
                  style: const TextStyle(fontSize: 16),
                )),
            ],
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: TabBarView(
                children: [
                  for (var item in si.items)
                    SingleChildScrollView(child: item.build()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// INPUT LINE
class FormItemInputLine extends StatelessWidget {
  const FormItemInputLine(this.si, {super.key});
  final SchemeItem si;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLineTitle(si.fid.title),
        ReactiveTextField<String>(
          maxLines: si is SchemeItemNotes ? 5 : 1,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          // readOnly: true,
          formControlName: si.fid.key,
          decoration: InputDecoration(
            // helperMaxLines: 1,
            helperText: '',
            constraints: si is SchemeItemNotes
                ? const BoxConstraints(minHeight: 265, maxWidth: 630)
                : null,
            // constraints: const BoxConstraints(maxHeight: 65, maxWidth: 300),
            contentPadding: si is SchemeItemNotes
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                : null,
            filled: !si.formGroup.disabled,

          ),
        ),
      ],
    );
  }
}

// INPUT DATE
class FormItemDate extends StatelessWidget {
  const FormItemDate(this.si, {super.key});
  final SchemeItemDate si;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLineTitle(si.fid.title),
        ReactiveTextField<DateTime?>(
          onSubmitted: (control) {
            print(control.value);
          },
          onChanged: (control) {
            print(control.value);
          },
          formControlName: si.fid.key,
          readOnly: true,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            helperText: '',
            filled: !si.formGroup.disabled,
            suffixIcon: si.formGroup.disabled
                ? null
                : ReactiveDatePicker<DateTime>(
                    formControlName: si.fid.key,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, picker, child) => IconButton(
                      onPressed: picker.showPicker,
                      icon: const Icon(Icons.date_range),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

// EXPANDER
class FormItemExpander extends StatelessWidget {
  const FormItemExpander(this.si, {super.key});
  final SchemeItemExpander si;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        print('onExpansionChanged $value');
      },
      controller: si.controller,
      title: Text(si.fid.title),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      expandedAlignment: Alignment.centerLeft,
      shape: const RoundedRectangleBorder(),
      controlAffinity: ListTileControlAffinity.leading,
      children: [for (var e in si.items) e.build()],
    );
  }
}

class InputLineTitle extends StatelessWidget {
  const InputLineTitle(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
      child: Text(title),
    );
  }
}

class FormRoot extends StatelessWidget {
  const FormRoot({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
