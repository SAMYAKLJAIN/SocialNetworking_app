import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
void main()
{
  runApp(Sif());

}
class Sif extends StatefulWidget {
  @override
  _SifState createState() => _SifState();
}

class _SifState extends State<Sif> {
  @override
  final Firestore _firestore = Firestore.instance;


  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Developer"),),

        body:  new Column(
            children: <Widget>[
              getasset(),
        Expanded(child:

StreamBuilder(

             stream: Firestore.instance.collection('Team').snapshots(),
             builder: (context, snapshot) {
               if (!snapshot.hasData)
                 return Center(child: CircularProgressIndicator(),);

               return ListView.builder(  itemBuilder: (context, index) =>

                   listitems(context, snapshot.data.documents[index]),


               itemExtent: 80.0,
                 itemCount: snapshot.data.documents.length,);
             }


    )
    )

    ]
        )
    );
  }

  Widget listitems(BuildContext context, DocumentSnapshot document) {
    return Card(elevation: 10.0,borderOnForeground: true,
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

    Expanded(child: Text(document['text'],)
    ),
    ]
    )
    );
  }
  Widget getasset()
  {
    AssetImage assetImage=AssetImage('images/dev.jpeg');
    Image image=Image(image: assetImage,width: 250.0,height: 200.0,);
    return image;
  }
}