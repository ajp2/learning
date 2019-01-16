Array.prototype.bubbleSort = function() {
  let sorted = false;
  const sorted_arr = this.slice();

  while (!sorted) {
    sorted = true;
    for (let i = 0; i < sorted_arr.length - 1; i++) {
      if (sorted_arr[i] > sorted_arr[i+1]) {
        let tmp = sorted_arr[i];
        sorted_arr[i] = sorted_arr[i+1];
        sorted_arr[i+1] = tmp;
        sorted = false;
      }
    }
  }

  return sorted_arr;
};

// console.log([2,7,4,1,99,55,25,12,27].bubbleSort());

String.prototype.substrings = function(substring) {
  const substrings_arr = [];
  const sub_length = substring.length;

  for (let i = 0; i < this.length - sub_length; i++) {
    let current_sub = this.slice(i, i + sub_length);
    if (current_sub === substring) {
      substrings_arr.push(current_sub);
    } 
  }

  return substrings_arr;
};

// console.log("hello".substrings("el"));

