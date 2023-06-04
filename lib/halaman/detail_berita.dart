import 'package:flutter/material.dart';
import 'package:responsi/model/list_news_model.dart';

class DetailBerita extends StatelessWidget {
  final Data data;
  const DetailBerita({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Posts> detail = data.posts!;
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN News"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(data.title!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //Text(detail.pubDate!),
            Image.network(data.image!),
            //Text(detail.description),
            Text("Baca selengkapnya...",
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

    );



  }
}