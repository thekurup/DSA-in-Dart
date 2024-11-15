class Tree{
  // This is like saying "We're creating a blueprint for each person in our family tree."
  // let it be tree is the family name
  int value;
//   This is a number that belongs to each person.
// Think of it as their age or a unique ID number.
  Tree? left;
  Tree?right;
  // left and right are like their two children in the family

  Tree(this.value);

  // last we upadting data of family name tree
}

int count(Tree?root){

  // we assiging an officer name "root " a task ie "count" 
  // task is to count the total memebers in the family 

  if(root==null){
    return 0;
    // if root go and veed adch ittekuvangil , root threich return ie office therich pokm
  }

  return 1+ count(root.left)+count(root.right);

  // else, root avrude family deatil include chaim 
  // +1 means  starting from there father , and then root collect both sons name also

}

void main(){

  var root = Tree(1);
  root.left=Tree(2);
  root.right=Tree(3);
  root.left!.left=Tree(4);
  root.left!.right=Tree(5);

  // in here root listing every detail,
  // like root = tree (1) means father
  // tree2 left his elder son, and 4 and 5 showing lefet has two children

  var result = count(root);

  // root handover data to officer result and he print this this data

  print("count of the family tree,$result");
}

