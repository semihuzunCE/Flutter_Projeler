// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {

  Color appBarRengi=Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() { 
    super.initState();
   

   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {return appBarRenginiBul();});
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          backgroundColor: appBarRengi,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "images/" + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,
            ),
            title: Text(widget.secilenBurc.burcAdi + " Burcu Özellikleri"),
            centerTitle: true,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
      ],
    ));
  }
void appBarRenginiBul() async {
  _generator = await PaletteGenerator.fromImageProvider(AssetImage('images/${widget.secilenBurc.burcBuyukResim}')); 
  setState(() {
      appBarRengi=_generator.dominantColor!.color;
  });

}
}




