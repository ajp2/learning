Array.prototype.bubbleSort = function() {
  let sorted = false;
  const sorted_arr = this.slice();

  while (!sorted) {
    sorted = true;
    for (let i = 0; i < sorted_arr.length - 1; i++) {
      if (sorted_arr[i] > sorted_arr[i+1]) {
        [sorted_arr[i], sorted_arr[i + 1]] = [sorted_arr[i + 1], sorted_arr[i]];
        sorted = false;
      }
    }
  }

  return sorted_arr;
};

// console.log([2,7,4,1,99,55,25,12,27].bubbleSort());

String.prototype.substrings = function() {
  const substrings = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i; j <= this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }

  return substrings;
};

// console.log("hello".substrings());

