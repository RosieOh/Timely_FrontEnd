import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Share',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TimeShareScreen(),
    );
  }
}

class TimeShareScreen extends StatefulWidget {
  const TimeShareScreen({super.key});

  @override
  State<TimeShareScreen> createState() => _TimeShareScreenState();
}

class _TimeShareScreenState extends State<TimeShareScreen> {
  late ConfettiController _confettiController;
  final TextEditingController _contentController = TextEditingController();
  List<Map<String, dynamic>> timeShares = [];

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    _loadTimeShares();
  }

  Future<void> _loadTimeShares() async {
    // TODO: Implement API call to load time shares
  }

  Future<void> _createTimeShare(String content) async {
    final now = DateTime.now();
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/timeshare'),
      body: {
        'userId': 'user1', // TODO: Implement user authentication
        'sharedAt': now.toIso8601String(),
        'content': content,
      },
    );

    if (response.statusCode == 200) {
      _confettiController.play();
      _loadTimeShares();
      _contentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Share'),
        backgroundColor: Colors.pink[100],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.pink[50]!,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: timeShares.length,
                    itemBuilder: (context, index) {
                      final timeShare = timeShares[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(timeShare['content']),
                          subtitle: Text(
                            DateFormat('yyyy-MM-dd HH:mm').format(
                              DateTime.parse(timeShare['sharedAt']),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _contentController,
                          decoration: const InputDecoration(
                            hintText: 'Share your time...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (_contentController.text.isNotEmpty) {
                            _createTimeShare(_contentController.text);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              gravity: 0.1,
              colors: const [
                Colors.pink,
                Colors.pinkAccent,
                Colors.white,
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
