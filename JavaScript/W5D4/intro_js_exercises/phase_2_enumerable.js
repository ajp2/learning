Array.prototype.myEach = function(cb) {
  for(let i = 0; i < this.length; i++) {
    cb(this[i], i);
  }
};

// [1,2,3].myEach((e, idx) => console.log(idx));

Array.prototype.myMap = function(cb) {
  let new_arr = [];

  this.myEach(e => {
    new_arr.push(cb(e));
  });

  return new_arr;
};

// console.log([1,2,3].myMap(e => e * 2));

Array.prototype.myReduce = function(cb, initialValue) {
  let arr = this;

  if (initialValue === undefined) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }

  let result = initialValue;
  arr.myEach(el => result = cb(result, el));
  
  return result;
};

// console.log([1,2,3].myReduce(function(acc, el) {
//   return acc + el;
// }));