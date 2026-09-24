import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  String _txtVal = "";
  bool _checkboxVal = true;
  int _radioValue = 2;
  double _sliderOneVal = .8;
  double _sliderTwoVal = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Center(
          // Alt + enter
          child: Column(
            children: [
              Text('Text fields'),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email...',
                ),
                onChanged: (value) => setState(() {
                  // 1st way
                  _txtVal = value;
                }),
              ),
              Text('You typed: $_txtVal'),
              TextField(),
              TextField(),
              TextField(),
              Divider(),
              Text('Checkboxes'),
              // 1
              CheckboxListTile(
                title: Text('This checkbox displayed as CheckboxListTile'),
                value: _checkboxVal,
                onChanged: (v) {
                  setState(() {
                    _checkboxVal = v!;
                  });
                },
              ),
              // 2
              ListTile(
                title: Text('This checkbox displayed as ListTile'),
                leading: Checkbox(
                  value: _checkboxVal,
                  onChanged: (v) {
                    setState(() {
                      _checkboxVal = v!;
                    });
                  },
                ),
              ),
              Text('Checkboxes val: $_checkboxVal'),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (v) {}),
                  Checkbox(value: true, onChanged: (v) {}),
                  Checkbox(value: null, onChanged: (v) {}, tristate: true),
                ],
              ),
              Divider(),
              Text('Radio'),
              RadioGroup<int>(
                onChanged: (v) {
                  setState(() {
                    _radioValue = v!;
                  });
                },
                groupValue: _radioValue,
                child: Column(
                  children: [
                    RadioListTile(value: 1, title: Text('Option 1')),
                    RadioListTile(value: 2, title: Text('Option 2')),
                    RadioListTile(value: false, title: Text('Option 3')),
                  ],
                ),
              ),
              Text('Radio value: $_radioValue'),
              Divider(),
              Text('Slider 1'),
              Slider(
                value: _sliderOneVal,
                onChanged: (v) {
                  setState(() {
                    _sliderOneVal = v;
                  });
                },
              ),
              Text('Slider 1 val: $_sliderOneVal'),
              Text('Slider 2'),
              Slider(
                value: _sliderTwoVal,
                onChanged: (v) {
                  setState(() {
                    _sliderTwoVal = v;
                  });
                },
                min: 0,
                max: 50,
                divisions: 10,
              ),
              Text('Slider 2 val: $_sliderTwoVal'),
              Divider(),
              Text('Switch'),
              Switch(value: false, onChanged: (v) {}),
              SwitchListTile(
                value: true,
                onChanged: (v) {},
                title: Text('SwitchListTile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
