import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String name;
  final int price;
  final String imagePath;

  const OrderPage({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //Logic
  final _jumlahContl = TextEditingController();
  int _totalHarga = 0;

  void _hitungTotal() {
    final jumlah = int.tryParse(_jumlahContl.text) ?? 0;
    setState(() {
      _totalHarga = jumlah * widget.price;
    });
  }

  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Detail Order',
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Foto makanan
            Image.asset(
              widget.imagePath,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Nama makanan
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),

                  // Harga
                  Text(
                    'Harga: Rp ${widget.price}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 24),

                  // Input jumlah
                  TextField(
                    controller: _jumlahContl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Jumlah',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Tombol submit
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _hitungTotal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Total harga
                  Text(
                    'Total Harga: Rp $_totalHarga',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
