import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Error.dart';
import 'Success.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var jsonData;
bool show_loading = false;
  Future uploadPhoto(File image) async {
    print("Uploading");
    String image1 = image.toString();
    List a = image1.split("/");
    String name = a[a.length - 1];
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('$name.jpg');
    final StorageUploadTask task = firebaseStorageRef.putFile(image);
        if(task.isInProgress){
      setState(() {
      show_loading = true;
        
      });
    }
    task.onComplete.then((onValue) async {
      String url = await firebaseStorageRef.getDownloadURL();
      print(url);
      String query = """
            mutation{
            createFace(check:false,criminal:true,image:"$url"){
              msg
            }
           }
                    """;
      http.Response response = await http
          .post("http://142.93.221.127:8000/graphql/", body: {'query': query});
      jsonData = json.decode(response.body);
      print(jsonData);
      // return jsonData;
      if (jsonData["data"]["createFace"]["msg"] == "created") {
        // Navigator.pushNamed(context, '/success');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Success("Image uploaded Successfully")),
        );
      } else {
        Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Error("Image not uploaded. Try again!")),);
      }
    });
  }

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 10);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? Text('No image selected')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.file(_image),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        color: Colors.grey[600],
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.grey[600])),
                        onPressed: () {
                          uploadPhoto(_image);
                        },
                        child: Container(
                            height: 60,
                            width: 180,
                            child: Center(
                                child: Text("UPLOAD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))))),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[600],
        onPressed: getImage,
        tooltip: 'CLICK PHOTO',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
