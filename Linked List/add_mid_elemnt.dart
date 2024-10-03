// Define a class for LinkedList node
class Node {
  int data;
  Node? next;
  
  Node(this.data);
}

// Function to create a linked list from a list of integers
Node? create(List<int> x) {
  if (x.isEmpty) {
    return null;
  }
  Node head = Node(x[0]);
  Node current = head;

  for (int i = 1; i < x.length; i++) {
    current.next = Node(x[i]);
    current = current.next!;
  }
  return head;
}

// Function to insert a new element in the middle of the linked list
Node? insertMiddle(Node? head, int newValue) {
  if (head == null) {
    return Node(newValue);
  }
  
  if (head.next == null) {
    head.next = Node(newValue);
    return head;
  }
  
  Node slow = head;
  Node? fast = head;
  
  while (fast != null && fast.next != null) {
    slow = slow.next!;
    fast = fast.next!.next;
  }
  
  Node newNode = Node(newValue);
  newNode.next = slow.next;
  slow.next = newNode;
  
  return head;
}

// Helper function to print the linked list
void printList(Node? head) {
  Node? current = head;
  while (current != null) {
    print(current.data);
    current = current.next;
  }
}

void main() {
  var numbers = List.generate(5, (index) => index + 1);
  var head = create(numbers);
  
  print("Original list:");
  printList(head);
  
  head = insertMiddle(head, 10);
  
  print("\nList after inserting 10 in the middle:");
  printList(head);
}