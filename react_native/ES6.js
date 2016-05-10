// ES 6

let tmp = 123
const PI = 3.1415

[foo: bar] = [foo: 1, bar: 2]

var [a, b, c] = [1, 2, 3];





// string 解构赋值
const [a, b, c, d, e] = 'hello';

let {length: len} = 'hello';
len // 5

// 数值 布尔值解构
let {toString: s} = 123;
s === Number.prototype.toString;

let {toString: s} = true;
s === Boolean.prototype.toString;



// 9.2 属性名表达式
let propkey = 'foo';

var obj = {
  [propkey]: true,
  ['a' + 'bc']: 123
};

//
var lastWord = 'last word';

var obj = {
  'first word': 'hello',
  [lastWord]: 'word'
};

obj['first word']
obj[lastWord]
obj['last word']
//
var obj = {
  ['h' + 'ello'](){
    return 'hi';
  }
};

// 9.3 方法的name属性

var Person = {
  sayName: function(){
    console.log(this.name);
  },
  get firstName(){
    return 'liguang';
  }
};

Person.sayName.name
Person.firstName.name

// 9.4 Object.is()

Object.is('foo', 'foo') // true

Object.is({}, {}) // false

Object.is(+0, -0) // false
Object.is(NaN, NaN) // true


// 9.5 Object.assign()
var target = {a: 1};
var source1 = {b: 2};
var source2 = {b: 3, c: 4};

Object.assign(target, source1, source2) // {a: 1, b: 3, c: 4}


// 10.1 Symbol

let s = Symbol();

var s1 = Symbol('foo');
var s2 = Symbol('bar')

s1.toString();
s2.toString();
s1 === s2 // false

var sym = Symbol();

Boolean(sym)

if(sym){
  //...
}

String(sym);

// 10.2 作为属性名的 symbol

var mySymbol = Symbol();
var a = {};

var a = {
  [mySymbol] = 'hello'
}

var Object.defineProperty(a, mySymbol, {value: 'hello'})

//
let s = Symbol();

let obj = {
  [s]: function(args){ }
};

obj[s](123)

let obj = {
  [s](args){}
}






























