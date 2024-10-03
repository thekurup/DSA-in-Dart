class Node{
  int data;
  Node? next;
  Node(this.data);
}

Node? delete(Node?head){
  if(head==null || head.next==null) return null;
// This line checks two things:

// If the list is empty (head == null), or
// If the list has only one node (head.next == null)

// In either case, we return null because:

// An empty list remains empty after trying to delete its last element.
// A list with one element becomes empty after deleting its last (and only) element.

  Node current= head;

//   We create a new variable called current.
// We set it to point to the first node (head) of our list.
// Think of current as a finger pointing to a node in our list. We'll move this finger along the list

  while(current.next!.next!=null){
    //     This starts a loop that will run as long as there are at least two more nodes ahead of current.
// current.next! is the next node after current.
// current.next!.next is the node after that.
// If this is not null, it means we're not at the second-to-last node yet.

    current=current.next!;

// This moves our current pointer (our finger) to the next node in the list.
// We keep doing this until current is pointing at the second-to-last node.
  }
  current.next=null;

//   Now that current is pointing to the second-to-last node, we set its next to null.
// This effectively removes the last node from our list, as nothing is pointing to it anymore.

  return head;

//   We return the head of our list.
// Even though we modified the end of the list, the head (start) of the list is still the same node.

}

void printl(Node?head){

  var current = head;

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

  Node current = head;

  for(int i=1; i<x.length; i++){
    current.next=Node(x[i]);

    current =current.next!;
  }
  return head;
}

void main(){
  var number = List.generate(5, (index) => index+1,);
  var head= create(number);

  print("orginal list");

  printl(head);

  print (" list after removing last node ");
  head=delete(head);

  printl(head);
}