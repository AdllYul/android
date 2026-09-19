import 'dart:math';

void MultTable(){
  for( int i = 1; i <= 10;i++){
    for(int j = 1; j <= 10;j++){
      print("$i x $j = ${i*j}");
    }
  }
}
void getNextDay(int day, int month, int year){
  int maxDays = 31;
  if (month == 4 || month == 6 || month == 9 || month == 11){
    maxDays = 30;
  }else if (month == 2){
    bool isLeap = (year % 400 == 0) ||  (year % 4 == 0 && year % 100 != 0);
    maxDays = isLeap ? 29 : 28;
  }
  if (month < 1 || month > 12 || day < 1 || day > maxDays){
    print("$day.$month.$year -> invalid date");
    return;
  }
  day ++;
  if (day > maxDays){
    day = 1;
    month++;
    if (month > 12){
      month = 1;
      year++;
    }
  }
  print("Next day: $day.$month.$year");
}






void main(){
  MultTable();
  getNextDay(28, 2, 2024);
  getNextDay(29, 2, 2026);
  getNextDay(30, 2, 2026);
  getNextDay(31, 12, 2025);
}