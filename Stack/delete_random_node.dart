class Stack<T>{
  final List<T>book=[];
  void push(T i) {
    book.add(i);
  }
  T pop() => book.removeLast();
  bool get isEmpty=>book.isEmpty;
  int get length=>book.length;

  @override
  String toString() =>book.toString();
}

void teacher(Stack book,int k){
  if(book.isEmpty){
    return ;
  }

  student (book,k,book.length);
}

void student(Stack book,int k,int count){

  if(count==0){
    return ;
  }

  int elon = book.pop();

  student(book,k,count-1);

  if(elon!=k){
    book.push(elon);
  }


}

Stack create(List<int>book){

  Stack box =Stack();

  for(int i in book){

    box.push(i);
  }
  return box;
}

void main(){

  var number= List.generate(5, (index) => index+1,).reversed.toList();

  var result= create(number);

  print("orginal list");

  print(result);

  teacher(result, 3);

  print("removing aprticular roll no book");

  print(result);
}

