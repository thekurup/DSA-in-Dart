class family {
  int age;
  family? younger;
  family? older;
  family(this.age);
}

class familytree {
  family? root;

  void insert(int age) {
    root = idcard(root, age);
  }

  family idcard(family? person, int age) {
    if (person == null) {
      return family(age);
    }
    if (person.age < age) {
      person.younger = idcard(person.younger, age);
    } else {
      person.older = idcard(person.older, age);
    }
    return person;
  }

  void valiadte() {
    checker(root);
  }

  void checker(family? person) {
    if (person != null) {
      checker(person.younger);
      print(person.age);
      checker(person.older);
    }
  }

  // Function to find the second largest element
  int? findSecondLargest() {
    

    family? current = root;
    family? parent = null;

    // Find the largest element (rightmost node)
  while(current?.younger != null) {
      parent = current;
      current = current?.younger;
    }

    // Case 1: If largest node has a older subtree
    if (current?.older != null) {
      // Find largest in older subtree
      return current?.older?.age;
      }
      
    // Case 2: If largest node doesn't have older subtree, return its parent
    else if (parent != null) {
      return parent.age;
    }

    // Case 3: If we're looking for second largest in a tree with only right children
    return null;
  }
}

void main() {
  var x = familytree();
  x.insert(50);
  x.insert(30);
  x.insert(70);
  x.insert(60);
  x.insert(20);
  x.insert(80);

  print("Family tree is: ");
  x.valiadte();

  var result =x.findSecondLargest();
  print("the second largest number is ,$result");
}