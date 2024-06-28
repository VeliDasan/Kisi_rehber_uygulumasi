import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{

  DetaySayfaCubit():super(0);

  var grepo=KisilerDaoRepository();

  Future<void> guncelle(String kisi_id,String kisi_ad,String kisi_tel) async{
   await grepo.guncelle(kisi_id, kisi_ad, kisi_tel);
  }

}