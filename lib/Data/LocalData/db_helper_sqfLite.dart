void main(){


  // int result =add(20, 40);
  // String Chekced=Even(6);

  List numbers=[10,20,30,40,];
  List names=["raees","fahad","faisal"];

  numbers.addAll(names);
  names.addAll(numbers);
  print(numbers);
  print(names);






}





int add(int a,int b) {
  int sum = a + b;
  print(sum);
  return sum;
}


String Even(int number) {
  if (number % 2 == 0) {
    print(number);

    return "Even number";
  } else{
    return "Odd number";}
}


void namePrint(String name){
  print(name);

}
