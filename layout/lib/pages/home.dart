import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ความรู้เกี่ยวกับกล้องวงจรปิด"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder( builder:(context, snapshot) {
            var data = json.decode(snapshot.data.toString()); //คลาสเจสันต้องอิมพอตมาด้วย import 'dart:convert';, dataคือ[{},{},{}]
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                  return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['image_url'], data[index]['detail']);
              

              }, 
              itemCount: data.length, );

        },
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          
          
          
          )
      ),
      
    );
  }


 Widget MyBox(String title, String subtitle, String image_url, String detail){
   var v1,v2,v3,v4;
   v1 = title;
   v2 = subtitle;
   v3 = image_url;
   v4 = detail;
   return Container(
     margin: EdgeInsets.all(20),
     padding: EdgeInsets.all(20),
     //color: Colors.pink[200],
     height: 150,
     decoration: BoxDecoration(
       //color: Colors.pink[200],

       borderRadius: BorderRadius.circular(20), //ทำขอบมนๆ
       image: DecorationImage(
         image: NetworkImage(image_url),
         fit: BoxFit.cover, //ทำให้รูปเต็มกรอบ
         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.40), BlendMode.darken)
         ) 
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start, 
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(title, style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
         Text(subtitle, style: TextStyle(fontSize: 15, color: Colors.white),
         ),
         SizedBox(height: 20),
         TextButton(onPressed: (){
           print("Next Page >>>");
           Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(v1,v2,v3,v4)));
         },child: Text("อ่านต่อ"),)
      ],
     ),
   );
 }


}