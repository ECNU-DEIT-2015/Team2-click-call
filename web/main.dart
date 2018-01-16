import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:math' as math;
InputElement  useridinput1;//此变量用于用户名登陆
InputElement  userpasswordinput1;
InputElement newclass;
InputElement questinput;
UListElement quest;
InputElement taskinput;
UListElement tasktarget;
UListElement taskshow;
UListElement taskhard;
UListElement taskother;
UListElement newclasses;
var studentlist1= new List<String>();
int teamnu1;
String myid;//此变量用来存储登录成功后的学号后两位，以便在座位上显示；
var wordList;
var ab=document.getElementById("startpage");
var abb=document.getElementById("sidebar");
var bc=document.getElementById("choosepage");
var cd=document.getElementById("classpage");
var de=document.getElementById("lessonpage");
var suc=document.getElementById("successlogin");
var bef=document.getElementById("loginbe");
var rdm=document.getElementById("clubrandompage");
var click=document.getElementById("clickpage");
var wait=document.getElementById("developwait");

main() async {

  querySelector("#loginbutton")//点击登录按钮，出现登陆页面
   ..id
   ..onClick.listen(StartLoginButton);

   querySelector("#registerbutton")//点击免费注册按钮，跳转到选课页面
   ..id
   ..onClick.listen(LoginButton);

   querySelector("#startloginbutton")//登陆成功后跳到选课页面
   ..id
   ..onClick.listen(LoginButton);

  querySelector("#loginagainbutton")//登陆失败后重新登陆
   ..id
   ..onClick.listen(LoginagainButton);

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
   
  querySelector("#startcall")//左侧点击开始签到
   ..id
   ..onClick.listen(onlyclickButton); 

  querySelector("#help").onClick.listen(helpwaitbutton); 

  querySelector("#advice").onClick.listen(advicewaitbutton);    

  querySelector("#delete")
   ..onClick.listen(deleteelemnt);
  
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

 querySelector('#ramdomD').onClick.listen(randomPostRequest);//随机点名事件
 querySelector('#ramdomJ').onClick.listen(randomPostRequestJ);//随机奇数点名事件
 querySelector('#ramdomO').onClick.listen(randomPostRequestO);//随机偶数点名事件
 querySelector('#makeT').onClick.listen(maketeamPostRequest);//随机分组事件
// for(int i=1;i<teamnu1;i++){querySelector("#namelist1").appendHtml('<li>' + studentlist1 + '</li>');}
 querySelector('#signup').onClick.listen(loginmakePostRequest);//登录事件
questinput = querySelector('#questinput');
quest = querySelector('#quest');
newclass = querySelector('#classinput');
questinput.onChange.listen(addquestitem);
newclass.onChange.listen(classmakePostRequest);
taskinput = querySelector('#taskinput');
taskshow = querySelector('#taskshow');
taskhard = querySelector('#taskhard');
taskother = querySelector('#taskother');
tasktarget = querySelector('#tasktarget');
newclasses= querySelector('#classnew');

querySelector('#task1').onClick.listen(addtask1);
querySelector('#task2').onClick.listen(addtask2);
querySelector('#task3').onClick.listen(addtask3);
querySelector('#task4').onClick.listen(addtask4);

for(int i=1;i<21;i++){
       String stn=i.toString();
       String url = 'http://localhost:90/data/stinfo';
       HttpRequest.request(url, method: 'POST', sendData:stn)
       .then((HttpRequest resp) {
      querySelector("#stinfo").appendHtml('<tr>'+resp.responseText+'</tr>');
       });
       }//dart语言控制HTML里面表格，自动显示数据库中学生学号与姓名，不需要单个在HTML里面写；
}

void addquestitem(Event e)
{
  var newquest = new LIElement();
  newquest.text = questinput.value;
  newquest.onClick.listen((e) => newquest.remove());
  questinput.value='';
  quest.children.add(newquest); 
}

void addtask1(Event e)
{ 
  var newtask = new LIElement();
  newtask.text = taskinput.value;
  newtask.onClick.listen((e) => newtask.remove());  
  taskinput.value='';
  tasktarget.children.add(newtask); 
}

void addtask2(Event e)
{ 
  var newtask = new LIElement();
  newtask.text = taskinput.value;
  newtask.onClick.listen((e) => newtask.remove());  
  taskinput.value='';
  taskshow.children.add(newtask); 
}

void addtask3(Event e)
{ 
  var newtask = new LIElement();
  newtask.text = taskinput.value;
  newtask.onClick.listen((e) => newtask.remove());  
  taskinput.value='';
  taskhard.children.add(newtask); 
}

