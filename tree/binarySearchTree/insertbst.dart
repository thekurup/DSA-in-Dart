// Define the structure of a tree node
class FamilyMember {
  int age;
  FamilyMember? younger;  // Left child (younger family member)
  FamilyMember? older;    // Right child (older family member)

  FamilyMember(this.age);
}

class FamilyTree {
  FamilyMember? root;

  // Method to insert a new family member
  void insert(int age) {
    root = _insertMember(root, age);
  }

  // Helper method for insertion
  FamilyMember _insertMember(FamilyMember? node, int age) {
    // If the tree is empty, create a new node
    if (node == null) {
      return FamilyMember(age);
    }

    // If the age is less than the current node, go to the younger branch
    if (age < node.age) {
      node.younger = _insertMember(node.younger, age);
    } 
    // If the age is greater, go to the older branch
    else if (age > node.age) {
      node.older = _insertMember(node.older, age);
    }

    // Return the unchanged node pointer
    return node;
  }

  // Method to print the family tree in-order
  void printFamilyTree() {
    _printInOrder(root);
  }

  // Helper method for in-order traversal
  void _printInOrder(FamilyMember? node) {
    if (node != null) {
      _printInOrder(node.younger);
      print(node.age);
      _printInOrder(node.older);
    }
  }
}

void main() {
  var familyTree = FamilyTree();

  // Insert family members
  familyTree.insert(50);  // Grandparent
  familyTree.insert(30);  // Parent
  familyTree.insert(70);  // Parent's sibling
  familyTree.insert(20);  // Child
  familyTree.insert(40);  // Child
  familyTree.insert(60);  // Cousin
  familyTree.insert(80);  // Cousin

  print("Family members by age (youngest to oldest):");
  familyTree.printFamilyTree();
}