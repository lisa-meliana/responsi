import 'package:flutter/material.dart';
import 'package:responsi/halaman/list_nasional.dart';
import 'package:responsi/halaman/list_olahraga.dart';
import 'package:responsi/halaman/list_teknologi.dart';
import 'package:responsi/halaman/list_terbaru.dart';

class HalamanUtama extends StatefulWidget {
  final int index;
  HalamanUtama({Key? key, required this.index}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  late int index = widget.index;


  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Image.network(
                    'lib/images/logo_cnn_fav.png',
                  ),
                ),
                SizedBox(height: 100),

                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 7),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListTerbaru()),
                                );
                              },
                              child: const Text('Terbaru'),
                            ),
                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListNasional()),
                                );
                              },
                              child: const Text('Nasional'),
                            ),

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListOlahraga()),
                                );
                              },
                              child: const Text('Olahraga'),
                            ),

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListTeknologi()),
                                );
                              },
                              child: const Text('Teknologi'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 30),

              ],
            ),
          ),
        ),
      ),

    );
  }
}


