import 'dart:io';
//import 'dart:js';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UploadFile2 extends StatefulWidget {
  const UploadFile2({Key? key}) : super(key: key);

  @override
  State<UploadFile2> createState() => _UploadFile2State();
}

class _UploadFile2State extends State<UploadFile2> {
  PlatformFile? pickedFile;
   bool _isLoading=false;
   double progress=0.0;
  UploadTask? uploadTask;
  Future selectfile() async{
    final result=await FilePicker.platform.pickFiles();
    if(result==null) return;

    setState(() {
      pickedFile=result.files.first;
    });
  }
   Future uploadfile() async{
   final path='files/${pickedFile!.name}';
   final file=File(pickedFile!.path!);

   final ref=FirebaseStorage.instance.ref().child(path);
  setState(() {
    uploadTask= ref.putFile(file);
  });
   final snapshot=await uploadTask!.whenComplete((){});
   setState(() {
     uploadTask==null;
   });

  
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload file"),),
      body: Column(
        children: [
          if(pickedFile!=null)
          Expanded(child: Container(
            color: Colors.blue[100],
            child: Text(pickedFile!.name),
          )),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            selectfile();
          }, child: Text("Select")),
            SizedBox(height: 10,),
           ElevatedButton(onPressed: (){
            uploadfile();

            //buildProgress();
           }, child: Text("upload")),
        ],
      ),
    );
  }
}

/*Widget buildProgress() =>StreamBuilder(
  stream: uploadTask?.snapshotEvents,
  builder: (context,snapshot){
    if(snapshot.hasData){
      final data=snapshot.data!;
      double progress=data.bytesTransffered/data.totalBytes;
      return SizedBox(
        height: 50,
        child: Stack(fit: StackFit.expand,
        children: [
          LinearProgressIndicator(
            value: progress,
            backgroundColor:Colors.grey,
            color: Colors.green,
          )
        ],),
      )

    }else{
      return const SizedBox(height: 50,);
    }
  });*/
