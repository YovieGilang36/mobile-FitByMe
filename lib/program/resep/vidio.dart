import 'dart:convert';
import 'package:fitbyme/navbar.dart';
import 'package:fitbyme/program/resep/playvidio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:video_player/video_player.dart';

class Config {
  static const BASE_URL = "http://192.168.18.5/Web-fitbyme/";
  static const VIDEO_FOLDER = BASE_URL + "vidio/";
}

// class Vidio {
//   final String id;
//   final String vid, gambar, judul, durasi, deskripsi, oleh;

//   Vidio({
//     required this.id,
//     required this.vid,
//     required this.gambar,
//     required this.judul,
//     required this.durasi,
//     required this.deskripsi,
//     required this.oleh,
//   });

//   factory Vidio.fromJson(Map<String, dynamic> jsonData) {
//     return Vidio(
//       id: jsonData['id'],
//       vid: "http://192.168.43.205/Web-fitbyme/vidio/" + jsonData['vidio'],
//       gambar: "http://192.168.43.205/Web-fitbyme/upload/" + jsonData['gambar'],
//       judul: jsonData['judul'],
//       durasi: jsonData['durasi'],
//       deskripsi: jsonData['artikel'],
//       oleh: jsonData['oleh'],
//     );
//   }
// }

// class VidioList extends StatelessWidget {
//   final cartController = Get.put(PlayController());
//   final List<Vidio> vidio;
//   VidioList(this.vidio);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: vidio.length,
//       itemBuilder: (context, int currentIndex) {
//         return createViewItem(vidio[currentIndex], context);
//       },
//     );
//   }

//   Widget createViewItem(Vidio vidio, BuildContext context) {
//     return  ListTile(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PlayVidio(
//                         vidio: Config.VIDEO_FOLDER + vidio.vid,
//                       ),
//                     ),
//                   );
//                 },
//                 leading: Container(
//                   height: 100,
//                   width: 100,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(15)),
//                   child: Image.network(vidio.gambar),
//                 ),
//                 title: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(vidio.judul,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       )),
//                 ),
//                 subtitle: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         cartController.addVidio(vidio);
//                       },
//                       child: Text(
//                         'Add to Playlist',
//                         style: TextStyle(
//                             fontWeight: FontWeight.normal, fontSize: 12.0),
//                       )),
//                 ));
//   }
// }

// Future<List<Vidio>> downloadJSON() async {
//   final jsonEndpoint = "http://192.168.43.205/Web-fitbyme/API/vidio.php";

//   final response = await get(Uri.parse(jsonEndpoint));

//   if (response.statusCode == 200) {
//     List vidio = json.decode(response.body);
//     return vidio.map((vidio) => new Vidio.fromJson(vidio)).toList();
//   } else
//     throw Exception('We are not able to succesfully download the json data.');
// }

// class VidioDisplay extends StatelessWidget {
//   const VidioDisplay({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.indigo.shade900,
//         title: Text(
//           'PROGRAMS',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Center(
//         child: new FutureBuilder<List<Vidio>>(
//           future: downloadJSON(),
//           builder: ((context, snapshot) {
//             if (snapshot.hasData) {
//               List<Vidio> vidio = snapshot.data as List<Vidio>;
//               return new VidioList(vidio);
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             return new CircularProgressIndicator();
//           }),
//         ),
//       ),
//     );
//   }
// }

class VidioList extends StatefulWidget {
  const VidioList({Key? key}) : super(key: key);

  @override
  State<VidioList> createState() => _VidioListState();
}

class _VidioListState extends State<VidioList> {
  List ListVidio = [];
  bool loading = true;

  Future getAllVidio() async {
    var response = await http
        .get(Uri.parse("http://192.168.18.5/Web-fitbyme/API/vidio.php"));
    if (response.statusCode == 200) {
      setState(() {
        ListVidio = json.decode(response.body);
        loading = false;
      });
      print(ListVidio);
      return ListVidio;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllVidio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {},
        ),
        title: Text(
          'PROGRAMS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[900],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            )
          : ListView.builder(
              itemCount: ListVidio.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 3,
                    child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayVidio(
                                vidio: Config.VIDEO_FOLDER +
                                    ListVidio[index]['vidio'],
                              ),
                            ),
                          );
                        },
                        leading: Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: NetworkImage(ListVidio[index]['gambar']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(ListVidio[index]['judul'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(ListVidio[index]['oleh'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              )),
                        )));
              },
            ),
    );
  }
}
