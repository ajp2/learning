/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(elList) {\n    this.elList = elList;\n  }\n\n  html(str = undefined) {\n    if (str !== undefined) {\n      this.elList.forEach(el => el.innerHTML = str);\n    }\n\n    return this.elList[0].innerHTML;\n  }\n\n  empty() {\n    this.html(\"\");\n  }\n\n  append(args) {\n    if (args instanceof DOMNodeCollection) {\n      this.elList.forEach(el => {\n        args.elList.forEach(arg => {\n          el.innerHTML += arg.innerHTML;\n        });\n      });\n\n    } else if (args instanceof HTMLElement) {\n      this.elList.forEach(el => el.innerHTML += args.outerHTML);\n    } else if (typeof(args) === \"string\") {\n      this.elList.forEach(el => el.outerHTML += args);\n    }\n  }\n\n  attr(attrName, value = undefined) {\n    if (value === undefined) {\n      return this.elList[0].getAttribute(attrName);\n    }\n\n    this.elList[0].setAttribute(attrName, value);\n    return undefined;\n  }\n\n  addClass(name) {\n    this.elList.forEach(el => el.classList.add(name));\n  }\n\n  removeClass(name) {\n    this.elList.forEach(el => el.classList.remove(name));\n  }\n\n  children() {\n    let childrenArr = [];\n    this.elList.forEach(el => {\n      childrenArr = childrenArr.concat(el.children);\n    });\n\n    return new DOMNodeCollection(childrenArr);\n  }\n\n  parent() {\n    const parentArr = [];\n    this.elList.forEach(el => parentArr.push(el.parentElement));\n    return parentArr;\n  }\n\n  find(selector) {\n    let nodes = [];\n    this.elList.forEach(el => {\n      nodes = nodes.concat(el.querySelectorAll(selector));\n    });\n\n    return new DOMNodeCollection(nodes);\n  }\n\n  remove() {\n    this.elList.forEach(el => el.outerHTML = \"\");\n  }\n\n  on(event, callback) {\n    this.elList.forEach(el => {\n      el.addEventListener(event, callback);\n      el.callback = callback;\n    });\n  }\n\n  off(event) {\n    this.elList.forEach(el => el.removeEventListener(event, el.callback));\n  }\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\nconst $1 = (args) => {\n  if (args instanceof HTMLElement) {\n    return new DOMNodeCollection([args]);\n  } else if (args instanceof Function) {\n    const funcQueue = [];\n    funcQueue.push(args);\n    document.addEventListener(\"DOMContentLoaded\", e => {\n      funcQueue.forEach(func => func());\n    })\n  }\n\n  let els = document.querySelectorAll(args);\n  els = Array.from(els);\n  return new DOMNodeCollection(els);\n}\n\nwindow.$1 = $1;\n\nconsole.log($1(\"body\"));\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });