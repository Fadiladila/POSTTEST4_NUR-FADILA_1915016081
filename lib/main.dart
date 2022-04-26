import 'package:flutter/material.dart';
import 'package:posttest4_1915016081_nurfadila/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(226, 244, 154, 1),
      appBar: AppBar(
        title: Text("Green Shop"),
        backgroundColor: Color.fromRGBO(42, 57, 0, 1),
      ),
      body: ListView(children: [
        Container(
          width: 192,
          height: 243,
          margin: EdgeInsets.only(top: 61),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/pohon2.png"),
            ),
          ),
        ),
        Text(
          "\nYour Habit, Your Life",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(76, 50, 43, 1),
          ),
        )
      ]),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Your Habit, Your Life"),
              decoration: BoxDecoration(
                color: Color.fromARGB(110, 226, 244, 154),
              ),
            ),
            ListTile(
              // tileColor: Colors.green,
              leading: Icon(Icons.shopping_basket),
              title: Text("Check Out"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LandingPage()),
                );
              },
            ),
            ListTile(
              // tileColor: Color.fromARGB(232, 186, 69, 69),
              leading: Icon(Icons.check),
              title: Text("Pemesanan"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ThirdPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String nama = "";
  bool? isHadiah = false;
  List<String> pengiriman = ["Kurir", "Ambil Sendiri"];
  String kirim = "";

  final namaController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    // TODO: implement dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 255, 194, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "\n\nCheckout",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(111, 128, 97, 1),
              ),
            ),
            SizedBox(height: 30), //jarak antar textfield

            for (var item in pengiriman)
              ListTile(
                leading: Radio(
                  value: item,
                  groupValue: kirim,
                  onChanged: (String? value) {
                    setState(() {
                      kirim = value!;
                    });
                  },
                ),
                title: Text(item),
              ),

            ListTile(
              leading: Checkbox(
                  value: isHadiah,
                  onChanged: (bool? value) {
                    setState(() {
                      isHadiah = value;
                    });
                  }),
              title:
                  Text("apakah anda ingin membeli barang ini sebagai hadiah?"),
            ),
            SizedBox(height: 30),
            TextField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan nama anda",
                )),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    nama = namaController.text;
                  });
                },
                child: Text("Checkout"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(111, 128, 97, 1),
                ),
              ),
            ),
            Text(
              "nama : $nama",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
            Text(
              "jenis pengantaran: $kirim",
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MyHomePage(),
                    ));
              },
              child: const Text("Home"),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(76, 50, 43, 1),
                  primary: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
