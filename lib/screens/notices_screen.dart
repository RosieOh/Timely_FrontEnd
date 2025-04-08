import 'package:flutter/material.dart';

import '../widgets/cherry_blossom_loading.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  bool isLoading = true;
  List<String> notices = [];

  @override
  void initState() {
    super.initState();
    _loadNotices();
  }

  Future<void> _loadNotices() async {
    setState(() => isLoading = true);
    try {
      // TODO: Implement actual API call for notices
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        notices = [
          'Notice 1: System maintenance scheduled',
          'Notice 2: New features added',
          'Notice 3: Terms of service updated',
        ];
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notices'),
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink[50]!, Colors.white],
          ),
        ),
        child: isLoading
            ? const CherryBlossomLoading()
            : ListView.builder(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(notices[index]),
                      leading:
                          const Icon(Icons.announcement, color: Colors.pink),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
