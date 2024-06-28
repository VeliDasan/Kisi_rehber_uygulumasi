//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

//import 'dart:convert';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

class Kisiler{

  String kisi_id;
  String kisi_ad;
  String kisi_tel;
  Kisiler({required this.kisi_id,required this.kisi_ad,required this.kisi_tel});

  factory Kisiler.fromJson(Map<dynamic,dynamic> json,String key){
    return Kisiler(
        kisi_id: key,
        kisi_ad: json["kisi_ad"] as String,
        kisi_tel: json["kisi_tel"] as String);
  }


  //Dio Kullanımı için
  /*factory Kisiler.fromJson(Map<String,dynamic>json){
    return Kisiler(
    kisi_id: json["kisi_id"] as String,
    kisi_ad:json ["kisi_ad"]as String,
    kisi_tel: json["kisi_tel"]as String );
  }*/


}