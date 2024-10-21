import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Row for Date, Time, and Doctor
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date:', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('18/9/2024', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time:', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('10:30 PM', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Doctor:', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Dr. Adam', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Second Row for Type and Place
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Type:', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Dentist', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Place:', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('City Clinic', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add cancellation functionality here
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointment'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
