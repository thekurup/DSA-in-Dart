// Define a class for LinkedList node
class Node {
  int data;
  Node? next;
  
  Node(this.data);

//   This is like a blueprint for each piece of our list (Node).
// Each Node has a number (data) and a pointer to the next Node (next).
// The '?' after Node means the next piece can be empty (null).
// Node(this.data); is a quick way to create a new Node with a given number.

}

// Function to reverse the linked list
Node? reverseLinkedList(Node? head) {
  var  prev = null;
  var current = head;
  Node? next = null;

//   This function will flip our list backwards.
// We set up three helpers: 'prev' (previous), 'current', and 'next'.
// We start with 'prev' as null (because there's nothing before the first node).
// 'current' starts at the beginning of our list.
  
  while (current != null) {
    // Store next
    next = current.next;
    
    // Reverse current node's pointer
    current.next = prev;
    
    // Move pointers one position ahead
    prev = current;
    current = next;


//     This loop keeps going until we reach the end of the list.
// For each node, we do three things:

// Remember the next node.
// Make the current node point backwards to the previous one.
// Move all our helpers one step forward.
  }
  
  return prev;

  // At the end, 'prev' will be our new first node
  //  (what used to be the last), so we return it.
}

// Helper function to print the linked list
void printList(Node? head) {
  var current = head;
  while (current != null) {
    print(current.data);
    current = current.next;
  }
//   This function prints all numbers in our list.
// It starts at the beginning and keeps printing until it reaches the end.
}

void main() {
  // Create a sample linked list: 1 -> 2 -> 3 -> 4 -> 5
  var head = Node(1);
  head.next = Node(2);
  head.next!.next = Node(3);
  head.next!.next!.next = Node(4);
  head.next!.next!.next!.next = Node(5);

//   This is where our program starts.
// We create a list with numbers: 1, 2, 3, 4, 5.
// Each head.next connects one Node to the next.
  
  print("Original list:");
  printList(head);
  
  head = reverseLinkedList(head)!;
  
  print("\nReversed list:");
  printList(head);

//   We print the original list.
// Then we reverse the list.
// Finally, we print the reversed list to see the result.

}