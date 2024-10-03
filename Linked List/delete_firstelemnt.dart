class Node{
  int data;
  Node? next;
  Node(this.data);
}

Node? delete(Node?head){
  // comparing to delete mid elemnt only this function only diffrent
  // rest all code are same as the mid
  if(head==null ){
    return null;

//    This line checks if the list is empty (head is null).
// If the list is empty, we can't delete anything, so we just return null.
// It's like trying to remove the first person from an empty room - there's no one to remove!

  }
  return head.next;
  
//   If we've reached this line, we know the list isn't empty.
// head.next is the second node in the list (or null if there was only one node).
// By returning head.next, we're making the second node (if it exists) the new start of the list.
// The original first node is no longer reference
}

void  printL(Node? head){

  Node? current = head;

  while(current!= null){
    print(current.data);
    current = current.next;
  }
}

Node? create(List<int>x){
  if(x.isEmpty){
    return null;
  }
  Node head = Node(x[0]);
  Node current=head;

  for(int i=1; i<x.length; i++){
    current.next=Node(x[i]);
    current=current.next!;
  }
  return head;
}

void main(){
  var number = List.generate(5, (index) => index+1,);

  var head=create(number);

  print("orginal list");
  printL(head);

  print("after removing first lobby ");
  head=delete(head);
  printL(head);
}