void addtask4(Event e)
{ 
  var newtask = new LIElement();
  newtask.text = taskinput.value;
  newtask.onClick.listen((e) => newtask.remove());  
  taskinput.value='';
  taskother.children.add(newtask); 
}

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
          if(resp.responseText == "1"){ 
                suc.style.display='block';
                bef.style.display='none';
                document.getElementById("startloginbutton").style.display='block'; //显示登录成功的图片
                querySelector('#useridshow').text =useridinput1.value;
                querySelector('#usernameshow').text ="   您的学号";//登录成功后之后的界面左上方显示账户和密码
                for (int i = 10; i < (useridinput1.value).length; i++) myid=(useridinput1.value)[i-1]+(useridinput1.value)[i];
               }
          else {
          bef.style.display='none';//登陆消失，显示登录失败图片；
          suc.style.display='none';
          document.getElementById("loginagainbutton").style.display='block';
          document.getElementById("failurelogin").style.display='block';
               }
       });
     }
}//登录部分的连接数据库


Future randomPostRequest(Event e) async { 
  String url = 'http://localhost:90/data/random';
  UListElement studentlist;//存被点的学生名单;
  String randomnunow;//将学号后两位转换为字符串；
  studentlist=querySelector("#namelist");
  var randomnumber= new List<int>();//存随机点名的学号后两位；
  randomnumber.addAll([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
  InputElement randomstnu = querySelector('#randomst input');
  int randomstnu1=int.parse(randomstnu.value);//一次想点的学生人数，字符串转换成数字；
  int count=1;
  var flag=1;
    while(count<=randomstnu1){
      int currentnum=new math.Random().nextInt(20);
      flag=1;
      for(int i=1;i<=randomstnu1;i++)
      {
      if(currentnum==randomnumber[i]){
         flag=2;
         break;}
      }
    if(flag==1){
      randomnumber[count]=currentnum;
      randomnunow=currentnum.toString();
        HttpRequest.request(url, method: 'POST', sendData:randomnunow)
       .then((HttpRequest resp) {
      //querySelector('#test').text =resp.responseText;
      var newnamelist=new LIElement();
      newnamelist.text=resp.responseText;
     studentlist.children.add(newnamelist);//将点到的学生名单用列表表示出来;
     newnamelist.onClick.listen((e)=>newnamelist.remove());
       });
      count++;
   }  
  } 
}//随机点名部分,直接连接数据库


Future randomPostRequestJ(Event e) async { 
  String url = 'http://localhost:90/data/randomj';
  UListElement jstudentlist;//存被点的学生名单;
  String randomjnunow;//将学号后两位转换为字符串；
  jstudentlist=querySelector("#namelist");
  var randomjnumber= new List<int>();//存随机点名的学号后两位；
  randomjnumber.addAll([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
  InputElement randomjstnu = querySelector('#randomst input');
  int randomstnuj=int.parse(randomjstnu.value);//一次想点的学生人数，字符串转换成数字；
  int countj=1;
  var flagj=1;
    while(countj<=randomstnuj){
      int currentnumj=new math.Random().nextInt(20);
       flagj=1;
      if(currentnumj<20){              //转为奇数
           if(currentnumj%2==0)randomjnumber[countj]=currentnumj;
           else randomjnumber[countj]=currentnumj+1;
         }
       else randomjnumber[countj]=currentnumj-1;

        for(int i=1;i<=randomstnuj;i++) {
          if(currentnumj==randomjnumber[i]){
          flagj=2;
         break;}
         }
        if(flagj==1){
         // randomjnumber[countj]=currentnumj;
         randomjnunow=currentnumj.toString();
         HttpRequest.request(url, method: 'POST', sendData:randomjnunow)
         .then((HttpRequest resp) {
          //querySelector('#test').text =resp.responseText;
           var newnamelist=new LIElement();
            newnamelist.text=resp.responseText;
            jstudentlist.children.add(newnamelist);//将点到的学生名单用列表表示出来;
            newnamelist.onClick.listen((e)=>newnamelist.remove());
           });
            countj++;
         }  
     } 
}//随机点名奇数部分,直接连接数据库


Future randomPostRequestO(Event e) async { 
  String url = 'http://localhost:90/data/randomo';
  UListElement ostudentlist;//存被点的学生名单;
  String randomonunow;//将学号后两位转换为字符串；
  ostudentlist=querySelector("#namelist");
  var randomonumber= new List<int>();//存随机点名的学号后两位；
  randomonumber.addAll([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
  InputElement randomostnu = querySelector('#randomst input');
  int randomstnuo=int.parse(randomostnu.value);//一次想点的学生人数，字符串转换成数字；
  int counto=1;
  var flago=1;
    while(counto<=randomstnuo){
      int currentnumo=new math.Random().nextInt(20);
       flago=1;
      if(currentnumo<20){              //转为偶数
           if(currentnumo%2==0)randomonumber[counto]=currentnumo+1;
           else randomonumber[counto]=currentnumo;
         }
       else randomonumber[counto]=currentnumo;

        for(int i=1;i<=randomstnuo;i++) {
          if(currentnumo==randomonumber[i]){
          flago=2;
         break;}
         }
        if(flago==1){
        // randomonumber[counto]=currentnumo;
         randomonunow=currentnumo.toString();
         HttpRequest.request(url, method: 'POST', sendData:randomonunow)
         .then((HttpRequest resp) {
          //querySelector('#test').text =resp.responseText;
           var newnamelist=new LIElement();
            newnamelist.text=resp.responseText;
            ostudentlist.children.add(newnamelist);//将点到的学生名单用列表表示出来;
            newnamelist.onClick.listen((e)=>newnamelist.remove());
           });
            counto++;
         }  
     } 
}//随机点名偶数部分,直接连接数据库

Future maketeamPostRequest(Event e) async { 
  String url = 'http://localhost:90/data/makeTeam';
  var randomnumber1= new List<int>();//存随机点名的学号后两位；
   randomnumber1.addAll([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
  String teamstudent;//将学号后两位转换为字符串；
  InputElement teamnu = querySelector('#teamnu input');
  teamnu1=int.parse(teamnu.value);//每组需要的人数，将字符串转换成数字；
  if(20 % teamnu1==0){
  int count=1;
  var flag=1;
    while(count<20){
      int currentnum=new math.Random().nextInt(20);
      flag=1;
      for(int i=1;i<20;i++)
      {
      if(currentnum==randomnumber1[i]){
         flag=2;
         break;}
      }
    if(flag==1){
      randomnumber1[count]=currentnum;
      teamstudent=currentnum.toString();
        HttpRequest.request(url, method: 'POST', sendData:teamstudent)
       .then((HttpRequest resp) {
     studentlist1.add(resp.responseText);//将点到的学生名单用列表表示出来;
     querySelector("#namelist1").appendHtml('<li>' + resp.responseText + '</li>');
       });
      count++;
   }  
  }
    //执行随堂分组
  }
 else {
 querySelector('#test2').text ="无法分成均匀的小组，请重新输入小组的人数"; //当不能分成均匀小组时
    }
}//随机分组部分,直接连接数据库

Future classmakePostRequest(Event e) async {
    String url = 'http://localhost:90/data/newclass'; 
    String newclass1=newclass.value;
    var newclass2 = new LIElement();
    newclass2.text = newclass.value;
    newclasses.children.add(newclass2); 
   HttpRequest.request(url, method: 'POST', sendData:newclass1)
       .then((HttpRequest resp) {
       });
     }//新增课程部分的连接数据库

void StartLoginButton(MouseEvent event){      //点击开始登陆
    document.getElementById("login").style.display='block';
}

void LoginButton(MouseEvent event){             //点击跳转到选课
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='block';
    cd.style.display='none';
    de.style.display='none';
    click.style.display='none';
    wait.style.display='none';
    document.getElementById("onlyrandompage").style.display='none';
    document.getElementById("kuang").style.display='none';     
}

void LoginagainButton(MouseEvent event){              //重新登陆
    document.getElementById("loginagainbutton").style.display='none';
    document.getElementById("failurelogin").style.display='none';
    document.getElementById("userid").style.display='block';
    document.getElementById("userpassword").style.display='block';
    bef.style.display='block';
    click.style.display='none';
    wait.style.display='none';
    document.getElementById("onlyrandompage").style.display='none';
    document.getElementById("kuang").style.display='none';    
}

void ClassokButton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='block';
    de.style.display='none';
    click.style.display='none';
    rdm.style.display='none';
    wait.style.display='none';
    document.getElementById("onlyrandompage").style.display='none';
    document.getElementById("kuang").style.display='none';       
}

void RandomclassButton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='none';
    de.style.display='block';
   click.style.display='none';
   wait.style.display='none';
   document.getElementById("classplan").style.display='none';
   document.getElementById("onlesson-st").style.display='none';
    document.getElementById("onlyrandompage").style.display='block';
    document.getElementById("kuang").style.display='block';   
}

void onlyrandomButton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='none';
    de.style.display='block';
    click.style.display='none';
    rdm.style.display='none';
    wait.style.display='none';
    document.getElementById("onlyrandompage").style.display='none';
    document.getElementById("onlesson-st").style.display='block';
    document.getElementById("classplan").style.display='block';
    document.getElementById("kuang").style.display='none';   
}

void onlyclickButton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='none';
    de.style.display='none';
   rdm.style.display='none';
   click.style.display='block';
   wait.style.display='none';
    document.getElementById("onlyrandompage").style.display='none';
    document.getElementById("kuang").style.display='none';     
}

void advicewaitbutton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='none';
    de.style.display='none';
   rdm.style.display='none';
   click.style.display='none';
   wait.style.display='block';
    document.getElementById("onlyrandompage").style.display='none';
    document.getElementById("kuang").style.display='none';     
}

void helpwaitbutton(MouseEvent event){
    ab.style.display='none';
    abb.style.display='block';
    bc.style.display='none';
    cd.style.display='none';
    de.style.display='none';
    rdm.style.display='none';
    click.style.display='none';
    wait.style.display='block';
    document.getElementById("onlyrandompage").style.display='none';
    document.getElementById("kuang").style.display='none';  

}

 void deleteelemnt(Event event)
 {
   UListElement studentlist;
   studentlist=querySelector("#namelist");
  studentlist.children.clear(); 
 }


