import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemList extends StatelessWidget {
  final Icon icone;
  final String texto;
  final String preco;

  const ItemList({Key key, this.icone, this.texto, this.preco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(colors: [Colors.purple, Colors.red])),
              child: icone,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  texto,
                  style: GoogleFonts.kodchasan().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
                Text(
                  '2 Transações',
                  style: GoogleFonts.kodchasan().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 11),
                ),
              ],
            ),
            Text(
              preco,
              style: GoogleFonts.kodchasan().copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
