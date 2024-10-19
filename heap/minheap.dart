class YoungestFirstGathering {
  List<int> _ages = [];

  void addFamilyMember(int age) {
    _ages.add(age);
    _bubbleUp(_ages.length - 1);
  }

  int? getYoungest() {
    if (_ages.isEmpty) return null;
    return _ages[0];
  }

  int? removeYoungest() {
    if (_ages.isEmpty) return null;
    if (_ages.length == 1) return _ages.removeLast();

    int youngest = _ages[0];
    _ages[0] = _ages.removeLast();
    _bubbleDown(0);
    return youngest;
  }

  void _bubbleUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (_ages[parentIndex] <= _ages[index]) break;
      _swap(index, parentIndex);
      index = parentIndex;
    }
  }

  void _bubbleDown(int index) {
    while (true) {
      int youngest = index;
      int leftChild = 2 * index + 1;
      int rightChild = 2 * index + 2;

      if (leftChild < _ages.length && _ages[leftChild] < _ages[youngest]) {
        youngest = leftChild;
      }
      if (rightChild < _ages.length && _ages[rightChild] < _ages[youngest]) {
        youngest = rightChild;
      }

      if (youngest == index) break;

      _swap(index, youngest);
      index = youngest;
    }
  }

  void _swap(int i, int j) {
    int temp = _ages[i];
    _ages[i] = _ages[j];
    _ages[j] = temp;
  }
}

void main() {
  var familyGathering = YoungestFirstGathering();

  familyGathering.addFamilyMember(50); // Grandparent
  familyGathering.addFamilyMember(30); // Parent
  familyGathering.addFamilyMember(20); // Child
  familyGathering.addFamilyMember(40); // Parent's sibling
  familyGathering.addFamilyMember(10); // Grandchild

  print("Youngest family member's age: ${familyGathering.getYoungest()}");

  print("\nRemoving family members in order of age (youngest first):");
  while (true) {
    int? age = familyGathering.removeYoungest();
    if (age == null) break;
    print("Removed family member of age: $age");
  }
}