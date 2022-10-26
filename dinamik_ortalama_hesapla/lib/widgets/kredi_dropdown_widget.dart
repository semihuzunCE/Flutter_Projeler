import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecimi;
  const KrediDropdownWidget({required this.onKrediSecimi,super.key});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  int secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<int>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        underline: Container(),
        value: secilenKrediDegeri,
        onChanged: (value) {
          setState(() {
            secilenKrediDegeri = value!;
            widget.onKrediSecimi(value);
          });
        },
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}