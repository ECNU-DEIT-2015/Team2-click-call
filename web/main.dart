import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:math' as math;
InputElement  useridinput1;//此变量用于用户名登陆
InputElement  userpasswordinput1;
String myid;//此变量用来存储登录成功后的学号后两位，以便在座位上显示；
var randomnumber= new List<int>();//存随机点名的学号后两位；
String randomnunow;//将学号后两位转换为字符串；
UListElement studentlist;//存被点的学生名单

var wordList;
var ab=document.getElementById("startpage");
var abb=document.getElementById("sidebar");
var bc=document.getElementById("choosepage");
var cd=document.getElementById("classpage");
var de=document.getElementById("lessonpage");
var suc=document.getElementById("successlogin");
var bef=document.getElementById("loginbe");
var rdm=document.getElementById("clubrandompage");

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

querySelector("#recordclass")//左侧点击课堂纪录
   ..id
   ..onClick.listen(onlyrandomButton);
   

   querySelector('#signup').onClick.listen(loginmakePostRequest);//点击signup跳转到登录部分的连接数据库
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

 querySelector('#ramdomD').onClick.listen(randomclass1);//随机点名事件
 studentlist=querySelector("#namelist");
}
 
void randomclass1(Event e){
InputElement randomstnu = querySelector('#randomst input');
int randomstnu1=int.parse(randomstnu.value);//字符串转换成数字；
    for(int i=1;i<=randomstnu1;i++){
    randomnumber[i]=new math.Random().nextInt(20);
    randomnunow=randomnumber[i].toString();
    randomPostRequest(e);
   }
}
//随机点名函数，目前还没加

void makeclub(Event e){

}//随机分组函数，目前还没加


void seat1click(Event e){
  querySelector('#studentid1').text=myid;
}
void seat2click(Event e){
  querySelector('#studentid2').text=myid;
}
void seat3click(Event e){
  querySelector('#studentid3').text=myid;
}
void seat4click(Event e){
  querySelector('#studentid4').text=myid;
}
void seat5click(Event e){
  querySelector('#studentid5').text=myid;
}
void seat6click(Event e){
  querySelector('#studentid6').text=myid;
}
void seat7click(Event e){
  querySelector('#studentid7').text=myid;
}
void seat8click(Event e){
  querySelector('#studentid8').text=myid;
}
void seat9click(Event e){
  querySelector('#studentid9').text=myid;
}
void seat10click(Event e){
  querySelector('#studentid10').text=myid;
}
void seat11click(Event e){
  querySelector('#studentid11').text=myid;
}
void seat12click(Event e){
  querySelector('#studentid12').text=myid;
}
void seat13click(Event e){
  querySelector('#studentid13').text=myid;
}
void seat14click(Event e){
  querySelector('#studentid14').text=myid;
}
void seat15click(Event e){
  querySelector('#studentid15').text=myid;
}
void seat16click(Event e){
  querySelector('#studentid16').text=myid;
}
void seat17click(Event e){
  querySelector('#studentid17').text=myid;
}
void seat18click(Event e){
  querySelector('#studentid18').text=myid;
}
void seat19click(Event e){
  querySelector('#studentid19').text=myid;
}
void seat20click(Event e){
  querySelector('#studentid20').text=myid;
}//每个位置被点击后显示相应的学号;


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

void processString(String jsonString) {
  List<String> web = JSON.decode(jsonString ) as List<String>;
  //List<String> a=JSON.getData()
  for (int i = 0; i < web.length; i++) {
    wordList.text = web[i];
  }
  querySelector('#test').text =wordList;
}

Future loginmakePostRequest(Event e) async { 
  useridinput1 = querySelector('#userid input');
  userpasswordinput1 = querySelector('#userpassword input');
    if(useridinput1.value.length<11){
        querySelector('#test').text ="账号为11位数，请输入正确的账号";
     }//账号必须为11位数，保证下面传输的账号+密码不可能有其他情况
    else{
        String useridpassword=useridinput1.value+userpasswordinput1.value;
        String url = 'http://localhost:90/data/login';
       HttpRequest.request(url, method: 'POST', sendData:useridpassword)
       .then((HttpRequest resp) {
      querySelector('#test').text =resp.responseText;

          if(resp.responseText == "1"){ 
                suc.style.display='block';
                bef.style.display='none'; //显示登录成功的图片
                querySelector('#useridshow').text =useridinput1.value;
                querySelector('#usernameshow').text =userpasswordinput1.value;//登录成功后之后的界面左上方显示账户和密码
                for (int i = 10; i <= (useridinput1.value).length; i++) myid=(useridinput1.value)[i];
               }
          else {
          bef.style.display='none';//登陆消失，显示登录失败图片；
          suc.style.display='none';
               }
       });
     }
}//登录部分的连接数据库

Future randomPostRequest(Event e) async { 
        String url = 'http://localhost:90/data/random';
       HttpRequest.request(url, method: 'POST', sendData:randomnunow)
       .then((HttpRequest resp) {
      //querySelector('#test').text =resp.responseText;
      var newnamelist=new LIElement();
      newnamelist.text=resp.responseText;
     studentlist.children.add(newnamelist);//将点到的学生名单用列表表示出来;
       });
}//随机点名部分的连接数据库

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
void onlyrandomButton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='none';
    bc.style.display='none';
    cd.style.display='none';
    de.style.display='none';
    rdm.style.display='block';
}

//以下是实时传输的尝试
var webSocket = new WebSocket('ws://localhost:90/ws');
ws.onmessage = function(event) {
  console.log('Count is: ' + event.data);
};

if (webSocket != null && webSocket.readyState == WebSocket.OPEN) {
  webSocket.send(data);
} else {
  print('WebSocket not connected, message $data not sent');
}
webSocket.onMessage.listen((MessageEvent e) {
  receivedData(e.data);
});

//这个届时放到主函数里面
  for (int i = 0; i < 10; i++) {
    print(i);
    sleep(const Duration(milliseconds: 500));
  }

