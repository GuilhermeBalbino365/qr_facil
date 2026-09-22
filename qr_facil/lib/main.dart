import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const QrFacilApp());
}

class QrFacilApp extends StatelessWidget {
  const QrFacilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Fácil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const QrHomePage(),
    );
  }
}

class QrHomePage extends StatefulWidget {
  const QrHomePage({super.key});

  @override
  State<QrHomePage> createState() => _QrHomePageState();
}

class _QrHomePageState extends State<QrHomePage> {
  final TextEditingController _controller = TextEditingController();

  String textoQr = '';

  void gerarQrCode() {
    setState(() {
      textoQr = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Fácil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gerador de QR Code',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite um texto',
                hintText: 'Ex.: Olá, mundo!',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: gerarQrCode,
              child: const Text('Gerar QR Code'),
            ),

            const SizedBox(height: 30),

            if (textoQr.isNotEmpty)
              QrImageView(
                data: textoQr,
                version: QrVersions.auto,
                size: 250,
              ),
          ],
        ),
      ),
    );
  }
}