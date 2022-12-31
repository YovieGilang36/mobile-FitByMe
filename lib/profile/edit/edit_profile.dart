import 'package:fitbyme/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  const AddEditPage({super.key, required this.list, required this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController usia = TextEditingController();
  TextEditingController tinggi = TextEditingController();
  TextEditingController berat = TextEditingController();
  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'http://192.168.18.5/fbm-mobile/edit_user.php';
      http.post(Uri.parse(url), body: {
        'email': widget.list[widget.index]['email'],
        'nama': name.text,
        'jenis_kelamin': gender.text,
        'usia': usia.text,
        'tinggi_badan': tinggi.text,
        'berat_badan': berat.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      email.text = widget.list[widget.index]['email'];
      name.text = widget.list[widget.index]['nama'];
      gender.text = widget.list[widget.index]['jenis_kelamin'];
      usia.text = widget.list[widget.index]['usia'];
      tinggi.text = widget.list[widget.index]['tinggi_badan'];
      berat.text = widget.list[widget.index]['berat_badan'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gender,
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usia,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tinggi,
              decoration: InputDecoration(
                labelText: 'Height',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: berat,
              decoration: InputDecoration(
                labelText: 'Weight',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                setState(() {
                  addUpdateData();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
                debugPrint('Clicked RaisedButton Button');
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
