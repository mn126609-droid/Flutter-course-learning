// main(myApp) file
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_application_1/screans/home.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Date & Time'), centerTitle: true),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (selectedDateTime != null)
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.event_available_rounded,
                                size: 42,
                                color: Colors.indigo,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                DateFormat(
                                  'EEEE, d MMMM yyyy',
                                ).format(selectedDateTime!),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                DateFormat('h:mm a').format(selectedDateTime!),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      const Text(
                        'Choose a date and time',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        final now = DateTime.now();
                        final date = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
                        );
                        if (date == null) return;
                        if (!mounted) return;

                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(now),
                        );
                        if (time == null) return;
                        if (!mounted) return;

                        final dateTime = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.minute,
                        );
                        setState(() {
                          selectedDateTime = dateTime;
                        });
                      },
                      child: const Text('Select date & time'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
