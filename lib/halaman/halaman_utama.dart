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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'lib/images/logo_cnn_fav.png',
                    height: 150,
                  ),
                ),
                SizedBox(height: 100),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 125,
                        child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListBerita(kategori: "terbaru")),
                                );
                              },
                              child: const Text('TERBARU'),
                            ),
                      ),

                      SizedBox(width: 12),
                      SizedBox(
                        height: 25,
                        width:125,
                        child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListBeritaNasional(kategori: "nasional")),
                                );
                              },
                              child: const Text('NASIONAL'),
                            ),
                      ),
            ],
          ),

                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                              SizedBox(
                                height: 25,
                                width: 125,
                              child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListBeritaOlahraga(kategori: "olahraga")),
                                );
                              },
                              child: const Text('OLAHRAGA'),
                            ),
                              ),

                        SizedBox(width: 12),
                        SizedBox(
                          height: 25,
                          width: 125,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ListBeritaTeknologi(kategori: "teknologi")),
                              );
                            },
                            child: const Text('TEKNOLOGI'),
                          ),
                        ),

                        ],
                      ),



              ],
                  ),
                ),

              ),
          ),
        );
  }
}


