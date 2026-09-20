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
void countVowels( String text){
  String vowels = "aeiouAEIOU";
  int count = 0;

  for (int i = 0;i < text.length; i++){
    if (vowels.contains(text[i])){
    count ++;
  }
}
print('"$text" -> $count');
}
void FindMaxMin(List<int> numbers){
  int min = numbers[0];
  int max = numbers[0];
  for (int i = 0; i < numbers.length; i ++){
    if(numbers[i] > max){
      max = numbers[i];
    }
    else if (numbers[i] < min){
      min = numbers[i];
    }
  }
  print("Max: $max Min: $min");
}
void PrimeChecker(int n){
  bool isPrime = true;
  if (n % 2 == 0 && n != 2){
    isPrime = false;
  }
  else if (n % 3 == 0 && n != 3 ){
    isPrime = false;
  }
  else if (n % 5 == 0 && n!=5){
    isPrime = false;
  }else if (n % 7 == 0 && n != 7){
    isPrime = false;
  }
  else{
    isPrime = true;
  }
  if (isPrime){
    print("$n is prime");
  }
  else{
    print("$n is not prime");
  }
}





void main(){
  MultTable();
  getNextDay(28, 2, 2024);
  getNextDay(29, 2, 2026);
  getNextDay(30, 2, 2026);
  getNextDay(31, 12, 2025);
countVowels("flutter mobile development");
countVowels("Bekzat");
FindMaxMin([14, 88, 3, 42, 99, 12, 67]);
FindMaxMin([234, 34, 123, 44, 949, 112, 67]);
PrimeChecker(2);
}