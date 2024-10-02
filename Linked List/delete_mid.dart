// Define a class for LinkedList node
class Node {
  int data;
  Node? next;
  
  Node(this.data);

  //   This creates a blueprint (class) for each piece of our list (Node).
// Each Node has two things: a number (data) and a pointer to the next Node (next).
// The '?' after Node means the next piece can be empty (null).
// Node(this.data); is a short way to create a new Node with a given number.
}

// Function to delete the middle element of the linked list
Node? deleteMiddle(Node? head) {
  // This function will remove the middle element from our list.
  // If list is empty or has only one element
  if (head == null || head.next == null) {
    return null;
  //  If the list is empty or has only one element, we return null.
  }
  
  // If list has only two elements
  if (head.next!.next == null) {
    head.next = null;
    return head;
// If the list has only two elements, we remove the second one and return the first.
  }
  
  Node? slow = head;
  Node? fast = head;
  Node? prev = null;
  
  // Find the middle element
  while (fast != null && fast.next != null) {
    fast = fast.next!.next;
    prev = slow;
    slow = slow!.next;

    //   We use the "tortoise and hare" approach to find the middle.
// 'slow' moves one step at a time, 'fast' moves two steps.
// When 'fast' reaches the end, 'slow' will be at the middle.
// 'prev' keeps track of the node before 'slow'.
  }
  
  // Delete the middle element
  prev!.next = slow!.next;

  // We make the node before the middle point to the node 
  // after the middle, effectively removing the middle node.
  
  return head;

}

// Helper function to print the linked list
void printList(Node? head) {
  Node? current = head;
  while (current != null) {
    print(current.data);
    current = current.next;
  }
  // We create a sample list, print it, delete the middle, and print the result.
}

// Helper function to create a linked list from a list of integers
Node? createLinkedList(List<int> values) {
  // Function to create a Linked List
  if (values.isEmpty) return null;
  // If we're given an empty list, we return nothing (null).
  
  Node head = Node(values[0]);
  Node current = head;

//   We make the first number in our list the head (start) of our linked list.
// We also keep track of where we are with current, consode current is a 
// ticket checker who check each boggy has ticket(data) ot not
// using next current go to another boggy , consider next is a bridge in train that connect each boogy.
  
  for (int i = 1; i < values.length; i++) {
    current.next = Node(values[i]);
    current = current.next!;
  }
//   We go through each remaining posiion in our list.
//  in here using for loop we just adding data to each node in the list 
  
  return head;
}

void main() {
  // Create a sample linked list: 1 -> 2 -> 3 -> 4 -> 5
  
  var head = createLinkedList([1, 2, 3, 4, 5]);

//   This is like saying: "Please make me a linked list with the numbers 1, 2, 3, 4, and 5."
// The function does all the work of creating Nodes and connecting them.
// When it's done, head will be the start of a linked list that looks like: 1 -> 2 -> 3 -> 4 -> 5
  
  print("Original list:");
  printList(head);
  
  head = deleteMiddle(head);
  
  print("\nList after deleting middle element:");
  printList(head);

  // We print the original list.
// Then we remove mid element .
// Finally, we print the list again to see the result.
}