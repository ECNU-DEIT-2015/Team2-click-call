import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:math' as math;
var randomnumber;//此变量用来存储随机数
InputElement  useridinput1;//此变量用于用户名登陆
InputElement  userpasswordinput1;
int myid=9;//此变量用来存储登录成功后传递过来的学号；
var wordList;
var ab=document.getElementById("startpage");
var abb=document.getElementById("sidebar");
var bc=document.getElementById("choosepage");
var cd=document.getElementById("classpage");
var de=document.getElementById("lessonpage");

main() async {

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

  querySelector('#onlesson-st-choose-random').onClick.listen(randomclass);
  querySelector('#onlesson-st-choose-random').onClick.listen(makePostRequest);
  //随机点名

   querySelector('#signup').onClick.listen(makePostRequest);
   wordList = querySelector('#test');

  querySelector('#onlesson-call-char1').onClick.listen(seat1click);
  querySelector('#onlesson-call-char2').onClick.listen(seat2click);
  querySelector('#onlesson-call-char3').onClick.listen(seat3click);
  querySelector('#onlesson-call-char4').onClick.listen(seat4click);
  querySelector('#onlesson-call-char5').onClick.listen(seat5click);
  querySelector('#onlesson-call-char6').onClick.listen(seat6click);
  querySelector('#onlesson-call-char7').onClick.listen(seat7click);
  querySelector('#onlesson-call-char8').onClick.listen(seat8click);
  querySelector('#onlesson-call-char9').onClick.listen(seat9click);
  querySelector('#onlesson-call-char10').onClick.listen(seat10click);
  querySelector('#onlesson-call-char11').onClick.listen(seat11click);
  querySelector('#onlesson-call-char12').onClick.listen(seat12click);
  querySelector('#onlesson-call-char13').onClick.listen(seat13click);
  querySelector('#onlesson-call-char14').onClick.listen(seat14click);
  querySelector('#onlesson-call-char15').onClick.listen(seat15click);
  querySelector('#onlesson-call-char16').onClick.listen(seat16click);
  querySelector('#onlesson-call-char17').onClick.listen(seat17click);
  querySelector('#onlesson-call-char18').onClick.listen(seat18click);
  querySelector('#onlesson-call-char19').onClick.listen(seat19click);
  querySelector('#onlesson-call-char20').onClick.listen(seat20click);//每个座位设置点击事件，显示相应的学号
}

void seat1click(Event e){
  querySelector('#studentid1').text=myid.toString();
}
void seat2click(Event e){
  querySelector('#studentid2').text=myid.toString();
}
void seat3click(Event e){
  querySelector('#studentid3').text=myid.toString();
}
void seat4click(Event e){
  querySelector('#studentid4').text=myid.toString();
}
void seat5click(Event e){
  querySelector('#studentid5').text=myid.toString();
}
void seat6click(Event e){
  querySelector('#studentid6').text=myid.toString();
}
void seat7click(Event e){
  querySelector('#studentid7').text=myid.toString();
}
void seat8click(Event e){
  querySelector('#studentid8').text=myid.toString();
}
void seat9click(Event e){
  querySelector('#studentid9').text=myid.toString();
}
void seat10click(Event e){
  querySelector('#studentid10').text=myid.toString();
}
void seat11click(Event e){
  querySelector('#studentid11').text=myid.toString();
}
void seat12click(Event e){
  querySelector('#studentid12').text=myid.toString();
}
void seat13click(Event e){
  querySelector('#studentid13').text=myid.toString();
}
void seat14click(Event e){
  querySelector('#studentid14').text=myid.toString();
}
void seat15click(Event e){
  querySelector('#studentid15').text=myid.toString();
}
void seat16click(Event e){
  querySelector('#studentid16').text=myid.toString();
}
void seat17click(Event e){
  querySelector('#studentid17').text=myid.toString();
}
void seat18click(Event e){
  querySelector('#studentid18').text=myid.toString();
}
void seat19click(Event e){
  querySelector('#studentid19').text=myid.toString();
}
void seat20click(Event e){
  querySelector('#studentid20').text=myid.toString();
}//每个位置被点击后显示相应的学号;


void randomclass(Event e){
randomnumber=new math.Random().nextInt(20);
}
//随机点名函数


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
  querySelector('#test').text =wordList;
}

Future makePostRequest(Event e) async { 
  useridinput1 = querySelector('#userid input');
  userpasswordinput1 = querySelector('#userpassword input');
  String useridinput=useridinput1.value;
  String userpasswordinput=userpasswordinput1.value;
  String useridpassword=useridinput+userpasswordinput;
  String url = 'http://localhost:90/data/add';
  HttpRequest.request(url, method: 'POST', sendData:useridpassword)
      .then((HttpRequest resp) {
  querySelector('#test').text =resp.responseText;
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