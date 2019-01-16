function range(start, end) {
  if (start >= end) {
    return [start];
  }

  return range(start, end - 1).concat(end);
}

// console.log(range(5, 17));

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }

  return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([4,5,6]));

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }

  return base * exponent(base, exp - 1);
}

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp === 1) {
    return base;
  }

  if (exp % 2 === 0) {
    return exponent2(base, exp / 2) ** 2;
  } else {
    return base * (exponent(base, (exp - 1) / 2) ** 2);
  }
}

// console.log(exponent2(3, 4));

function fibonacci(n) {
  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  } else if (n <= 0) {
    return [0];
  }

  let fib = fibonacci(n - 1);
  fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
  return fib;
}

// console.log(fibonacci(7));
// [1, 1, 2, 3, 5, 8, 13]

function deepDup(arr) {
  if (!Array.isArray(arr)) {
    return arr;
  }

  return arr.map(el => {
    return deepDup(el);
  });
}

// a = [[3,4], [5,[6, 7], 8], [9, 10]];
// b = deepDup(a);
// b.push(11);
// console.log(a);
// console.log(b);

function bsearch(arr, target) {
  if (arr.length === 0 || arr.length === 1 && arr[0] !== target) {
    return -1;
  }

  let mid = Math.floor(arr.length / 2);
  if (arr[mid] === target) {
    return mid;
  }
  if (target < arr[mid]) {
    return bsearch(arr.slice(0, mid), target);
  }
  var result = bsearch(arr.slice(mid + 1), target);
  return (result === -1) ? -1 : result + 1 + mid;
}

// console.log(bsearch([2,4,6,8,22,46,62], 46));

function mergesort(arr) {
  if (arr.length === 1) {
    return arr;
  }

  let mid = Math.floor(arr.length / 2)
  let left_half = mergesort(arr.slice(0, mid));
  let right_half = mergesort(arr.slice(mid));
  return merge(left_half, right_half);

  function merge(left, right) {
    const merged = [];

    while (left.length > 0 || right.length > 0) {
      if (left.length === 0) {
        merged.push(right.shift());
      } else if (right.length == 0) {
        merged.push(left.shift());
      } else {
        left[0] < right[0] ? merged.push(left.shift()) : merged.push(right.shift());
      }
    }

    return merged;
  }

}

// console.log(mergesort([3,1,9,5,7,2,24,8]));

function subsets(arr) {
  
}