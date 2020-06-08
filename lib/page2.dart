import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class page2 extends StatefulWidget {

  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {


  var url = 'https://sigmatenant.ml/mobile/json';

  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();


  }

  fetchData()async {
    var response = await http.get(url);
    data = jsonDecode(response.body);
    // print(data);
    print(data["json"][1]["productImagePath"]["exteriorView"]);
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: data != null?Column(
          children: <Widget>[
            Container(
              height: 142,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(170.0, 100.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Featured',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            Flexible(
              child: ListView.builder(
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 5.0,
                      shadowColor: Colors.grey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Image.asset('images/download.jpg'),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '   ',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        data['json'][index]['buildingName'],
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        size: 18.0,
                                      ),
                                      Text(
                                        data['json'][index]['streetDetails'],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 17,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    size: 20.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                        ],
                      ),
                    ),
                  );

                },
                itemCount: data["json"].length,
              ),
            ),
          ]

      ): Center(child: CircularProgressIndicator()),

    ),);
  }

}