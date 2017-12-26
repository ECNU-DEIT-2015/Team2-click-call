import 'dart:async';
import 'dart:convert';
import 'dart:html';
InputElement toDoInput;
var wordList;
var ab=document.getElementById("startpage");
var abb=document.getElementById("sidebar");
var bc=document.getElementById("choosepage");
var cd=document.getElementById("classpage");
var de=document.getElementById("lessonpage");

main() async {
  querySelector('#onlesson-call-char1').onClick.listen(makeRequest);
  querySelector('#userphoto').onClick.listen(makePostRequest);
  wordList = querySelector('#studentid1');
  querySelector("#loginbutton")//点击登录按钮，跳转到选课页面
   ..id
   ..onClick.listen(LoginButton);
  querySelector("#classok")//点击确认选课，跳转已选课页面
   ..id
   ..onClick.listen(ClassokButton);
  querySelector("#myclass")//左侧点击我的课程
   ..id
   ..onClick.listen(ClassokButton);
  querySelector("#randomclass")//左侧点击随机点名
   ..id
   ..onClick.listen(RandomclassButton);
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
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='block';
    cd.style.display='none';
    de.style.display='none';
}

void ClassokButton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='block';
    de.style.display='none';
}

void RandomclassButton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='none';
    de.style.display='block';
}
