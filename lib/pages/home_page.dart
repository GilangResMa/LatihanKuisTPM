import 'package:flutter/material.dart';
import 'package:latihankuis/pages/order_page.dart';
import 'package:latihankuis/pages/login_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildMenuCard(String name, int price, String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),

                Text(
                  'Rp $price',
                  style: TextStyle(
                    fontSize: 13, 
                    color: Colors.black),
                ),
                SizedBox(height: 4),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                            name: name,
                            price: price,
                            imagePath: imagePath,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Pesan'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo @${widget.username}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            
            Text(
              'Mau Makan Apa Hari Ini?',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 13),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Banner
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Image.asset(
                'assets/images/Makanan.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Daftar Menu
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Daftar Menu:',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.78,
                ),
                children: [
                  _buildMenuCard('Soto Ayam', 10000, 'assets/images/Soto Ayam.jpg'),
                  _buildMenuCard('Mie Ayam', 12000, 'assets/images/Mie Ayam.jpg'),
                  _buildMenuCard('Sate Ayam', 20000, 'assets/images/Sate Ayam.jpg'),
                  _buildMenuCard('Bakso', 10000, 'assets/images/Bakso.jpg'),
                  _buildMenuCard('Nasi Goreng', 15000, 'assets/images/Nasi Goreng.jpg'),
                  _buildMenuCard('Kwetiau', 15000, 'assets/images/Kwetiau.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
