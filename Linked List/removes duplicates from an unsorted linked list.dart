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

// Function to remove duplicates from the linked list
void removeDuplicates(Node? head) {
  if (head == null) return;

//   This is a function that removes duplicate numbers from our list.
// It starts at the beginning of the list (head).
// If the list is empty (null), it does nothing and stops.
  
  var current = head;
  Set<int> seen = {}; // Use a Set to keep track of seen values
  
  seen.add(current.data);

//   current is like a finger pointing to the current Node we're looking at.
// seen is a special container (Set) that remembers unique numbers we've seen.
// We add the first number to our 'seen' container.
  
  while (current.next != null) {
    if (seen.contains(current.next!.data)) {
      // If we've seen this value before, skip it
      current.next = current.next!.next;
    } else {
      // If it's a new value, add it to the set and move to the next node
      seen.add(current.next!.data);
      current = current.next!;
    }
  }
//   This loop keeps going until we reach the end of the list.
// For each number, we check if we've seen it before:

// If yes, we skip it by connecting the current Node to the one after next.
// If no, we add it to our 'seen' container and move to the next Node.
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
  // Create a sample linked list: 1 -> 2 -> 3 -> 2 -> 1 -> 4
  var head = Node(1);
  head.next = Node(2);
  head.next!.next = Node(3);
  head.next!.next!.next = Node(2);
  head.next!.next!.next!.next = Node(1);
  head.next!.next!.next!.next!.next = Node(4);
//   This is where our program starts.
// We create a list with numbers: 1, 2, 3, 2, 1, 4.
// Each head.next connects one Node to the next.
  
  print("Original list:");
  printList(head);
  
  removeDuplicates(head);
  
  print("\nList after removing duplicates:");
  printList(head);

//   We print the original list.
// Then we remove duplicates.
// Finally, we print the list again to see the result.
}