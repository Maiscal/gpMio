import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageate();
}

class _ProfilePageate extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text("Carnet Digital"),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/carnet-background.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/carnet-qr.png'),
                ),
                Text(
                  "\nMario Isaac \nCalva Abad",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 143, 211),
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "\nC.I.: 123456789\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 143, 211),
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "ANALISTA DE NEGOCIOS | ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 143, 211),
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Abierta y a Distancia",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 143, 211),
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "\nSistemas informáticos y Computación\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 143, 211),
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    'assets/images/profile-avatar.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  "\nUTPL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 143, 211),
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
