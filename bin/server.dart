
import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:redstone/redstone.dart' as app;
import 'package:redstone_web_socket/redstone_web_socket.dart';


@app.Route("/data/login", methods: const [app.POST])
addUser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return logingetDataFromDB(data);
}

Future<String> logingetDataFromDB(String data) async{
  var pool = new ConnectionPool(
      host: 'www.muedu.org',port: 3306,
      user: 'deit-2015',password: 'deit@2015!',
      db: 'project_2015_2',max:5);
      var results = await pool.query('select userid,password from user where useridpassword='+data);
      String response;
       await results.forEach((row) { 
     // response =JSON.encode(["${row[0]}"]);
    if((row[0]+row[1])==data){response="1";}//判断账号密码是否正确
  });
      return response;
     // return '''["林凌","刘冠群","汤夏颖"]''';
}//登录部分连接数据库

@app.Route("/data/random", methods: const [app.POST])
randomuser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return randomDataFromDB(data);
}

Future<String> randomDataFromDB(String data) async{
  var pool = new ConnectionPool(
      host: 'www.muedu.org',port: 3306,
      user: 'deit-2015',password: 'deit@2015!',
      db: 'project_2015_2',max:5);
      var results = await pool.query('select userid from user where usernumber='+data);
      String response;
       await results.forEach((row) { 
       response =JSON.encode(["${row[0]}"]);
  });
      return response;
}//随机点几个名部分连接数据库




@app.Route("/data/randomj", methods: const [app.POST])
randomjuser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return randomjDataFromDB(data);
}

Future<String> randomjDataFromDB(String data) async{
  var pool = new ConnectionPool(
      host: 'www.muedu.org',port: 3306,
      user: 'deit-2015',password: 'deit@2015!',
      db: 'project_2015_2',max:5);
      var results = await pool.query('select userid from user where usernumber='+data);
      String response;
       await results.forEach((row) { 
       response =JSON.encode(["${row[0]}"]);
  });
      return response;
}//随机点奇数名部分连接数据库

@app.Route("/data/randomo", methods: const [app.POST])
randomouser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return randomoDataFromDB(data);
}

Future<String> randomoDataFromDB(String data) async{
  var pool = new ConnectionPool(
      host: 'www.muedu.org',port: 3306,
      user: 'deit-2015',password: 'deit@2015!',
      db: 'project_2015_2',max:5);
      var results = await pool.query('select userid from user where usernumber='+data);
      String response;
       await results.forEach((row) { 
       response =JSON.encode(["${row[0]}"]);
  });
      return response;
}//随机点ou数名部分连接数据库


@app.Route("/data/makeTeam", methods: const [app.POST])
makeTuser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return teamDataFromDB(data);
}

Future<String> teamDataFromDB(String data) async{
  var pool = new ConnectionPool(
      host: 'www.muedu.org',port: 3306,
      user: 'deit-2015',password: 'deit@2015!',
      db: 'project_2015_2',max:5);
      var results = await pool.query('select userid from user where usernumber='+data);
      String response;
       await results.forEach((row) { 
       response =JSON.encode(["${row[0]}"]);
  });
      return response;
}//随堂分组连接数据库部分

@app.Route("/register/")
register() => "you can now a number";

@WebSocketHandler("/ws")
class ServerEndPoint {

  @OnOpen()
  void onOpen(WebSocketSession session) {
    print("connection established");
  }

  @OnMessage()
  void onMessage(String message, WebSocketSession session) {
    print("message received: $message");
    session.connection.add("echo $message");
  }

  @OnError()
  void onError(error, WebSocketSession session) {
    print("error: $error");
  }

  @OnClose()
  void onClose(WebSocketSession session) {
    print("connection closed");
  }

}

main() {
   Map corsHeaders1 = {
    "Access-Control-Allow-Methods": "POST",
    "Access-Control-Allow-Origin": "*",
  };
  shelf.Middleware middleware =
      shelf_cors.createCorsHeadersMiddleware(corsHeaders:corsHeaders1);
  app.setupConsoleLog();
  app.addShelfMiddleware(middleware);
  //install web socket handlers
  app.addPlugin(getWebSocketPlugin());
  app.start(port:90);
}