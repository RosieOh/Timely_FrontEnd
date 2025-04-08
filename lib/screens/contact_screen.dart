import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Contact Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const ListTile(
                leading: Icon(Icons.email, color: Colors.pink),
                title: Text('Email: support@timeshare.com'),
              ),
              const ListTile(
                leading: Icon(Icons.phone, color: Colors.pink),
                title: Text('Phone: +1 (555) 123-4567'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on, color: Colors.pink),
                title: Text('Address: 123 Time Share St, Pink City'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement contact form or email launch
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contact form coming soon!')),
                  );
                },
                icon: const Icon(Icons.message),
                label: const Text('Send Message'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
