import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class Resep {
  final String id;
  final String gambar, judul, deskripsi;

  Resep({
    required this.id,
    required this.gambar,
    required this.judul,
    required this.deskripsi,
  });

  factory Resep.fromJson(Map<String, dynamic> jsonData) {
    return Resep(
      id: jsonData['id'],
      gambar: "http://192.168.18.5/Web-fitbyme/upload/" + jsonData['gambar'],
      judul: jsonData['judul'],
      deskripsi: jsonData['deskripsi'],
    );
  }
}

class ListResep extends StatelessWidget {
  final List<Resep> resep;
  ListResep(this.resep);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resep.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(resep[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Resep resep, BuildContext context) {
    return new ListTile(
      title: new Card(
        elevation: 5.0,
        child: new Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.indigo.shade900)),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(resep.gambar),
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: 270,
                      child: Text(
                        resep.judul,
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
          builder: (BuildContext context) => new detailResep(value: resep),
        );
        Navigator.of(context).push(route);
      },
    );
  }
}

Future<List<Resep>> downloadJSON() async {
  final jsonEndpoint = "http://192.168.18.5/Web-fitbyme/API/resep.php";

  final response = await get(Uri.parse(jsonEndpoint));

  if (response.statusCode == 200) {
    List resep = json.decode(response.body);
    return resep.map((resep) => new Resep.fromJson(resep)).toList();
  } else
    throw Exception('We are not able to succesfully download the json data.');
}

class detailResep extends StatefulWidget {
  final Resep value;
  const detailResep({Key? key, required this.value}) : super(key: key);

  @override
  State<detailResep> createState() => _detailResepState();
}

class _detailResepState extends State<detailResep> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: 300,
              child: new Text(
                '${widget.value.judul}',
                style: new TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0,
                    color: Colors.indigo[900]),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
            ),
            Container(
              width: 320,
              height: 200,
              child: Image.network('${widget.value.gambar}'),
              padding: EdgeInsets.only(bottom: 15.0),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 300,
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

class Lihat extends StatelessWidget {
  const Lihat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
        title: Text(
          'MEALS',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: new FutureBuilder<List<Resep>>(
          future: downloadJSON(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Resep> resep = snapshot.data as List<Resep>;
              return new ListResep(resep);
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
