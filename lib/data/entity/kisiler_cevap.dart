/*import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerCevap {
  List<Kisiler> kisiler;
  int success;

  KisilerCevap({required this.kisiler, required this.success});

  factory KisilerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["kisiler"] as List;
    int success = json["success"] as int;

    var kisilerList = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();
    return KisilerCevap(kisiler: kisilerList, success: success);
  }
}*/
