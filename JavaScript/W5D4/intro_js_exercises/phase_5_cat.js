function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  return `Everyone loves ${this.name}`;
};

Cat.prototype.meow = function() {
  return "meow!!";
};

bob = new Cat("bob", "a");
geoff = new Cat("geoff", "a");
fred = new Cat("fred", "b");

fred.meow = function() {
  return "meow!!!!";
};

console.log(bob.cuteStatement());
console.log(fred.cuteStatement());
console.log(fred.meow());

