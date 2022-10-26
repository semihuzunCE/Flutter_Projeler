class Ders {
  final String ad;
  final double harfDegeri;
  final int krediDegeri;
  Ders({required this.ad, required this.harfDegeri, required this.krediDegeri});
  @override
  String toString() {
    // TODO: implement toString
    return "Dersimizi adı: $ad harf degeri: $harfDegeri kredi değeri: $krediDegeri\n";
  }
}
