// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_item.dart';
import 'package:flutter_burclar/data/strings.dart';
import 'package:flutter_burclar/model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = verikaynaginiHazirla(); 
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burc Listesi'),
      ),
      body: Center(
        child: ListView.builder(itemBuilder: ((context, index) { 
          return BurcItem(listelenenBurc: tumBurclar[index]);
        }) ,itemCount: tumBurclar.length,),
      ),
    );
  }

  List<Burc> verikaynaginiHazirla() { 
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + ((i + 1).toString()) + ".png";
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";

      Burc eklenecekBurc = Burc(burcAdi,burcTarihi,burcDetayi,burcKucukResim,burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
