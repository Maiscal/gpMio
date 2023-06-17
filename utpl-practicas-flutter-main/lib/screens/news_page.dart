import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<dynamic> characters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final publicKey =
        '5e2ad3788910515cd58080f067165145'; // Reemplaza con tu clave pública de Marvel
    final privateKey =
        '44d85d5c5f9f353c713e3cdc08cdc3adad70d81c'; // Reemplaza con tu clave privada de Marvel
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateHash(timestamp, privateKey, publicKey);

    final url =
        'https://gateway.marvel.com/v1/public/characters?ts=$timestamp&apikey=$publicKey&hash=$hash&limit=50';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      setState(() {
        characters = decodedData['data']['results'];
      });
    } else {
      throw Exception('Error al cargar los personajes');
    }
  }

  String generateHash(String timestamp, String privateKey, String publicKey) {
    final bytes = utf8.encode('$timestamp$privateKey$publicKey');
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes de Marvel'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: characters.length,
        itemBuilder: (BuildContext context, int index) {
          final character = characters[index];
          return Card(
            child: Column(
              children: [
                Image.network(
                  '${character['thumbnail']['path']}.${character['thumbnail']['extension']}',
                  height: 150,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text(character['name']),
                  subtitle: Text(
                    character['description'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
