class Trie {
  Map<String, Trie> tree = {};
  bool end = false;
  int count = 0;  // Initialize count for each node
}

class StringTree {
  Trie root = Trie();

  void insert(String word) {
    Trie current = root;
    current.count++; // Increment count for root node

    for (int i = 0; i < word.length; i++) {
      String x = word[i];

      if (!current.tree.containsKey(x)) {
        current.tree[x] = Trie();
      }
      current = current.tree[x]!;
      current.count++; // Increment count for each character
    }
    current.end = true;
  }

  String findPrefix(List<String> words) {
    if (words.isEmpty) {
      return "";
    }

    
    for (String word in words) {
      insert(word);
    }

    Trie current = root;
    String prefix = "";
 // Show we're starting search
    
    while (current.tree.length == 1 && 
           current.tree[current.tree.keys.first]!.count == words.length) {
      String letter = current.tree.keys.first;
      prefix += letter;
      current = current.tree[letter]!;
    }
    
    return prefix;
  }
}

void main() {
  List<String> words = ["flower", "flow", "flows"];
  StringTree x = StringTree();
  String commonPrefix = x.findPrefix(words);
  print("Final answer: $commonPrefix");
}