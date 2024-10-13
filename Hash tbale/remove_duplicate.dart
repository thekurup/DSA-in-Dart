List<T>duplicate<T>(List<T>x){

  Set<T>unique=Set<T>.from(x);

  return unique.toList();
}

void main(){
  List<int>x=[2,4,6,2,6,1];

  var result = duplicate(x);

  print("list after removing duplicate");

  print(result);

}