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

    if (age < person.age) {
      person.younger = idcard(person.younger, age);
    } else if (age > person.age) {
      person.older = idcard(person.older, age);
    }
    return person;
  }

  // Function to find nearest element to target
  int findnear(int searchage) {
    
    return police(root!, searchage);
  }

  int police(family person, int searchage) {
    int closest = person.age;
    
    // If we found the exact match, return it
    if (person.age == searchage) {
      return person.age;
    }
    
    // If target is less than current node
     if (searchage < person.age && person.younger != null) {
        int youngerClosest = police(person.younger!, searchage);
        if ((searchage - youngerClosest).abs() < (searchage - closest).abs()) {
            closest = youngerClosest;
        }
    }
    
    if (searchage > person.age && person.older != null) {
        int olderClosest = police(person.older!, searchage);
        if ((searchage - olderClosest).abs() < (searchage - closest).abs()) {
            closest = olderClosest;
        }
    }
    
    return closest;
}
  void printvalidate() {
    printid(root);
  }

  void printid(family? person) {
    if (person != null) {
      printid(person.younger);
      print(person.age);
      printid(person.older);
    }
  }
}

void main() {
  var x = familytree();

  x.insert(50);
  x.insert(60);
  x.insert(30);
  x.insert(20);
  x.insert(40);
  x.insert(70);
  x.insert(55);

  print("The idcard is:");
  x.printvalidate();
  
  // Test finding nearest elements
  print("\nFinding nearest elements:");
  print("Nearest to 54: ${x.findnear(54)}"); // Should print 55
  print("Nearest to 35: ${x.findnear(35)}"); // Should print 40
  print("Nearest to 65: ${x.findnear(65)}"); // Should print 60
}