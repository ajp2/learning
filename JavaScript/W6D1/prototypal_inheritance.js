Function.prototype.inherits = function(superClass) {
  function Surrogate() {}
  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

Function.prototype.inherits2 = function(superClass) {
  this.prototype = Object.create(superClass.prototype);
  this.prototype.constructor = this;
}

function MovingObject(name) {
  this.name = name;
}

MovingObject.prototype.hello = function() {
  console.log("hello");
}

function Ship (name) {
  MovingObject.call(this, name);
}

Ship.inherits(MovingObject);



function Asteroid (name) {
  MovingObject.call(this, name);
}

Asteroid.inherits(MovingObject);

Asteroid.prototype.stuff = function() {
  console.log("stuff");
}



const a = new Ship("a");
const b = new Asteroid("b");

// a.hello();
// b.hello();

b.stuff();
console.log(Asteroid.prototype instanceof MovingObject);