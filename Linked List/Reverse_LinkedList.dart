// Define a class for LinkedList node
class Node {
  int data;
  Node? next;
  
  Node(this.data);
}

// Function to reverse the linked list
Node? reverseLinkedList(Node? head) {
  Node? prev = null;
  Node? current = head;
  Node? next = null;
  
  while (current != null) {
    // Store next
    next = current.next;
    
    // Reverse current node's pointer
    current.next = prev;
    
    // Move pointers one position ahead
    prev = current;
    current = next;
  }
  
  return prev;
}

// Helper function to print the linked list
void printList(Node? head) {
  var current = head;
  while (current != null) {
    print(current.data);
    current = current.next;
  }
}

void main() {
  // Create a sample linked list: 1 -> 2 -> 3 -> 4 -> 5
  var head = Node(1);
  head.next = Node(2);
  head.next!.next = Node(3);
  head.next!.next!.next = Node(4);
  head.next!.next!.next!.next = Node(5);
  
  print("Original list:");
  printList(head);
  
  head = reverseLinkedList(head)!;
  
  print("\nReversed list:");
  printList(head);
}