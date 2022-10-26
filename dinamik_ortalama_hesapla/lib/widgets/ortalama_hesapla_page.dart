// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  int secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    print("scaffold çalıştı");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Text(
          Sabitler.baslikText,
          style: Sabitler.baslikStyle,
        )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildForm(),
            ),
            Expanded(
              flex: 1,
              child: OrtalamaGoster(
                  dersSayisi: DataHelper.tumDersler.length,
                  ortalama: DataHelper.ortalamaHesapla()),
            ),
          ],
        ),
        Expanded(
            child:DersListesi(onelemanCikarildi: (index){
              setState(() {
                 DataHelper.tumDersler.removeAt(index);
              });
               
            }) ),
      ]),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: Sabitler.yatayPadding8,
          child: _buildTextFormField(),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
              padding: Sabitler.yatayPadding8,
              child: HarfDropdownWidget(onHarfSecimi: (harf){
                secilenHarfDegeri=harf;
              }),
            )),
            Expanded(
                child: Padding(
              padding: Sabitler.yatayPadding8,
              child: KrediDropdownWidget(onKrediSecimi: (kredi){
                secilenKrediDegeri=kredi;
              }),
            )),
            IconButton(
              onPressed: _dersEkleveOrtalamaHesapla,
              icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Sabitler.anaRenk,
              iconSize: 30,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ]),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: ((newValue) {
        setState(() {
          girilenDersAdi = newValue!;
        });
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ders Adını giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity((0.3)),
      ),
    );
  }

 

 

  _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
