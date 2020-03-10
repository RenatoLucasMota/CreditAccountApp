import 'package:fatura_app/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _progressSlideSheet = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Feather.grid),
                Text(
                  'Minha Conta',
                  style: GoogleFonts.kodchasan().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 21),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.ffln1-1.fna.fbcdn.net/v/t1.0-9/75328863_3127337813949156_7207727937628405760_n.jpg?_nc_cat=110&_nc_sid=09cbfe&_nc_ohc=36uw44ynajcAX-h3QMT&_nc_ht=scontent.ffln1-1.fna&oh=8ac2d23ec7cd3a251e06793fa986af6e&oe=5E93EA4D'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 30, right: 30),
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            offset: Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.red,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  duration: Duration(milliseconds: 500),
                  height: _progressSlideSheet == 0
                      ? 180
                      : 180 - _progressSlideSheet * 65,
                  curve: Curves.elasticOut,
                ),
                SizedBox(
                  height: 20,
                ),
                _progressSlideSheet < 1
                    ? AnimatedOpacity(
                        opacity: 1 - _progressSlideSheet,
                        duration: Duration(milliseconds: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Feather.chevron_up,
                              color: Colors.grey,
                              size: 12,
                            ),
                            Text('Arraste para cima para esconder o número',
                                style: GoogleFonts.lato().copyWith(
                                    color: Colors.grey[400], fontSize: 12)),
                          ],
                        ),
                      )
                    : AnimatedOpacity(
                        opacity: _progressSlideSheet,
                        duration: Duration(milliseconds: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Feather.chevron_down,
                              color: Colors.grey,
                              size: 12,
                            ),
                            Text('Arraste para baixo para mostrar o número',
                                style: GoogleFonts.lato().copyWith(
                                    color: Colors.grey[400], fontSize: 12)),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transações',
                    style: GoogleFonts.kodchasan().copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 21),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            right: 50,
            child: AnimatedPadding(
              padding: EdgeInsets.only(top: 130 + _progressSlideSheet * 21),
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              child: Image.network(
                'https://www.zzlocal.com/images/visa-logo-black-and-white.png',
                height: 80,
                width: 80,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            left: 50,
            child: AnimatedOpacity(
              opacity: 1 - _progressSlideSheet,
              duration: Duration(milliseconds: 50),
              child: AnimatedPadding(
                padding: EdgeInsets.only(top: 150),
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                child: Image.network(
                  'https://img.icons8.com/cotton/2x/sim-card-chip.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            left: 50,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 50),
              opacity: 1 - _progressSlideSheet,
              child: AnimatedPadding(
                padding: EdgeInsets.only(top: 220),
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                child: Text(
                  '1535    1518    1996    1885',
                  style: GoogleFonts.lato().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            left: 50,
            child: AnimatedPadding(
              padding: EdgeInsets.only(top: 255 - _progressSlideSheet * 80),
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              child: Text(
                'R\$ 245,00',
                style: GoogleFonts.lato().copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28),
              ),
            ),
          ),
          SlidingSheet(
            listener: (state) {
              setState(() {
                _progressSlideSheet = state.progress;
              });
            },
            color: Colors.grey[800],
            elevation: 10,
            cornerRadius: 20,
            closeOnBackdropTap: true,
            snapSpec: const SnapSpec(
              snappings: [
                0.40,
                0.52,
              ],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                color: Colors.grey[800],
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          height: 5,
                          width: 60,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            ItemList(
                              icone: Icon(
                                Feather.shopping_bag,
                                color: Colors.white,
                              ),
                              texto: 'Compras',
                              preco: 'R\$240,00',
                            ),
                            ItemList(
                              icone: Icon(
                                Feather.headphones,
                                color: Colors.white,
                              ),
                              texto: 'Entretenimento',
                              preco: 'R\$100,00',
                            ),
                            ItemList(
                              icone: Icon(
                                Feather.alert_triangle,
                                color: Colors.white,
                              ),
                              texto: 'Manutenção',
                              preco: 'R\$500,00',
                            ),
                            ItemList(
                              icone: Icon(
                                Feather.pie_chart,
                                color: Colors.white,
                              ),
                              texto: 'Alimentação',
                              preco: 'R\$300,00',
                            ),
                            ItemList(
                              icone: Icon(
                                Feather.shopping_bag,
                                color: Colors.white,
                              ),
                              texto: 'Compras',
                              preco: 'R\$240,00',
                            ),
                            ItemList(
                              icone: Icon(
                                Feather.headphones,
                                color: Colors.white,
                              ),
                              texto: 'Entretenimento',
                              preco: 'R\$100,00',
                            ),
                            ItemList(
                              icone: Icon(
                                Feather.alert_triangle,
                                color: Colors.white,
                              ),
                              texto: 'Manutenção',
                              preco: 'R\$500,00',
                            ),
                            ItemList(
                              icone: Icon(
                                Feather.pie_chart,
                                color: Colors.white,
                              ),
                              texto: 'Alimentação',
                              preco: 'R\$300,00',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
