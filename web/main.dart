import 'dart:html';
import 'dart:math' show Random;

LIElement list;
ButtonElement deleteAll;
String studentname;
//dd
List nameList = ["10154507101","10154507102","10154507103","10154507104",
"10154507107","10154507109","10154507110","10154507112",
"10154507113","10154507114","10154507117","10154507121","10154507123",
"10154507124","10154507127","10154507132","10154507134","10154507138",
"韩庆慧","谢函","宋金阳","李佳璇","谢琪","杨芙蓉","荆泽宇","黄大龙","李敏",
"刘冠群","林凌","彭茂源","张思宁","崔红洋","汤夏颖","苏颖晞","姜宇轩","于潇雪"];


void main()
{ 
  querySelector("#clickButton").onClick.listen(onBtnClicked);
  list = querySelector('#list');
  list.onChange.listen(addlistitem);
  deleteAll= querySelector('#delete-all'); 
  deleteAll.onClick.listen(deleteAllElements);

}

void onBtnClicked(Event e)
{
  Random select_number = new Random();
  int number = select_number.nextInt(18);
  querySelector("#select-name").text = nameList[number];
  querySelector("#select-id").text = nameList[number+18];
  studentname=nameList[number+18];
  addlistitem(e);
}



void addlistitem(Event e)
{
  var newName = new LIElement();
  newName.text = studentname;
  list.children.add(newName);
}

void deleteAllElements(Event e) {
  list.children.clear();
}