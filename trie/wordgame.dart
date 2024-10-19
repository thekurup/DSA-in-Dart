class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class WordGame {
  TrieNode root = TrieNode();

  void addWord(String word) {
    TrieNode current = root;
    for (var char in word.toLowerCase().split('')) {
      current.children.putIfAbsent(char, () => TrieNode());
      current = current.children[char]!;
    }
    current.isEndOfWord = true;
  }

  bool isValidWord(String word) {
    TrieNode? node = _findNode(word.toLowerCase());
    return node != null && node.isEndOfWord;
  }

  List<String> findWordsWithPrefix(String prefix) {
    List<String> results = [];
    TrieNode? node = _findNode(prefix.toLowerCase());
    if (node != null) {
      _collectWords(node, prefix.toLowerCase(), results);
    }
    return results;
  }

  TrieNode? _findNode(String prefix) {
    TrieNode current = root;
    for (var char in prefix.split('')) {
      if (!current.children.containsKey(char)) {
        return null;
      }
      current = current.children[char]!;
    }
    return current;
  }

  void _collectWords(TrieNode node, String prefix, List<String> results) {
    if (node.isEndOfWord) {
      results.add(prefix);
    }
    node.children.forEach((char, childNode) {
      _collectWords(childNode, prefix + char, results);
    });
  }
}

void main() {
  var game = WordGame();
  
  // Add some words to the game
  var words = ['cat', 'car', 'dog', 'dare', 'deep', 'deal'];
  for (var word in words) {
    game.addWord(word);
  }

  // Test valid words
  print("Is 'cat' a valid word? ${game.isValidWord('cat')}");
  print("Is 'cat' a valid word? ${game.isValidWord('cate')}");

  // Find words with prefix
  print("\nWords starting with 'ca': ${game.findWordsWithPrefix('ca')}");
  print("Words starting with 'de': ${game.findWordsWithPrefix('de')}");

  // Challenge: Find the longest word chain
  print("\nChallenge: Find the longest word chain");
  String startWord = 'd';
  List<String> chain = findLongestChain(game, startWord);
  print("Longest chain starting with '$startWord': $chain");
}

List<String> findLongestChain(WordGame game, String startLetter) {
  List<String> longestChain = [];
  List<String> currentChain = [];

  void dfs(String prefix) {
    if (game.isValidWord(prefix)) {
      currentChain.add(prefix);
      if (currentChain.length > longestChain.length) {
        longestChain = List.from(currentChain);
      }
    }

    for (String nextChar in 'abcdefghijklmnopqrstuvwxyz'.split('')) {
      String newPrefix = prefix + nextChar;
      if (game.findWordsWithPrefix(newPrefix).isNotEmpty) {
        dfs(newPrefix);
      }
    }

    if (currentChain.isNotEmpty) {
      currentChain.removeLast();
    }
  }

  dfs(startLetter);
  return longestChain;
}