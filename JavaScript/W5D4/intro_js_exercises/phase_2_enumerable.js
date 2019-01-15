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
  let accPassed = initialValue ? true : false;
  let acc = initialValue || this[0];

  this.myEach((e, idx) => {
    if (!accPassed && idx == 0) {
      // skip
    } else {
      acc = cb(e, acc);
    }
  });

  return acc;
};

// console.log([1,2,3].myReduce(function(acc, el) {
//   return acc + el;
// }));