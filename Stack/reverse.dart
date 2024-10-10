class Stack<T>{
  final List<T> x= [];
  void push(T i) {
      x.add(i);

  }

  T pop() =>x.removeLast();

  bool get isEmpty => x.isEmpty;

//   We create a simple Stack class using Dart's List.
// push adds an item to the top of the stack.
// pop removes and returns the top item from the stack.
// isEmpty checks if the stack is empty.
// We use generics (<T>) so our stack can work with any type.
}

String reverse(String input){
  // This function takes a string as input and returns the reversed string.

  var box=Stack<String>();


// We create a new stack name box to hold characters from string, cuz only in stack we can easy reverse it 
// thats why i create a box which is stack to hold every letter string in stack way.


  for( var i in input.split("")){
    box.push(i);
    // We loop through each character in the input string and push it onto the stack 
    // i eman putting each letter of string in stack box.
  }

  String result = "";

  // We create an empty string name "result" to hold our reversed result.

  while(!box.isEmpty){
    result+=box.pop();
    // We keep popping characters off the stack and adding them to our result
    //  string until the stack is empty.

    // See stack work on "LIFO" order thats is last in first out, 
    // ie why ipm nml string reverse chaiumbol string last letetr first vran pop villichal mthi
    // cuz pop epozm last enter chaitha values print chaith ann ponnth 

  }


  return result;

 
 

}

void main() {
  String original = "Hello, World!";
  String reversed = reverse(original);

  print("Original string: $original");
  print("Reversed string: $reversed");


//   We define our original string "Hello, World!".
// We call our reverse function and pass the orginal value as arguemnt .
// We print both the original and reversed strings.
}