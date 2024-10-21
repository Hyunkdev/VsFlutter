import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now(); // focusedDay 초기화
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('d'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              '15 : 00',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w400,
                fontSize: 120,
                fontFamily: 'MyCustomFont',
              ),
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(
                () {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                },
              );
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
        ],
      ),
    );
  }
}
