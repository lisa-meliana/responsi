import 'package:flutter/material.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/model/list_news_model.dart';

class ListTeknologi extends StatelessWidget {
  const ListTeknologi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Teknologi"),
      ),
      body: _buildListTeknologiBody(),
    );
  }

  // bentuk data api Future, jadi pake FutureBuilder
  // karna isinya belum tentu ada
  Widget _buildListTeknologiBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadTerbaru(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // cek data
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            // bentuk json diubah ke bentuk variabel
            ListNewsModel listNewsModel = ListNewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(listNewsModel);
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

  Widget _buildSuccessSection(ListNewsModel data){
    return ListView.builder(
      itemCount: data.data!.length,  // ! >> dipastikan datanya ada, ? >> datanya bisa jadi tidak ada
      itemBuilder: (BuildContext context, int index) {
        return _buildItemTerbaru(data.data!);
      },
    );
  }

  Widget _buildItemTerbaru(Data terbaruData){
    return InkWell(
      //onTap: () => PageDetailUser(id: userData.id!),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(terbaruData.image!),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(terbaruData.link!),
                Text(terbaruData.description!),
                Text(terbaruData.title!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
