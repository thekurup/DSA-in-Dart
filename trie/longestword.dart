class trie{
  Map<String,trie>tree={};
  int count=0;
  bool end=false;
}

class stringtree{
  trie root=trie();
  void insert(String words){
    trie current=root;
    current.count++;
    for(int i=0;i<words.length;i++){
      String x=words[i];
      if(!current.tree.containsKey(x)){
        current.tree[x]=trie();
        
      }
      current=current.tree[x]!;
      current.count++;
    }
    current.end=true;
  }

  String findlongest(){
    List<String>suggestions=[];
    find(root,"",suggestions);

    String longest=suggestions[0];

    for(String i in suggestions){
      if(i.length>longest.length){
        longest=i;
      }
  }
  return longest;
}

void find(trie node,String words, List<String> suggestions){
  if(node.end){
    suggestions.add(words);
  }

  node.tree.forEach((i,node){
    find(node, words+i, suggestions);
  });
}
}
void main(){
  List<String>words=["apple","orange","lemon"];
  var x=stringtree();
  for (String i in words){
    x.insert(i);
  }
  var result =x.findlongest();
  print("Longest word in the trie is $result");
}