import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class Artikel {
  final String id;
  final String gambar, judul, deskripsi;

  Artikel({
    required this.id,
    required this.gambar,
    required this.judul,
    required this.deskripsi,
  });

  factory Artikel.fromJson(Map<String, dynamic> jsonData) {
    return Artikel(
      id: jsonData['id'],
      gambar: "http://192.168.18.5/Web-fitbyme/upload/" + jsonData['gambar'],
      judul: jsonData['judul'],
      deskripsi: jsonData['artikel'],
    );
  }
}

class ListArtikel extends StatelessWidget {
  final List<Artikel> artikel;
  ListArtikel(this.artikel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: artikel.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(artikel[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Artikel artikel, BuildContext context) {
    return new ListTile(
      title: new Card(
        elevation: 5.0,
        child: new Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo.shade900),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                child: Image.network(artikel.gambar),
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: 270,
                      child: Text(
                        artikel.judul,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                        textAlign: TextAlign.start,
                      ),
                      padding: EdgeInsets.all(1.0)),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new detailArtikel(value: artikel),
        );
        Navigator.of(context).push(route);
      },
    );
  }
}

Future<List<Artikel>> downloadJSON() async {
  final jsonEndpoint = "http://192.168.18.5/Web-fitbyme/API/artikel.php";

  final response = await get(Uri.parse(jsonEndpoint));

  if (response.statusCode == 200) {
    List artikel = json.decode(response.body);
    return artikel.map((artikel) => new Artikel.fromJson(artikel)).toList();
  } else
    throw Exception('We are not able to succesfully download the json data.');
}

class detailArtikel extends StatefulWidget {
  final Artikel value;
  const detailArtikel({Key? key, required this.value}) : super(key: key);

  @override
  State<detailArtikel> createState() => _detailArtikelState();
}

class _detailArtikelState extends State<detailArtikel> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: 320,
              child: Text(
                '${widget.value.judul}',
                style: new TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0,
                    color: Colors.indigo.shade900),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(
                  top: 20, bottom: 20.0, left: 20.0, right: 20.0),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network('${widget.value.gambar}'),
              padding: EdgeInsets.only(bottom: 15.0),
            ),
            Column(
              children: <Widget>[
                // Row(
                //   children: <Widget>[
                //     Container(
                //       width: 600,
                //       child: Text(
                //         '${widget.value.judul}',
                //         style: new TextStyle(
                //             fontWeight: FontWeight.w800, fontSize: 24.0),
                //         textAlign: TextAlign.center,
                //       ),
                //       padding: EdgeInsets.all(20.0),
                //     ),
                //   ],
                // ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 350,
                      child: Text(
                        '${widget.value.deskripsi}',
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20.0),
                        textAlign: TextAlign.start,
                      ),
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
        title: Text(
          'ARTICLES',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: new FutureBuilder<List<Artikel>>(
          future: downloadJSON(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Artikel> artikel = snapshot.data as List<Artikel>;
              return new ListArtikel(artikel);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return new CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
