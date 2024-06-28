import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/sqlite/veritabani_yardimcisi.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler_cevap.dart';

import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

//Firebase Firestore kullanımı

class KisilerDaoRepository {

  var collectionKisiler=FirebaseFirestore.instance.collection("Kisiler");


  Future<void> kaydet(String kisi_ad,String kisi_tel) async {
    var yeniKisi=HashMap<String,dynamic>();
    yeniKisi["kisi_id"]="";
    yeniKisi["kisi_ad"]=kisi_ad;
    yeniKisi["kisi_tel"]=kisi_tel;
    collectionKisiler.add(yeniKisi);
  }

  Future<void> guncelle(String kisi_id,String kisi_ad,String kisi_tel) async {
    var guncellenenKisi=HashMap<String,dynamic>();
    guncellenenKisi["kisi_ad"]=kisi_ad;
    guncellenenKisi["kisi_tel"]=kisi_tel;
    collectionKisiler.doc(kisi_id).update(guncellenenKisi);
  }

  Future<void> sil(String kisi_id) async {
   collectionKisiler.doc(kisi_id).delete();
  }


}

//Dio kullanımmı

/*class KisilerDaoRepository {

  List<Kisiler> parseKisiler(String cevap){
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }

  Future<void> kaydet(String kisi_ad,String kisi_tel) async {
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi Kaydet : ${cevap.data.toString()}");
  }

  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async {
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id":kisi_id,"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi Güncelle : ${cevap.data.toString()}");
  }

  Future<void> sil(int kisi_id) async {
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id":kisi_id};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi Sil : ${cevap.data.toString()}");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisiler(cevap.data.toString());
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad":aramaKelimesi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    return parseKisiler(cevap.data.toString());
  }
}*/

//Sqlite kullanımı

/*class KisilerdaoRepository{
  Future<void> kaydet(String kisi_ad,String kisi_tel) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yenikisi=Map<String,dynamic>();
    yenikisi["kisi_ad"]=kisi_ad;
    yenikisi["kisi_tel"]=kisi_tel;
    await db.insert("kisiler",yenikisi);


  }

  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenkisi=Map<String,dynamic>();
    guncellenenkisi["kisi_ad"]=kisi_ad;
    guncellenenkisi["kisi_tel"]=kisi_tel;
    await db.update("kisiler",guncellenenkisi,where: "kisi_id=?",whereArgs: [kisi_id]);
  }
  Future<void>sil(int kisi_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("kisiler",where: "kisi_id=?",whereArgs: [kisi_id]);
  }
  Future<List<Kisiler>> KisileriYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(
        kisi_id: satir["kisi_id"],
        kisi_ad: satir["kisi_ad"] ?? '',  // Provide a default value if null
        kisi_tel: satir["kisi_tel"] ?? '',  // Provide a default value if null
      );
    });
  }


  Future<List<Kisiler>>ara(String aramaKelimesi) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(
        kisi_id: satir["kisi_id"],
        kisi_ad: satir["kisi_ad"] ?? '',  // Provide a default value if null
        kisi_tel: satir["kisi_tel"] ?? '',  // Provide a default value if null
      );
    });

  }
}*/