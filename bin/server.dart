
import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';
import 'dart:convert';


@app.Route("/data/add", methods: const [app.POST])
addUser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return getDataFromDB(data);
}

Future<String> getDataFromDB(String data) async{
  var pool = new ConnectionPool(
      host: 'www.muedu.org',port: 3306,
      user: 'deit-2015',password: 'deit@2015!',
      db: 'project_2015_2',max:5);
      var results = await pool.query('select useridpassword from user where useridpassword='+data);
      String response;
       await results.forEach((row) { 
      response =JSON.encode(["${row[0]}"]);
  });
      return response;
     // return '''["林凌","刘冠群","汤夏颖"]''';
}

@app.Route("/register/")
register() => "you can now a number";

main() {
   Map corsHeaders1 = {
    "Access-Control-Allow-Methods": "POST",
    "Access-Control-Allow-Origin": "*",
  };
  shelf.Middleware middleware =
      shelf_cors.createCorsHeadersMiddleware(corsHeaders:corsHeaders1);
  app.setupConsoleLog();
  app.addShelfMiddleware(middleware);
  app.start(port:90);
}