import 'dart:async';
import 'dart:convert';
import 'dart:html';
InputElement toDoInput;
var wordList;


main() async {
  querySelector('#startcall').onClick.listen(makeRequest);
  querySelector('#userphoto').onClick.listen(makePostRequest);
  wordList = querySelector('#wordList');
}

void handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
}

Future makeRequest(Event e) async{
  var path = 'http://localhost:90/data/';
  try {
    processString(await HttpRequest.getString(path));
  } catch (e) {
    print('Couldn\'t open $path');
    handleError(e);
  }
}


Future requestComplete(HttpRequest request) async{
  if(request.status==200){
    List<String>web=
    JSON.decode(request.responseText) as List<String>;
    for(int i=0;i<web.length;i++){
      wordList.children.add(new LIElement()..text=web[i]);
    }
  }else{
    wordList.children.add(
      new LIElement().text='Request failed,status=${request.status}');
  }
}

void processString(String jsonString) {
  List<String> web = JSON.decode(jsonString ) as List<String>;
  //List<String> a=JSON.getData()
  for (int i = 0; i < web.length; i++) {
    wordList.children.add(new LIElement()..text = web[i]);
  }
}

Future makePostRequest(Event e) async { 
  String url = 'http://localhost:90/data/add';
  HttpRequest.request(url, method: 'POST', sendData:'''{'user':'zhangsan'}''' )
      .then((HttpRequest resp) {
    querySelector('#xiaotip').text = resp.responseText;
  });
}