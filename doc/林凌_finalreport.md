# 说明
> 关于文档的说明：各位必须使用markdown来进行文档描述，文档规范性也是考虑的要素之一，这个文件放到们项目的doc文件夹中，每个人的报告命名为 姓名_学号.md。
> 你可以按照如下图示获取此文档的markdown源文件。
> **请在2017-1-12 17:00之前交纸质签字版（办公室文科大楼729）**。
  
![template source](https://cloud.githubusercontent.com/assets/1710178/21607358/8845c01c-d1f0-11e6-8374-86abc8605756.png)
  
>以下开始正文......
# 产品创意
>你们需要在这里描述你们的产品创意的过程，包括你们的灵感来源，针对什么人群来设计这个产品，你们设计了哪些功能？一开始做的原型的样子（需要附图，要用markdown插入你的图片，关于图片可以在github中使用修改此文档的方式直接上传）  
>你在创意阶段所做的贡献是什么？
>*此部分每组同学之间可以有相同的内容*，总字数不能少于1000字。  

## 创意
> 在计算机类课堂上，特别是在上课学生较多的情况下，教师不能快速确定学生的出勤率，出勤状况的统计较为耗时且麻烦。课堂上学生们大多都是一边听讲，一边看着自己的电脑，师生之间的互动较少。因而，导致在教师需要学生回答问题的时候，总是没有学生愿意主动回答，不利于塑造良好的课堂氛围。长此以往地缺乏学生及时反馈，会使教师在上课时忘记要提的问题，也可能造成对于重难点等教学安排出现偏差。此外，在学生回答问题后，由于缺乏便捷的工具对学生课堂表现进行记录与统计，不利于教师进行更有针对性的教学，不利于学生个性化发展。  
> 根据以上的现象及问题，我们设计出一款以课堂点名为主要功能，以签到、记录等功能为辅的课堂点名应用小程序，以促进课堂师生间的互动交流，同时有效记录课堂上师生间的活动情况。

>**创意阶段的个人贡献**   
>在创意阶段，我主要负责在小组交流中提供想法。

## 需求
>**针对人群**     
>计算机相关课程的教学教师和学生

>**主要功能简述**   
>1.签到。在课程开始前，学生到教师的电脑前进行人脸识别或者点击按钮进行签到。    
>目的：使教师快速得知课堂出勤率、未出勤学生等信息。    
>2.点名。通过随机点名、条件点名（即奇数点名和偶数点名）两种方法，对所有课上同学进行点名。    
>目的：解决课堂上教师易陷入无人主动回答的窘境，使点名充满趣味性。   
>3.记录。教师可以在课前添加课程、记录本节课需要进行提问的内容和相关课程安排。在课堂进行过程中，可以记录师生互动情况，如点名情况、回答问题情况等。  
>目的：时刻提醒教师本节课的教学安排，以便教师按照课堂情况进行合理安排和调整。同时，解决难以实时记录回答问题的学生信息和表现情况的问题。


>**网站原型与设计构思**    
>考虑到我们的网站针对计算机相关课程的教学教师，因此我们采用较为简约直观的设计风格。


## 设计的功能列表以及其完成情况

 设计的功能|承担该功能的组员|任务完成度
 --|--|--
  登陆|刘冠群|完成度100%
  选择课程|林凌|完成度100%
  增减课堂提问|汤夏颖|完成度100%
  增加课程|刘冠群|完成度100%
  进行教学安排|汤夏颖|完成度100%
  查看课程概况与学生信息|刘冠群|完成度100%
  奇偶数点名|林凌|完成度100%
  随机点名|刘冠群|完成度100%
  重置点名|林凌|完成度100%  
  座位签到|刘冠群|完成度95%
  学生分组|刘冠群、林凌|完成度70%  
  实时传输|汤夏颖|完成度70%
  刷脸摄像|汤夏颖、刘冠群|完成度20%


# 产品技术方案
> 经过前期的需求分析以及功能构思后，我们组的完成计划首先是根据已有的原型页面来搭建页面：
主要使用HTML和CSS来进行前端页面搭建。由于我们的产品是划分为几个页面的，因此写HTML时，我们进行div命名以区分不同的页面，然后在大的div中编写具体的部分，如按钮（button），图像（img），输入文本框（input），表格（table）等。而div中元素在页面的显示还需要编写CSS语言来进行进一步的界面搭建，表现为每个元素的位置，文字，颜色，背景图和滚动条等方面的确定。另外，页面之间的跳转也是通过div的显示与隐藏来实现，主要是根据按钮点击后，dart文件中读取到HTML里的元素，进而再进行div的CSS显示与隐藏状态的改变。比如，在登陆成功与失败界面的转化时，在dart中登陆成功及失败的条件下，改变图形及按钮的显现（block）及隐藏（none），以进一步实现功能。另外，在实现整个页面或者是某些div的滚动条时，除了加上必要的滚动条件（overflow-y:scroll）外，还应注意页面中每个div的position状态，应为absolution而非fixed。

>奇偶数条件点名：
在已有的随机点名的基础上（根据URL与数据库中对应的数据进行连接，以在dart中出现的随机数来达到提取数据库中的学生学号的目的，同时对点名次数进行条件约束，进而实现每次点一定数量的人数功能。），在随机数进入下一步骤前的数据转换前增加对随机数的条件约束，并将其加一或者减一，进而改变为奇数或者偶数。

>点名列表清除：
包含列表里所有内容都清除以及个别点名信息点击清除。主要是通过querySelector的事件监听功能,将HTML的按钮元素和dart里具体按钮事件联系起来；以及事件点击功能(studentlist.children.clear() ),点击被点名列表中的子信息，然后实现点击逐个清除的功能。

# 我在小组中的分工
>你在小组中主要负责那部分工作，如果小组其他成员相比，你感觉你完成的怎么样？你觉得你组那个组员完成的最好，工作量最大？如果按10分计算，
你给每个人（包括自己）各多少分，填写下表：
  
   组员|分数
  汤夏颖|9
  刘冠群|9
  林凌|9

# 我的编程实践活动
## 我的代码
>采用markdown 中代码标记来粘贴你完成的那些代码。  比如：
  
  
 ```dart 
///主函数

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
  querySelector('#ramdomJ').onClick.listen(randomPostRequestJ);//随机奇数点名事件
  querySelector('#ramdomO').onClick.listen(randomPostRequestO);//随机偶数点名事件


///奇数点名
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

///偶数点名
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

///页面跳转
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

///删除点名列表事件
 void deleteelemnt(Event event)
 {
   UListElement studentlist;
   studentlist=querySelector("#namelist");
  studentlist.children.clear(); 
 }


///HTML页面搭建

<div id=startpage >
        <div id="topbar"> 
          <p id="bg"><image src="images/bg.png" width=1440 height=808></image></p>
          <p id="logo"><image src="images/logo.png" width=172 height=65></image></p>
          <p id="loginbutton" type="button" ><image src="images/login.png" width=61.8 height=34.2></image></p>
          <p id="registerbutton" type="button"><image src="images/register.png" width=97.2 height=34.2></image></p>
         </div>
         <div id=login style="display:none">
            <p id="loginbg"><image src="images/loginbg.png" width=241 height=387></image></p>
            <div id="startloginbutton" type="button" style="display:none">
              <image src="images/start.png" width=180 height=60></image>
            </div>          

            <div id="loginagainbutton" type="button" style="display:none">
              <image src="images/loginagain.png" width=120 height=40></image>
            </div>     

            <div id="successlogin" style="display:none">
                <image src="images/successlogin.png" width=241 height=387></image>
            </div>

            <div id="failurelogin" style="display:none">
               <image src="images/failurelogin.png" width=241 height=387></image>
            </div>

         <div id=loginbe style="display:block">
           <p id="userid"><input type="text" name="userid"style="width:150px; height:18px;"><br></p>
           <p id="userpassword"><input type="password" name="userpassword"style="width:150px; height:18px;"></p>
           <p id="useridlog"><image src="images/user.png" width=25 height=25></image></p>
           <p id="password"><image src="images/password.png" width=22.5 height=28></image></p>
           <p id="signup"><image src="images/signup.png" width=149 height=46.2></image></p>
          </div>
         </div>
</div>


<div id="sidebar" style="display:none">
  <p id="userphoto"><image src="images/photo.png" width=43 height=43></image></p>
  <p id="usernameshow"style="font-family:arial;color:white;font-size:14px;">姓名：游客</p>
  <p id="useridshow"style="font-family:arial;color:white;font-size:14px;">学号：00000000</p>
  <p id="startcall" type="button" a href="" class="avatar"><image src="images/startcall.png" width=171 height=59.4></image></p>

  <p id="myclass" type="button" a href="" class="avatar"><image src="images/我的课程.png" width=106 height=20></image></p>
  <p id="randomclass" type="button" a href="" class="avatar" ><image src="images/随机点名.png" width=106 height=20></image></p>
  <p id="recordclass" type="button" a href="" class="avatar"><image src="images/课堂记录.png" width=106 height=20></image></p>
  <p id="help" type="button" a href="" class="avatar"><image src="images/使用帮助.png" width=106 height=22></image></p>
  <p id="advice" type="button" a href="" class="avatar"><image src="images/意见反馈.png" width=106 height=15></image></p>
</div>
<div id=choosepage style="display:none">
       <div id="topbarinside">
          <br>
          <p id="xiaotip"style="font-family:arial;color:black;font-size:14px;">您还没有选择课程，请现在下方勾选参加的课程</p>
         </div>
         <div id="classchoosing">
          <p id=subtitle>选择课程</p>
         <div class="img">
          <a target="_blank">
          <img src="images/lessonphoto1.png" alt="Ballade" width="225" height="130">
          </a>
         <div class="desc"><input type="checkbox" name="classid" >web网络教育应用</div>
         </div>
        
         <div class="img">
           <a target="_blank" >
            <img src="images/lessonphoto2.png" alt="Ballade" width="225" height="130">
           </a>
           <div class="desc"><input type="checkbox" name="classid" >虚拟现实</div>
         </div>
        
         <div class="img">
           <a target="_blank" >
            <img src="images/lessonphoto3.png" alt="Ballade" width="225" height="130">
           </a>
           <div class="desc"><input type="checkbox" name="classid" >英语听说（高级）</div>
         </div>
        
         <div class="img">
           <a target="_blank" >
            <img src="images/lessonphoto4.png" alt="Ballade" width="225" height="130">
           </a>
           <div class="desc"><input type="checkbox" name="classid">教育学</div>
         </div>
        
         <p id="classok" a href="" class="avatar"><image src="images/确认.png" width=70 height=35></image></p>
         <p id="classcancel" a href="" class="avatar"><image src="images/取消.png" width=70 height=35></image></p>
        </div>
</div>

<div id="onlyrandompage" style="display:none">
    <p type="button"  id="ramdomD"><image src="images/suiji.png" width=121 height=56></image></p>
    <p type="button"  id="ramdomJ"><image src="images/jishu.png" width=121 height=56></image></p>
    <p type="button"  id="ramdomO"><image src="images/oushu.png" width=121 height=56></image></p>
    <p id="randomst"><input type="text" size=150 style="width:400px; height:18px;"placeholder=输入你一次想点的人数>
      <br></p>
    <div id="namelistt"><ul id="namelist"></ul></div>
</div>

///css部分

#sidebar {
  line-height:30px;
  background-color:#393857;
  height:1000px;
  width:200px;
  float:left;
  position: fixed;
  margin-right:30px;
  margin-bottom:30px;
  text-align:center;
}

#topbar {
  background-color:#393857;
  height:80px;
  width:1440px; 
  position: absolute;
}

#bg{
  margin-top:80px; 
  position:absolute;
}

#logo{
  position: absolute;
  top: 5px;
  left: 25px;
}
#loginbutton{
  position: absolute;
  left: 1140px;
  top: 12px;
}
#registerbutton{
  position: absolute;
  left: 1220px;
  top: 12px;

}
#startloginbutton{
  position:absolute;
  left: 630px;
  top: 400px;
  z-index:5;
}

#loginagainbutton{
  position:absolute;
  left: 665px;
  top: 400px;
  z-index:5;
}

#loginbg{
  position: absolute;
  left: 600px;
  top: 100px;
  z-index:1;
}

#successlogin{
  position: absolute;;
  left: 600px;
  top: 100px;
  z-index:3;
}

#failurelogin{
  position:absolute;
  left: 600px;
  top: 100px;
  z-index: 3;
}

#topbarinside{
  float:left;
  position: absolute;
  background-color:#ffffff;
  height:80px;
  width:1240px;  
  margin-left:200px;    
  margin-bottom:30px;
  padding-left:50px;
  z-index: 8;
}


#useridlog{
  position:absolute;
  left: 625px;
  top: 270px;
  z-index:2;
}
#password{
  position:absolute;
  left: 625px;
  top: 320px;
  z-index:2;
}
#userid{
  position:absolute;
  left: 670px;
  top: 265px;
  z-index:2;
}
#userpassword{
  position:absolute;
  left: 670px;
  top: 320px;
  z-index:2;
}
#signup{
  position:absolute;
  left: 645px;
  top: 420px;
  z-index:2;
}

#userphoto{
  position:absolute;
  left:15px;
  top: 35px;
}
#usernameshow{
  position:absolute;
  left: 70px;
  top: 30px;
}
#useridshow{
  position:absolute;
  left: 70px;
  top: 55px;
}
#startcall{
  position:absolute;
  left: 15px;
  top: 110px;
}
#myclass{
  text-align:center;
  left: 0px;
  margin-top: 217px;
}
#randomclass{
  text-align:center;
  left: 0px;
  margin-top: 30px;
}
#recordclass{
  text-align:center;
  left: 0px;
  margin-top: 30px;
}
#help{
  text-align:center;
  left: 0px;
  margin-top: 30px;
}
#advice{
  text-align:center;
  left: 0px;
  margin-top: 30px;

}

#classchoosed {
  float:left;
  position: absolute;
  background-color:white; 
  height:700px;
  width:420px;
  margin-top:110px;
  margin-left: 230px;
  margin-bottom:30px;
  box-shadow:5px 5px 5px rgba(119,151,178,0.36);
}

#classcancel{
  float:right;
  position:absolute;
  margin-left:950px;
  margin-top:410px;    
  padding-left:30px;
}
#classok{
  float:right;
  position:absolute;
  margin-left:850px;
  margin-top:410px;    
  padding-left:30px;
}

#dian{
  width:90px;
  height:30px;
  left: 300px;
  top: 110px;
 }
 
 #randomst{
  position: fixed;
  height: 30px;
  left: 410px;
  top: 110px;
  z-index: 7;
 }

 #classinput{
  left: 800px;
  width:450px;
  height:30px;
 }

 #ramdomD{
  position: fixed;
  left: 400px;
  top: 140px;
  z-index: 9;
}

#ramdomJ{
  position: fixed;
  left: 550px;
  top: 140px;
  z-index: 9;
}

#ramdomO{
  position: fixed;
  left: 700px;
  top: 140px;
  z-index: 9;
}

 #onlyrandompage{
  position:  fixed;
  color: #030000;
  left: 300px;
  top: 160px;
  z-index: 7;
 }

 #onlyclubpage{
   position:  fixed;
   color: #020000;
   left: 300px;
   top: 110px;
   z-index: 7;
  }
 #clubrandompage{
   position: fixed;
   color: #050000;
   left: 300px;
   top: 70px;
   z-index: 7;
 }
 #logo2{
   position: fixed;
   left: 950px;
   top: 92px;
   z-index: 11;
 }
 #namelistt{
  position: fixed;
  background-color:#EEEBEB;
  height:400px;
  width:900px;  
  left: 350px;
  top: 180px;
  margin-top:25px;
  overflow-y:scroll; 
 }

 #questinput{
  height:30px;
  width:600px;  
 }
 #taskinput{
  height:30px;
  width:230px;  
 }
 #kuang{
   position: fixed;
   width:1100px;
   height: 700px;
   left: 200px;
   top: 100px;
   z-index: -1;
   background-color: rgb(249, 249, 250);
  }
  #subtitle-info{
    line-height: 30px;
  }

  #delete{
    position: fixed;
    left: 750px;
    top: 540px;
    z-index: 9;
  }

```
  
## 我的活动量化
> 活动量化数据
>  **林凌/10154507117/9 commits / 397 ++ / 98 --/1 issues/**  

## 我的issue活动
>在issue上提过一个问题，并接收到组员的回答；另外，我们组大多数讨论都是通过QQ群进行讨论，更加方便一些。

# 我的自评
> 请你对自己的工作进行自评：大多数工作完成度较高，总体上是满意的。
> 如果用**一整天8小时**时间计算，你有信心再用多少天完成你未目前完成的功能？     

