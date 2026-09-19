void CountEvenNumbers(List<int> numbers){
  int count = 0;
  int i;
  for (i in numbers){
    if (i % 2 == 0){count ++;
}}
  print("Number of even nums $count");


}
void main(){
  List<int> nums = [2,4,6];
  CountEvenNumbers(nums);
}