import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:calendar_date_picker2/calendar_date_picker2.dart' as picker2;

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final TextEditingController _idController = TextEditingController(text: '');
  final TextEditingController _pwController = TextEditingController(text: '');
  final TextEditingController _pwCheckController =
      TextEditingController(text: '');
  final TextEditingController _birthController =
      TextEditingController(text: DateTime.now().toString().split(' ')[0]);

  //DateFormat사용법
  // DateFormat('yyyy/MM/dd').format(DateTime.now());

  List<DateTime?> _singleDatePickerValueWithDefaultValue = [DateTime.now()];
  // state
  String _gender = '남자';
  String _dropdown = '주민등록증';
  final _formKey = GlobalKey<FormState>();

  int count = 0;

  final config = picker2.CalendarDatePicker2Config(
    //데이터 타입을 바꾸면 multi,range 등이 지원됩니다.
    calendarType: picker2.CalendarDatePicker2Type.multi,
    //선택일자색상
    selectedDayHighlightColor: Colors.amber[900],
    //캘린더 요일 구분
    weekdayLabels: ['일', '월', '화', '수', '목', '금', '토'],
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    //시작요일 0 ~ 6, 일 ~ 월
    firstDayOfWeek: 0,
    controlsHeight: 50,
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle:
        const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
    //재선택 시 해제 로직
    selectableDayPredicate: (day) => !day
        .difference(DateTime.now().subtract(const Duration(days: 3)))
        .isNegative,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Text(
              '회원가입',
              style: TextStyle(fontSize: 30.0),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // 아이디
                  TextFormField(
                    autofocus: true,
                    controller: _idController,
                    decoration: const InputDecoration(labelText: '아이디'),
                    onChanged: (v) {
                      _idController.text = v;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '아이디를 입력하세요.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // 비밀번호
                  TextFormField(
                    obscureText: true,
                    controller: _pwController,
                    decoration: const InputDecoration(labelText: '비밀번호'),
                    onChanged: (v) {
                      _pwController.text = v;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력하세요.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // 비밀번호 확인
                  TextFormField(
                    obscureText: true,
                    controller: _pwCheckController,
                    decoration: const InputDecoration(labelText: '비밀번호 확인'),
                    onChanged: (v) {
                      _pwCheckController.text = v;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호 확인을 입력하세요.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // 성별
                  Row(
                    children: [
                      Text('성별'),
                      Radio(
                        value: '남자',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _gender = '남자';
                          });
                        },
                        child: Text('남자'),
                      ),
                      Radio(
                        value: '여자',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _gender = '여자';
                          });
                        },
                        child: Text('여자'),
                      ),
                    ],
                  ),
                  //생년월일
                  Column(
                    children: [
                      TextFormField(
                        controller: _birthController,
                        decoration: const InputDecoration(
                          labelText: '생년월일',
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                        readOnly: true,
                        onTap: () {
                          picker.DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 1, 1),
                              maxTime: DateTime.now(),
                              theme: const picker.DatePickerTheme(
                                  headerColor: Colors.orange,
                                  backgroundColor: Colors.blue,
                                  itemStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  doneStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16)), onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              //date.year와 같은 형태로도 사용 가능합니다.
                              _birthController.text =
                                  date.toString().split(' ')[0];
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: picker.LocaleType.ko);
                        },
                      )
                    ],
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(labelText: '신분증 종류'),
                    value: _dropdown,
                    items: ['주민등록증', '운전면허증', '여권'].map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      _dropdown = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: const Text('+')),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration:
                            InputDecoration(labelText: count.toString()),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (count > 0) {
                                count--;
                              }
                            });
                          },
                          child: const Text('-')),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //데이터요청
                        print(_idController.text);
                        print(_pwController.text);
                        print(_pwCheckController.text);
                        print(_gender);
                        print(_birthController.text);
                        print(_dropdown);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                    ),
                    child: const Text('회원가입'),
                  ),
                  picker2.CalendarDatePicker2(
                      config: config,
                      value: _singleDatePickerValueWithDefaultValue,
                      onValueChanged: (dates) {
                        setState(() {
                          if (dates.length > 2) {
                            _singleDatePickerValueWithDefaultValue =
                                _singleDatePickerValueWithDefaultValue;
                          } else {
                            _singleDatePickerValueWithDefaultValue = dates;
                          }
                        });
                      }),
                ],
              ),
            )
          ]),
        ));
  }
}
