// Copyright (c) 2017, meflyup. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math' as math;
UListElement studentlist;
String getname=" ";

void Click(MouseEvent event){          //鼠标点击进行随机点名
  var idnumber=new math.Random().nextInt(20);
  var studentname = new List<String>();
  var studentid=new List<String>();

  querySelector("#studentid").text='学号：  '+studentid[idnumber];
  querySelector("#name").text='姓名：'+studentname[idnumber];         //点击后显示学生学号和姓名
  getname=studentname[idnumber];
  addelemnt(event);             //点名后将名字储存在列表中
}

void DeleteButton(MouseEvent event){
   studentlist.children.clear(); 
}

void addelemnt(Event event)       //动态显示列表
 {  var newnamelist=new LIElement();
    newnamelist.text=getname;
    studentlist.children.add(newnamelist);
    newnamelist.onClick.listen((e)=>newnamelist.remove());
 }

void main() {

    studentlist=querySelector("#namelist");
    studentlist.onChange.listen(addelemnt);

    querySelector("#delete")//删除
   
   ..onClick.listen(DeleteButton);
}


