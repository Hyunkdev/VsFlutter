import 'dart:async';

import 'package:diary/screens/diaryTextField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Diaryscreen extends StatefulWidget {
  final DateTime selectedDay;

  const Diaryscreen({
    super.key,
    required this.selectedDay,
  });

  @override
  State<Diaryscreen> createState() => _DiaryscreenState();
}

class _DiaryscreenState extends State<Diaryscreen> {
  final TextEditingController _controller = TextEditingController();
  String _savedText = ''; // 텍스트 저장

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _savedText = widget.selectedDay.toIso8601String();
    _loadDiaryEntry();
  }

  Future<void> _loadDiaryEntry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? content = prefs.getString(_savedText);
    if (content != null) {
      _controller.text = content;
    }
  }

  Future<void> _saveDiaryEntry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_savedText, _controller.text); // 내용을 저장
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.diamond),
            const SizedBox(
              width: 20,
            ),
            Text(
              '${widget.selectedDay.month} / ${widget.selectedDay.day}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DiaryTextField(controller: _controller), // 다이어리
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 255, 244, 212)),
              ),
              onPressed: _saveDiaryEntry,
              child: const Text(
                '저장',
                style: TextStyle(
                  fontFamily: 'MyCustomFont',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 메모리 해제를 위해 dispose
    super.dispose();
  }
}
