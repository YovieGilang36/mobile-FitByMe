import 'dart:convert';

// import 'package:fitbyme/program/article/artikel_list.dart';
// import 'package:fitbyme/program/resep/vidio.dart';
// import 'package:fitbyme/program/resep/resep_list.dart';
import 'package:fitbyme/profile/profile.dart';
import 'package:fitbyme/program/resep/playvidio.dart';
import 'package:fitbyme/program/resep/vidio.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Config {
  static const BASE_URL = "http://192.168.43.205/Web-fitbyme/";
  static const VIDEO_FOLDER = BASE_URL + "vidio/";
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  String email = "";
  List _get = [];
  Future _getData() async {
    var response = await http.get(
        Uri.parse("http://192.168.43.205/Web-fitbyme/API/vidio_dashboard.php"));
    if (response.statusCode == 200) {
      setState(() {
        _get = json.decode(response.body);
      });
      print(_get);
      return _get;
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // Future getEmail()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //    setState(() {
  //      email = preferences.getString('email')!;
  //    });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getEmail();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
        child: ListView(
          children: [
            // Center(child: email == '' ? Text('') : Text(email)),
            // SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "FitByMe",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                IconButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                }, 
                icon: Icon(Icons.settings, size: 30, color: Colors.black,))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 130,
              width: 180,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.indigo.shade900,
                    width: 3,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(
                        left: 230, right: 10, bottom: 5, top: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "image/welcome.png",
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 100,
                      top: 17,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Customize your own training plans based on your preference",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "List Programs",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo.shade900,
                  ),
                ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VidioList(),
                      ),
                    );
                  },
                  child: Text(
                    "view more",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,),
                  ),
                  GridList(get: _get),
                ],
              ),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         InkWell(
              //           child: Container(
              //             height: 180,
              //             width: 160,
              //             child: Card(
              //               color: Colors.indigo[900],
              //               elevation: 3,
              //               clipBehavior: Clip.antiAlias,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15),
              //               ),
              //               child: Stack(
              //                 alignment: Alignment.center,
              //                 children: [
              //                   Container(
              //                     height: 80,
              //                     width: 80,
              //                     decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage(
              //                             "image/meals 1.png",
              //                           ),
              //                           fit: BoxFit.fill),
              //                     ),
              //                   ),
              //                   Container(
              //                     margin: EdgeInsets.only(top: 120),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "Practice Today",
              //                           style: TextStyle(
              //                             fontSize: 20,
              //                             fontWeight: FontWeight.w800,
              //                             color: Colors.white,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //          onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => VidioList(),
              //               ),
              //             );
              //           },
              //         ),
              //         InkWell(
              //           child: Container(
              //             height: 180,
              //             width: 160,
              //             child: Card(
              //               color: Colors.indigo[50],
              //               elevation: 3,
              //               clipBehavior: Clip.antiAlias,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15),
              //               ),
              //               child: Stack(
              //                 alignment: Alignment.center,
              //                 children: [
              //                   Container(
              //                     height: 80,
              //                     width: 80,
              //                     decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage(
              //                             "image/program 2.png",
              //                           ),
              //                           fit: BoxFit.fill),
              //                     ),
              //                   ),
              //                   Container(
              //                     margin: EdgeInsets.only(top: 120),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "Programs",
              //                           style: TextStyle(
              //                             fontSize: 20,
              //                             fontWeight: FontWeight.w800,
              //                             color: Colors.indigo[900],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) =>VidioList(),
              //               ),
              //             );
              //           },
              //         ),
              //       ]),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Expanded(
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         InkWell(
              //           child: Container(
              //             height: 180,
              //             width: 160,
              //             child: Card(
              //               color: Colors.indigo[50],
              //               elevation: 3,
              //               clipBehavior: Clip.antiAlias,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15),
              //               ),
              //               child: Stack(
              //                 alignment: Alignment.center,
              //                 children: [
              //                   Container(
              //                     height: 80,
              //                     width: 80,
              //                     decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage(
              //                             "image/articel 1.png",
              //                           ),
              //                           fit: BoxFit.fill),
              //                     ),
              //                   ),
              //                   Container(
              //                     margin: EdgeInsets.only(top: 120),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "Articles",
              //                           style: TextStyle(
              //                             fontSize: 20,
              //                             fontWeight: FontWeight.w800,
              //                             color: Colors.indigo[900],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           onTap: () {
              //             Navigator.push(context,
              //                 MaterialPageRoute(builder: (context) => Display()));
              //           },
              //         ),
              //         InkWell(
              //           child: Container(
              //             height: 180,
              //             width: 160,
              //             child: Card(
              //               color: Colors.indigo[50],
              //               elevation: 3,
              //               clipBehavior: Clip.antiAlias,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15),
              //               ),
              //               child: Stack(
              //                 alignment: Alignment.center,
              //                 children: [
              //                   Container(
              //                     height: 80,
              //                     width: 80,
              //                     decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage(
              //                             "image/meals 1.png",
              //                           ),
              //                           fit: BoxFit.fill),
              //                     ),
              //                   ),
              //                   Container(
              //                       margin: EdgeInsets.only(top: 120),
              //                       child: Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             "Meals",
              //                             style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.w800,
              //                               color: Colors.indigo[900],
              //                             ),
              //                           ),
              //                         ],
              //                       )),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           onTap: () {
              //             Navigator.push(context,
              //                 MaterialPageRoute(builder: (context) => Lihat()));
              //           },
              //         ),
              //       ]),
            ),
            //   Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 190,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //         Color.fromARGB(255, 0, 136, 248).withOpacity(0.9),
            //         Color.fromARGB(255, 0, 136, 248).withOpacity(0.4),
            //       ], begin: Alignment.bottomLeft, end: Alignment.bottomCenter),
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(10),
            //         bottomLeft: Radius.circular(10),
            //         bottomRight: Radius.circular(10),
            //         topRight: Radius.circular(80),
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.blue.withOpacity(0.5),
            //           blurRadius: 7,
            //           offset: Offset(0, 3), // changes position of shadow
            //         ),
            //       ],
            //     ),
            //     child: Stack(
            //       children: [
            //         Container(
            //           height: 160,
            //           width: 80,
            //           margin: const EdgeInsets.only(
            //             left: 20,
            //             top: 10,
            //             bottom: 10,
            //           ),
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage(
            //                   "image/latihan-hari.png",
            //                 ),
            //                 fit: BoxFit.fill),
            //           ),
            //         ),
            //         Container(
            //           width: double.maxFinite,
            //           height: 60,
            //           margin: const EdgeInsets.only(
            //             left: 120,
            //             top: 25,
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 "My Practice Today",
            //                 style: TextStyle(
            //                   fontSize: 22,
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Text(
            //                 "Keep it up, stick to your plan",
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w600,
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         SizedBox(
            //           height: 30,
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(
            //             top: 120,
            //             left: 120,
            //           ),
            //           child: ElevatedButton(
            //             onPressed: () {
            //               Navigator.push(context,
            //                   MaterialPageRoute(builder: (context) => Program()));
            //             },
            //             child: Padding(
            //               padding: EdgeInsets.all(10.0),
            //               child: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: const [
            //                   Icon(
            //                     Icons.play_circle,
            //                     color: Colors.white,
            //                     size: 32,
            //                   ),
            //                   SizedBox(
            //                     width: 10.0,
            //                   ),
            //                   Text(
            //                     "Start",
            //                     maxLines: 1,
            //                     style:
            //                         TextStyle(color: Colors.white, fontSize: 20),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             style: ButtonStyle(
            //               fixedSize: MaterialStateProperty.all(
            //                 Size(250, 50),
            //               ),
            //               backgroundColor: MaterialStateProperty.all<Color>(
            //                   Theme.of(context).hintColor),
            //               shape: MaterialStateProperty.all(
            //                 RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(30),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   SizedBox(
            //     height: 10,
            //   ),
            //   Row(
            //     children: [
            //       Text(
            //         "Lainnya",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: 28,
            //           fontWeight: FontWeight.w900,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ],
            //   ),
            //   SizedBox(
            //     height: 5,
            //   ),
            //   Container(
            //     child: Card(
            //       elevation: 3,
            //       clipBehavior: Clip.antiAlias,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Stack(
            //         alignment: Alignment.center,
            //         children: [
            //           Ink.image(
            //             image: NetworkImage(
            //               'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEim_ApeLMRbXVZaA2lzaZ0jQ0RAh7A9AaYG2-pWqB8PskCdN1uf66mJlkMJcgFzBsqPqC8-oDy8FsWy9stTkFOHQeJng04HMXYIW6IyIY8TohhxhuLlzOpZPJWiStc79mdHFAqjs3aTehBsKCjMr0V9d2bXf6bTvONzycCDcGsaxGa-bczZyHsSLJC9vQ/s320/image%207.png',
            //             ),
            //             child: InkWell(
            //               onTap: () {},
            //             ),
            //             height: 150,
            //             fit: BoxFit.cover,
            //           ),
            //           Container(
            //             width: 120,
            //             height: 50,
            //             margin: const EdgeInsets.only(right: 180, bottom: 85),
            //             decoration: BoxDecoration(
            //               color: Colors.white.withOpacity(0.6),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Nutrisi",
            //                   style: TextStyle(
            //                     fontSize: 24,
            //                     fontWeight: FontWeight.w900,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Saran untuk anda",
            //                   style: TextStyle(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w100,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

class GridList extends StatelessWidget {
  const GridList({
    Key? key,
    required List get,
  })  : _get = get,
        super(key: key);

  final List _get;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //wajib menggunakan 2 baris script di bawah ini, agar dapat digabung dengan widget lain
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // banyak grid yang ditampilkan dalam satu baris
          crossAxisCount: 2),
      itemBuilder: (_, index) => InkWell(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayVidio(
                        vidio: Config.VIDEO_FOLDER + _get[index]['vidio'],
                      ),
                    ),
                  );
          },
          child: Card(
            child: Column(
              children: [
                Image(
                  image: NetworkImage(_get[index]['gambar']),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _get[index]['judul'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      itemCount: _get.length,
    );
  }
}
