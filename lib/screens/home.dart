import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final bool isCurrent = true;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> meses = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  int selectedCategoryIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff363636),
      appBar: AppBar(
        title: Text(
          "DISCOVER",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: meses.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 120.0,
              margin: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Center(
                child: Text(
                  meses[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
