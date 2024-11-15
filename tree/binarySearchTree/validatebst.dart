class FamilyMember {
  int age;
  FamilyMember? younger;
  FamilyMember? older;

  FamilyMember(this.age);
}

bool isValidBST(FamilyMember? root) {
  return _checkBST(root, null, null);
}

bool _checkBST(FamilyMember? node, int? minAge, int? maxAge) {
  if (node == null) return true;

  if ((minAge != null && node.age <= minAge) || 
      (maxAge != null && node.age >= maxAge)) {
    return false;
  }

  return _checkBST(node.younger, minAge, node.age) && 
         _checkBST(node.older, node.age, maxAge);
}

void main() {
  var grandparent = FamilyMember(50);
  grandparent.younger = FamilyMember(30);
  grandparent.older = FamilyMember(70); 
  grandparent.younger!.younger = FamilyMember(20);
  grandparent.younger!.older = FamilyMember(40);

  print("Is this a valid family tree? ${isValidBST(grandparent)}");
}