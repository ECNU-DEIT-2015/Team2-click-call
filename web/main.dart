import 'dart:async';
import 'dart:convert';
import 'dart:html';
InputElement toDoInput;
var wordList;

main() async {
  querySelector('#onlesson-call-char1').onClick.listen(makeRequest);
  querySelector('#userphoto').onClick.listen(makePostRequest);
  wordList = querySelector('#studentid1');
   querySelector("#startpage")//点击登录
   ..id
   ..onClick.listen(LoginButton);
}

void handleError(Object error) {
 wordList.text = 'Request failed.';
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
      wordList.text=web[i];
    }
  }else{
    wordList.add(
      wordList.text='Request failed,status=${request.status}');
  }
}

void processString(String jsonString) {
  List<String> web = JSON.decode(jsonString ) as List<String>;
  //List<String> a=JSON.getData()
  for (int i = 0; i < web.length; i++) {
    wordList.text = web[i];
  }
 // querySelector('#seatid').text =web[i];
}

Future makePostRequest(Event e) async { 
  String url = 'http://localhost:90/data/add';
  HttpRequest.request(url, method: 'POST', sendData:'''{'user':'zhangsan'}''' )
      .then((HttpRequest resp) {
    querySelector('#xiaotip').text = resp.responseText;
  });
}

void LoginButton(MouseEvent event){
    var x=document.getElementById("startpage");
    var y=document.getElementById("choosepage");
    x.style.display='none';
    y.style.display='block';
}