import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
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
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 231, 204),
            ),
            height: 400,
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 68, 44, 36),
                  fontFamily: 'MyCustomFont',
                  fontSize: 28,
                ),
              ),
              calendarStyle: CalendarStyle(
                // dayTextFormatter: ,
                selectedTextStyle: const TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'MyCustomFont',
                  fontSize: 24,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.rectangle,
                ),
                outsideTextStyle: calendarText(),
                defaultTextStyle: calendarText(),
                weekendTextStyle: calendarText(),
                isTodayHighlighted: false,
              ),
              locale: 'ko_KR',
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  print('hk');
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  TextStyle calendarText() {
    return TextStyle(
      fontFamily: 'MyCustomFont',
      fontSize: 24,
      color: Colors.black.withOpacity(0.6),
    );
  }
}
