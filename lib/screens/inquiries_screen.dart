import 'package:flutter/material.dart';

class InquiriesScreen extends StatefulWidget {
  const InquiriesScreen({super.key});

  @override
  State<InquiriesScreen> createState() => _InquiriesScreenState();
}

class _InquiriesScreenState extends State<InquiriesScreen> {
  final TextEditingController _inquiryController = TextEditingController();

  void _submitInquiry() {
    if (_inquiryController.text.isNotEmpty) {
      // TODO: Implement inquiry submission API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Inquiry submitted: ${_inquiryController.text}')),
      );
      _inquiryController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inquiries'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _inquiryController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Write your inquiry here...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitInquiry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit Inquiry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inquiryController.dispose();
    super.dispose();
  }
}
