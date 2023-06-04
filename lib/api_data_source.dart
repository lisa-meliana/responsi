import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadBerita(String kategori) {
    switch (kategori){
      case "terbaru"    : return BaseNetwork.get("terbaru");
      case "nasional"   : return BaseNetwork.get("nasional");
      case "olahraga"   : return BaseNetwork.get("olahraga");
      case "teknologi"  : return BaseNetwork.get("teknologi");
      default           : return BaseNetwork.get("terbaru");
    }
  }


}

