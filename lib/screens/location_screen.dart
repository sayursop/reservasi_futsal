import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservasi Gaya Futsal'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Gaya Futsal Laweyan'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/schedule', arguments: 'Laweyan');
              },
              child: const Text('Pilih'),
            ),
          ),
          ListTile(
            title: const Text('Gaya Futsal Jebres'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/schedule', arguments: 'Jebres');
              },
              child: const Text('Pilih'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
