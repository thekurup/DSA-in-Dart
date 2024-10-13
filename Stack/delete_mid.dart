class Stack<T> {
  final List<T>book=[];

  void push(T i) {
    book.add(i);
  }

  T pop()=>book.removeLast();

  bool get isEmpty=>book.isEmpty;

  int get length=>book.length;
  @override
  String toString()=>book.toString();
}

void teacher(Stack book){

  if(book.length<1){
    return;
  }

  int k=(book.length~/2)+1;
  // studentnod teacher pryuvann pathi book ollam correct chain edthond vran

  student(book,k);
}

void student(Stack book,int k){
  
  if(k==1){
    book.pop();
    return;
    
    // in first call if total book count is 5 , then k value is 3,
    // ie we saying from top 3 place, so first 3!=1 so k-1 and again 2!=1 so again k-1 and last k=1 so take that book
    // it is his book, and in above book we check is hold by elon and student  tell to put all that book back to this 
    // book list
  }

  int elon = book.pop();

  student(book,k-1);
  // k-1 means half of books teacher choich avn kond poi staffroomil
  // ivide one by one book ayi check chaith nokuvann from top, student book evideyannen
  // and ee check chaiunn book elon ann hold chaiunth thats why we writle elon = book.pop
  book.push(elon);
  // after finding book he needed aa elon kayill erikunna
  //  book elon therich list pole arrange chaith vaikm
}

Stack create(List<int>book){

  Stack box = Stack();

  for(int i in book){
    box.push(i);
  }
  return box;

}


void main() {
  // Create a sample stack: 5 -> 4 -> 3 -> 2 -> 1 (top)
  var numbers = List.generate(10, (index) => index + 1).reversed.toList();
  var output = create(numbers);

  print("Original stack:");
  print(output);

  teacher(output);

  print("\nStack after deleting middle element:");
  print(output);
}