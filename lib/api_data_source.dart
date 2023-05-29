import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadTerbaru() {
    return BaseNetwork.get("data");
  }

  Future<Map<String, dynamic>> loadDetailTerbaru({required String data}) {
    return BaseNetwork.get("data/$data");
  }

  Future<Map<String, dynamic>> loadNasional() {
    return BaseNetwork.get("data");
  }

  Future<Map<String, dynamic>> loadDetailNasional({required String data}) {
    return BaseNetwork.get("data/$data");
  }

  Future<Map<String, dynamic>> loadOlahraga() {
    return BaseNetwork.get("data");
  }

  Future<Map<String, dynamic>> loadDetailOlahraga({required String data}) {
    return BaseNetwork.get("data/$data");
  }

  Future<Map<String, dynamic>> loadOTeknologi() {
    return BaseNetwork.get("data");
  }

  Future<Map<String, dynamic>> loadDetailTeknologi({required String data}) {
    return BaseNetwork.get("data/$data");
  }

}

