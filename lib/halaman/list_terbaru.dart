import 'package:flutter/material.dart';
import 'dart:core';
import 'package:responsi/model/list_news_model.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/halaman/detail_berita.dart';

class ListBerita extends StatelessWidget {
  final String kategori;
  const ListBerita({Key? key, required this.kategori}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN " + kategori.toUpperCase()),
      ),
      body: _buildListBerita(),
    );
  }

  Widget _buildListBerita(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadBerita(kategori),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // cek data
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            ListNewsModel listNewsModel = ListNewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(listNewsModel.data!);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text("Error");
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(Data data){
    return ListView.builder(
      itemCount: 15,//data.length,  .length error, sudah coba ikutin di google tetep error kak
      itemBuilder: (BuildContext context, int index) {
        return _buildItemNews(data);//[index]);  index error
      },
    );
  }

  Widget _buildItemNews(Data newsData){
    return InkWell(
      onTap: () => DetailBerita(data: newsData),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(newsData.image!),
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(newsData.title!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

