Array.prototype.uniq = function() {
  let uniq_arr = [];
  this.forEach(num => {
    if (!uniq_arr.includes(num)) {
      uniq_arr.push(num);
    }
  });

  return uniq_arr;
}

// console.log([1,1,3,5,6].uniq());

Array.prototype.twoSum = function() {
  const twoSumArr = []
  this.forEach((num1, idx1) => {
    this.forEach((num2, idx2) => {
      if (idx2 > idx1 && num1 + num2 === 0) {
        twoSumArr.push([idx1, idx2]);
      }
    });
  });

  return twoSumArr;
};

// console.log([2, -2, 4, 9, 0 ,-9].twoSum());

Array.prototype.transpose = function() {
  transposed = new Array(this.length).fill(undefined).map(() => new Array(this.length).fill(undefined));

  this.forEach((num1, idx1) => {
    this.forEach((num2, idx2) => {
      transposed[idx1][idx2] = (this[idx2][idx1]);
    });
  });

  return transposed;
};

console.log([[1,2,3], [4,5,6], [7,8,9]].transpose());