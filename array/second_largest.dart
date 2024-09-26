// Function to find the second largest element in an array
int findSecondLargest(List<int> x) {
  // This function takes a list of integers as input
  //  and returns an integer (the second largest element).
  // Check if the array has at least two elements
  if (x.length < 2) {
    print('Array should have at least two elements');
    // We check if the array has at least two elements. If not, we throw an exception because 
    // we can't find a second largest in a list with fewer than two elements.
    
  }

  int largest = x[0];
  int secondLargest = x[0];

  // We start by assuming the first element is both 
  // the largest and second largest.

  // Iterate through the array once
  for (int i = 1; i < x.length; i++) {
    // We loop through the array once, starting from the second element (index 1).
    if (x[i] > largest) {
      // Update second largest and largest
      secondLargest = largest;
      largest = x[i];
    } else if (x[i] > secondLargest && x[i] != largest) {
      // Update second largest if it's greater than current second largest
      // and not equal to the largest
      secondLargest = x[i];
    }
//     If we find an element larger than our current largest, 
//     the old largest becomes the second largest, and we update the largest.
// If an element is larger than the second largest but not equal to the largest,
//  we update the second largest.


  }

  // Check if a second largest element was found
  if (secondLargest == largest) {
    print('No second largest element found');
  }
  // After the loop, if the second largest is the same as the largest, 
  // it means we didn't find a distinct second largest element

  return secondLargest;
  // We return the second largest element we found.
}

void main() {
  // Example usage
  List<int> x = [10, 5, 8, 12, 3, 7, 12];
  
  try {
    int secondLargest = findSecondLargest(x);
    print('The second largest element is: $secondLargest');
  } catch (e) {
    print('Error: $e');
  }
//   We create a sample list of numbers.
// We call our function inside a try-catch block to handle any exceptions.
// We print the result or any error message.
}

// This solution is efficient because:

//     Time Complexity: O(n), where n is the number of elements in the array.
//     We only loop through the array once.
//     Space Complexity: O(1), as we only use two extra variables (largest and secondLargest) 
//     regardless of the array size.