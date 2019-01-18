function sumOld() {
  total = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }

  return total;
}

function sum(...nums) {
  total = 0;
  nums.forEach(el => total += el);
  return total;
}

// console.log(sum(1,2,3,4,5,6));



Function.prototype.myBindOld = function(context) {
  const args = Array.from(arguments).slice(1);
  const funcCall = this;

  return function() {
    const innerArgs = Array.from(arguments);
    funcCall.apply(context, args.concat(innerArgs));
  };
};

Function.prototype.myBind = function(context, ...args) {
  return (...innerArgs) => this.apply(context, args.concat(innerArgs));
};


function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((acc, el) => acc += el);
    }

    return _curriedSum;
  }

  return _curriedSum;
}

Function.prototype.curry1 = function(numArgs) {
  const args = [];

  const curriedReturn = (arg) => {
    args.push(arg);
    if (args.length === numArgs) {
      return this.apply(undefined, args);
    } else {
      return curriedReturn;
    }
  };

  return curriedReturn;
};

Function.prototype.curry2 = function (numArgs) {
  const args = [];

  curriedReturn = (arg) => {
    args.push(arg);
    if (args.length === numArgs) {
      const returnVal = this(...args);
      return returnVal;
    } else {
      return curriedReturn;
    }
  };

  return curriedReturn;
};


// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

// a = sumThree.curry2(3);
// a = a(10);
// a = a(10);
// a = a(18);
// console.log(a);