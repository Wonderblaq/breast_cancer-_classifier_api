import 'package:flutter/material.dart';

void main() {
  runApp(JoeyApp());
}

class JoeyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Controllers for the text fields
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final TextEditingController _field4Controller = TextEditingController();

  String _result = ""; // Variable to display the result

  void _submitData() async {
    // Simulate fetching data to/from an API
    String field1 = _field1Controller.text;
    String field2 = _field2Controller.text;
    String field3 = _field3Controller.text;
    String field4 = _field4Controller.text;

    // Simulated API call
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay

    setState(() {
      _result = "Received: $field1, $field2, $field3, $field4";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ML App Input UI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Field 1 Label",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _field1Controller,
              decoration: InputDecoration(hintText: 'Enter input here'),
            ),
            SizedBox(height: 16),
            Text("Field 2 Label",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _field2Controller,
              decoration: InputDecoration(hintText: 'Enter input here'),
            ),
            SizedBox(height: 16),
            Text("Field 3 Label",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _field3Controller,
              decoration: InputDecoration(hintText: 'Enter input here'),
            ),
            SizedBox(height: 16),
            Text("Field 4 Label",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _field4Controller,
              decoration: InputDecoration(hintText: 'Enter input here'),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _submitData,
                child: Text("Submit"),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Result:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _result.isEmpty ? "Result will be displayed here" : _result,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
