class trie {
  Map<String, trie> tree = {};
  bool end = false;
  int count = 0;
}

class stringtree {
  trie root = trie();

  void insert(String words) {
    trie current = root;
    current.count++;

    for (int i = 0; i < words.length; i++) {
      String x = words[i];
      if (!current.tree.containsKey(x)) {
        current.tree[x] = trie();
      }
      current = current.tree[x]!;
      current.count++;
    }
    current.end = true;
  }

  // Find all words that start with given prefix
  List<String> autocomplete(String words) {
    List<String> suggestions = [];
    trie current = root;

    // First, traverse to the last node of prefix
    for (int i = 0; i < words.length; i++) {
      String x = words[i];
      if (!current.tree.containsKey(x)) {
        return suggestions; // Return empty list if wordas not found
      }
      current = current.tree[x]!;
    }

    // Now find all possible words from this node
    findWords(current,words, suggestions);
    return suggestions;
  }

  // Helper function to find all words with a given prefix
  void findWords(trie current, String words, List<String> suggestions) {
    // If we reached end of a word, add it to suggestions
    if (current.end) {
      suggestions.add(words);
    }

    // Explore all possible paths from this node
    current.tree.forEach((i, current) {
      findWords(current, words + i, suggestions);
    });
  }
}

void main() {
 var x=stringtree();
  List<String>words=[
     "apple",
    "application",
    "appetite",
    "banana",
    "ball",
    "cat"
  ];

  for(String i in words){
    x.insert(i);
  }

  String i="b";

  var result=x.autocomplete(i);

  print("the auto complete of word $i  is  $result");
}