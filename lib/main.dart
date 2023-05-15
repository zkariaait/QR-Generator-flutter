import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRCodeScreen(),
    );
  }
}

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNumberController = TextEditingController();
  String _qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _lastNumberController,
              decoration: InputDecoration(labelText: 'Last Number'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrData = _nameController.text + ', ' + _lastNumberController.text;
                });
              },
              child: Text('Generate QR Code'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Center(
                child: _qrData.isNotEmpty
                    ? QrImageView(
                  data: _qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                )
                    : Text('No QR Code generated.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
