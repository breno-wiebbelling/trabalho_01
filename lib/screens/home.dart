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

  int selectedIndex = 0;
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  void scrollToIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    scrollController?.animateTo(
      index * 120.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          itemCount: meses.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => scrollToIndex(index),
              child: Container(
                width: 120.0,
                margin: const EdgeInsets.all(8.0),
                color: index == selectedIndex ? Colors.blue : Colors.grey,
                child: Center(
                  child: Text(
                    meses[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
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
