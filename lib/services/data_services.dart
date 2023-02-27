import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/models/data_models.dart';
import 'dart:convert';


class DataServices{
  String baseurl = "http://mark.bslmeiyu.com/api";

  getinfo() async {
    var apiurl = "/getplaces";
    //http.Response response = http.get(Uri.parse(baseurl+apiurl));
    http.Response response = await http.get(Uri.parse(baseurl+apiurl));
    try{
      if(response.statusCode == 200){
        List<dynamic> list = json.decode(response.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
      else{
        return <DataModel>[];
      }
    }
    catch(e){
      print(e.toString());
      return <DataModel>[];
    }
  }
}