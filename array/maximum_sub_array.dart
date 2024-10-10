// Function to find the maximum subarray
List<dynamic> maxSubArray(List<int> nums) {
  // Initialize variables
  int maxSum = nums[0];  // Maximum sum found so far
  int currentSum = nums[0];  // Sum of the current subarray
  int start = 0;  // Start index of the maximum subarray
  int end = 0;  // End index of the maximum subarray
  int tempStart = 0;  // Temporary start index

  // Iterate through the array starting from the second element
  for (int i = 1; i < nums.length; i++) {
    // If current sum becomes negative, reset it and update tempStart
    if (currentSum < 0) {
      currentSum = nums[i];
      tempStart = i;
    } else {
      // Otherwise, add the current element to the currentSum
      currentSum += nums[i];
    }

    // If we found a new maximum sum, update maxSum and indices
    if (currentSum > maxSum) {
      maxSum = currentSum;
      start = tempStart;
      end = i;
    }
  }

  // Return the maximum sum and the subarray
  return [maxSum, nums.sublist(start, end + 1)];
}

void main() {
  // Example usage
  List<int> numbers = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
  var result = maxSubArray(numbers);
  
  print("Original array: $numbers");
  print("Maximum subarray sum: ${result[0]}");
  print("Maximum subarray: ${result[1]}");
}