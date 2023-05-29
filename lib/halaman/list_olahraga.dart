import 'package:flutter/material.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/model/list_news_model.dart';

class ListOlahraga extends StatefulWidget {
  const ListOlahraga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Olahraga"),
      ),

      body: _buildListOlahragaBody(),
    );
  }

  Widget _buildListOlahragaBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadOlahraga(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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


  Widget _buildSuccessSection(ListNewsModel data) {
    String imageUrl = "${data.data!}";
    var text = SizedBox(
      //width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  // child: Image.network(
                  //  // imageUrl,
                  //  // width: 130.0,
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data.success!}",
                        style: const TextStyle(fontSize: 28.0)),
                    Text("${data.message! }",
                        style: const TextStyle(fontSize: 28.0)),

                  ],
                ),

              )),
          // Expanded(child: Text(value2.toTitleCase(), style: const TextStyle(fontSize: 26.0))),
        ],
      ),
    );
    return text;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


}
