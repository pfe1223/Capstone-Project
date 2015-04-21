var Elm = Elm || { Native: {} };
Elm.Array = Elm.Array || {};
Elm.Array.make = function (_elm) {
   "use strict";
   _elm.Array = _elm.Array || {};
   if (_elm.Array.values)
   return _elm.Array.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Array",
   $Basics = Elm.Basics.make(_elm),
   $List = Elm.List.make(_elm),
   $Maybe = Elm.Maybe.make(_elm),
   $Native$Array = Elm.Native.Array.make(_elm);
   var append = $Native$Array.append;
   var length = $Native$Array.length;
   var slice = $Native$Array.slice;
   var set = $Native$Array.set;
   var get = F2(function (i,
   array) {
      return _U.cmp(0,
      i) < 1 && _U.cmp(i,
      $Native$Array.length(array)) < 0 ? $Maybe.Just(A2($Native$Array.get,
      i,
      array)) : $Maybe.Nothing;
   });
   var push = $Native$Array.push;
   var empty = $Native$Array.empty;
   var filter = F2(function (isOkay,
   arr) {
      return function () {
         var update = F2(function (x,
         xs) {
            return isOkay(x) ? A2($Native$Array.push,
            x,
            xs) : xs;
         });
         return A3($Native$Array.foldl,
         update,
         $Native$Array.empty,
         arr);
      }();
   });
   var foldr = $Native$Array.foldr;
   var foldl = $Native$Array.foldl;
   var indexedMap = $Native$Array.indexedMap;
   var map = $Native$Array.map;
   var toIndexedList = function (array) {
      return A3($List.map2,
      F2(function (v0,v1) {
         return {ctor: "_Tuple2"
                ,_0: v0
                ,_1: v1};
      }),
      _L.range(0,
      $Native$Array.length(array) - 1),
      $Native$Array.toList(array));
   };
   var toList = $Native$Array.toList;
   var fromList = $Native$Array.fromList;
   var initialize = $Native$Array.initialize;
   var repeat = F2(function (n,e) {
      return A2(initialize,
      n,
      $Basics.always(e));
   });
   var Array = {ctor: "Array"};
   _elm.Array.values = {_op: _op
                       ,Array: Array
                       ,initialize: initialize
                       ,repeat: repeat
                       ,fromList: fromList
                       ,toList: toList
                       ,toIndexedList: toIndexedList
                       ,map: map
                       ,indexedMap: indexedMap
                       ,foldl: foldl
                       ,foldr: foldr
                       ,filter: filter
                       ,empty: empty
                       ,push: push
                       ,get: get
                       ,set: set
                       ,slice: slice
                       ,length: length
                       ,append: append};
   return _elm.Array.values;
};
Elm.Basics = Elm.Basics || {};
Elm.Basics.make = function (_elm) {
   "use strict";
   _elm.Basics = _elm.Basics || {};
   if (_elm.Basics.values)
   return _elm.Basics.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Basics",
   $Native$Basics = Elm.Native.Basics.make(_elm),
   $Native$Show = Elm.Native.Show.make(_elm),
   $Native$Utils = Elm.Native.Utils.make(_elm);
   var uncurry = F2(function (f,
   _v0) {
      return function () {
         switch (_v0.ctor)
         {case "_Tuple2": return A2(f,
              _v0._0,
              _v0._1);}
         _U.badCase($moduleName,
         "on line 472, column 19 to 24");
      }();
   });
   var curry = F3(function (f,
   a,
   b) {
      return f({ctor: "_Tuple2"
               ,_0: a
               ,_1: b});
   });
   var flip = F3(function (f,b,a) {
      return A2(f,a,b);
   });
   var snd = function (_v4) {
      return function () {
         switch (_v4.ctor)
         {case "_Tuple2": return _v4._1;}
         _U.badCase($moduleName,
         "on line 456, column 13 to 14");
      }();
   };
   var fst = function (_v8) {
      return function () {
         switch (_v8.ctor)
         {case "_Tuple2": return _v8._0;}
         _U.badCase($moduleName,
         "on line 452, column 13 to 14");
      }();
   };
   var always = F2(function (a,
   _v12) {
      return function () {
         return a;
      }();
   });
   var identity = function (x) {
      return x;
   };
   _op["<|"] = F2(function (f,x) {
      return f(x);
   });
   _op["|>"] = F2(function (x,f) {
      return f(x);
   });
   _op[">>"] = F3(function (f,
   g,
   x) {
      return g(f(x));
   });
   _op["<<"] = F3(function (g,
   f,
   x) {
      return g(f(x));
   });
   _op["++"] = $Native$Utils.append;
   var toString = $Native$Show.toString;
   var isInfinite = $Native$Basics.isInfinite;
   var isNaN = $Native$Basics.isNaN;
   var toFloat = $Native$Basics.toFloat;
   var ceiling = $Native$Basics.ceiling;
   var floor = $Native$Basics.floor;
   var truncate = $Native$Basics.truncate;
   var round = $Native$Basics.round;
   var otherwise = true;
   var not = $Native$Basics.not;
   var xor = $Native$Basics.xor;
   _op["||"] = $Native$Basics.or;
   _op["&&"] = $Native$Basics.and;
   var max = $Native$Basics.max;
   var min = $Native$Basics.min;
   var GT = {ctor: "GT"};
   var EQ = {ctor: "EQ"};
   var LT = {ctor: "LT"};
   var compare = $Native$Basics.compare;
   _op[">="] = $Native$Basics.ge;
   _op["<="] = $Native$Basics.le;
   _op[">"] = $Native$Basics.gt;
   _op["<"] = $Native$Basics.lt;
   _op["/="] = $Native$Basics.neq;
   _op["=="] = $Native$Basics.eq;
   var e = $Native$Basics.e;
   var pi = $Native$Basics.pi;
   var clamp = $Native$Basics.clamp;
   var logBase = $Native$Basics.logBase;
   var abs = $Native$Basics.abs;
   var negate = $Native$Basics.negate;
   var sqrt = $Native$Basics.sqrt;
   var atan2 = $Native$Basics.atan2;
   var atan = $Native$Basics.atan;
   var asin = $Native$Basics.asin;
   var acos = $Native$Basics.acos;
   var tan = $Native$Basics.tan;
   var sin = $Native$Basics.sin;
   var cos = $Native$Basics.cos;
   _op["^"] = $Native$Basics.exp;
   _op["%"] = $Native$Basics.mod;
   var rem = $Native$Basics.rem;
   _op["//"] = $Native$Basics.div;
   _op["/"] = $Native$Basics.floatDiv;
   _op["*"] = $Native$Basics.mul;
   _op["-"] = $Native$Basics.sub;
   _op["+"] = $Native$Basics.add;
   var toPolar = $Native$Basics.toPolar;
   var fromPolar = $Native$Basics.fromPolar;
   var turns = $Native$Basics.turns;
   var degrees = $Native$Basics.degrees;
   var radians = function (t) {
      return t;
   };
   _elm.Basics.values = {_op: _op
                        ,max: max
                        ,min: min
                        ,compare: compare
                        ,not: not
                        ,xor: xor
                        ,otherwise: otherwise
                        ,rem: rem
                        ,negate: negate
                        ,abs: abs
                        ,sqrt: sqrt
                        ,clamp: clamp
                        ,logBase: logBase
                        ,e: e
                        ,pi: pi
                        ,cos: cos
                        ,sin: sin
                        ,tan: tan
                        ,acos: acos
                        ,asin: asin
                        ,atan: atan
                        ,atan2: atan2
                        ,round: round
                        ,floor: floor
                        ,ceiling: ceiling
                        ,truncate: truncate
                        ,toFloat: toFloat
                        ,degrees: degrees
                        ,radians: radians
                        ,turns: turns
                        ,toPolar: toPolar
                        ,fromPolar: fromPolar
                        ,isNaN: isNaN
                        ,isInfinite: isInfinite
                        ,toString: toString
                        ,fst: fst
                        ,snd: snd
                        ,identity: identity
                        ,always: always
                        ,flip: flip
                        ,curry: curry
                        ,uncurry: uncurry
                        ,LT: LT
                        ,EQ: EQ
                        ,GT: GT};
   return _elm.Basics.values;
};
Elm.Char = Elm.Char || {};
Elm.Char.make = function (_elm) {
   "use strict";
   _elm.Char = _elm.Char || {};
   if (_elm.Char.values)
   return _elm.Char.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Char",
   $Native$Char = Elm.Native.Char.make(_elm);
   var fromCode = $Native$Char.fromCode;
   var toCode = $Native$Char.toCode;
   var toLocaleLower = $Native$Char.toLocaleLower;
   var toLocaleUpper = $Native$Char.toLocaleUpper;
   var toLower = $Native$Char.toLower;
   var toUpper = $Native$Char.toUpper;
   var isHexDigit = $Native$Char.isHexDigit;
   var isOctDigit = $Native$Char.isOctDigit;
   var isDigit = $Native$Char.isDigit;
   var isLower = $Native$Char.isLower;
   var isUpper = $Native$Char.isUpper;
   _elm.Char.values = {_op: _op
                      ,isUpper: isUpper
                      ,isLower: isLower
                      ,isDigit: isDigit
                      ,isOctDigit: isOctDigit
                      ,isHexDigit: isHexDigit
                      ,toUpper: toUpper
                      ,toLower: toLower
                      ,toLocaleUpper: toLocaleUpper
                      ,toLocaleLower: toLocaleLower
                      ,toCode: toCode
                      ,fromCode: fromCode};
   return _elm.Char.values;
};
Elm.Color = Elm.Color || {};
Elm.Color.make = function (_elm) {
   "use strict";
   _elm.Color = _elm.Color || {};
   if (_elm.Color.values)
   return _elm.Color.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Color",
   $Basics = Elm.Basics.make(_elm);
   var Radial = F5(function (a,
   b,
   c,
   d,
   e) {
      return {ctor: "Radial"
             ,_0: a
             ,_1: b
             ,_2: c
             ,_3: d
             ,_4: e};
   });
   var radial = Radial;
   var Linear = F3(function (a,
   b,
   c) {
      return {ctor: "Linear"
             ,_0: a
             ,_1: b
             ,_2: c};
   });
   var linear = Linear;
   var fmod = F2(function (f,n) {
      return function () {
         var integer = $Basics.floor(f);
         return $Basics.toFloat(A2($Basics._op["%"],
         integer,
         n)) + f - $Basics.toFloat(integer);
      }();
   });
   var rgbToHsl = F3(function (red,
   green,
   blue) {
      return function () {
         var b = $Basics.toFloat(blue) / 255;
         var g = $Basics.toFloat(green) / 255;
         var r = $Basics.toFloat(red) / 255;
         var cMax = A2($Basics.max,
         A2($Basics.max,r,g),
         b);
         var cMin = A2($Basics.min,
         A2($Basics.min,r,g),
         b);
         var c = cMax - cMin;
         var lightness = (cMax + cMin) / 2;
         var saturation = _U.eq(lightness,
         0) ? 0 : c / (1 - $Basics.abs(2 * lightness - 1));
         var hue = $Basics.degrees(60) * (_U.eq(cMax,
         r) ? A2(fmod,
         (g - b) / c,
         6) : _U.eq(cMax,
         g) ? (b - r) / c + 2 : _U.eq(cMax,
         b) ? (r - g) / c + 4 : _U.badIf($moduleName,
         "between lines 141 and 143"));
         return {ctor: "_Tuple3"
                ,_0: hue
                ,_1: saturation
                ,_2: lightness};
      }();
   });
   var hslToRgb = F3(function (hue,
   saturation,
   lightness) {
      return function () {
         var hue$ = hue / $Basics.degrees(60);
         var chroma = (1 - $Basics.abs(2 * lightness - 1)) * saturation;
         var x = chroma * (1 - $Basics.abs(A2(fmod,
         hue$,
         2) - 1));
         var $ = _U.cmp(hue$,
         0) < 0 ? {ctor: "_Tuple3"
                  ,_0: 0
                  ,_1: 0
                  ,_2: 0} : _U.cmp(hue$,
         1) < 0 ? {ctor: "_Tuple3"
                  ,_0: chroma
                  ,_1: x
                  ,_2: 0} : _U.cmp(hue$,
         2) < 0 ? {ctor: "_Tuple3"
                  ,_0: x
                  ,_1: chroma
                  ,_2: 0} : _U.cmp(hue$,
         3) < 0 ? {ctor: "_Tuple3"
                  ,_0: 0
                  ,_1: chroma
                  ,_2: x} : _U.cmp(hue$,
         4) < 0 ? {ctor: "_Tuple3"
                  ,_0: 0
                  ,_1: x
                  ,_2: chroma} : _U.cmp(hue$,
         5) < 0 ? {ctor: "_Tuple3"
                  ,_0: x
                  ,_1: 0
                  ,_2: chroma} : _U.cmp(hue$,
         6) < 0 ? {ctor: "_Tuple3"
                  ,_0: chroma
                  ,_1: 0
                  ,_2: x} : {ctor: "_Tuple3"
                            ,_0: 0
                            ,_1: 0
                            ,_2: 0},
         r = $._0,
         g = $._1,
         b = $._2;
         var m = lightness - chroma / 2;
         return {ctor: "_Tuple3"
                ,_0: r + m
                ,_1: g + m
                ,_2: b + m};
      }();
   });
   var toRgb = function (color) {
      return function () {
         switch (color.ctor)
         {case "HSLA":
            return function () {
                 var $ = A3(hslToRgb,
                 color._0,
                 color._1,
                 color._2),
                 r = $._0,
                 g = $._1,
                 b = $._2;
                 return {_: {}
                        ,alpha: color._3
                        ,blue: $Basics.round(255 * b)
                        ,green: $Basics.round(255 * g)
                        ,red: $Basics.round(255 * r)};
              }();
            case "RGBA": return {_: {}
                                ,alpha: color._3
                                ,blue: color._2
                                ,green: color._1
                                ,red: color._0};}
         _U.badCase($moduleName,
         "between lines 115 and 123");
      }();
   };
   var toHsl = function (color) {
      return function () {
         switch (color.ctor)
         {case "HSLA": return {_: {}
                              ,alpha: color._3
                              ,hue: color._0
                              ,lightness: color._2
                              ,saturation: color._1};
            case "RGBA":
            return function () {
                 var $ = A3(rgbToHsl,
                 color._0,
                 color._1,
                 color._2),
                 h = $._0,
                 s = $._1,
                 l = $._2;
                 return {_: {}
                        ,alpha: color._3
                        ,hue: h
                        ,lightness: l
                        ,saturation: s};
              }();}
         _U.badCase($moduleName,
         "between lines 105 and 112");
      }();
   };
   var HSLA = F4(function (a,
   b,
   c,
   d) {
      return {ctor: "HSLA"
             ,_0: a
             ,_1: b
             ,_2: c
             ,_3: d};
   });
   var hsla = F4(function (hue,
   saturation,
   lightness,
   alpha) {
      return A4(HSLA,
      hue - $Basics.turns($Basics.toFloat($Basics.floor(hue / (2 * $Basics.pi)))),
      saturation,
      lightness,
      alpha);
   });
   var hsl = F3(function (hue,
   saturation,
   lightness) {
      return A4(hsla,
      hue,
      saturation,
      lightness,
      1);
   });
   var complement = function (color) {
      return function () {
         switch (color.ctor)
         {case "HSLA": return A4(hsla,
              color._0 + $Basics.degrees(180),
              color._1,
              color._2,
              color._3);
            case "RGBA":
            return function () {
                 var $ = A3(rgbToHsl,
                 color._0,
                 color._1,
                 color._2),
                 h = $._0,
                 s = $._1,
                 l = $._2;
                 return A4(hsla,
                 h + $Basics.degrees(180),
                 s,
                 l,
                 color._3);
              }();}
         _U.badCase($moduleName,
         "between lines 96 and 102");
      }();
   };
   var grayscale = function (p) {
      return A4(HSLA,0,0,1 - p,1);
   };
   var greyscale = function (p) {
      return A4(HSLA,0,0,1 - p,1);
   };
   var RGBA = F4(function (a,
   b,
   c,
   d) {
      return {ctor: "RGBA"
             ,_0: a
             ,_1: b
             ,_2: c
             ,_3: d};
   });
   var rgba = RGBA;
   var rgb = F3(function (r,g,b) {
      return A4(RGBA,r,g,b,1);
   });
   var lightRed = A4(RGBA,
   239,
   41,
   41,
   1);
   var red = A4(RGBA,204,0,0,1);
   var darkRed = A4(RGBA,
   164,
   0,
   0,
   1);
   var lightOrange = A4(RGBA,
   252,
   175,
   62,
   1);
   var orange = A4(RGBA,
   245,
   121,
   0,
   1);
   var darkOrange = A4(RGBA,
   206,
   92,
   0,
   1);
   var lightYellow = A4(RGBA,
   255,
   233,
   79,
   1);
   var yellow = A4(RGBA,
   237,
   212,
   0,
   1);
   var darkYellow = A4(RGBA,
   196,
   160,
   0,
   1);
   var lightGreen = A4(RGBA,
   138,
   226,
   52,
   1);
   var green = A4(RGBA,
   115,
   210,
   22,
   1);
   var darkGreen = A4(RGBA,
   78,
   154,
   6,
   1);
   var lightBlue = A4(RGBA,
   114,
   159,
   207,
   1);
   var blue = A4(RGBA,
   52,
   101,
   164,
   1);
   var darkBlue = A4(RGBA,
   32,
   74,
   135,
   1);
   var lightPurple = A4(RGBA,
   173,
   127,
   168,
   1);
   var purple = A4(RGBA,
   117,
   80,
   123,
   1);
   var darkPurple = A4(RGBA,
   92,
   53,
   102,
   1);
   var lightBrown = A4(RGBA,
   233,
   185,
   110,
   1);
   var brown = A4(RGBA,
   193,
   125,
   17,
   1);
   var darkBrown = A4(RGBA,
   143,
   89,
   2,
   1);
   var black = A4(RGBA,0,0,0,1);
   var white = A4(RGBA,
   255,
   255,
   255,
   1);
   var lightGrey = A4(RGBA,
   238,
   238,
   236,
   1);
   var grey = A4(RGBA,
   211,
   215,
   207,
   1);
   var darkGrey = A4(RGBA,
   186,
   189,
   182,
   1);
   var lightGray = A4(RGBA,
   238,
   238,
   236,
   1);
   var gray = A4(RGBA,
   211,
   215,
   207,
   1);
   var darkGray = A4(RGBA,
   186,
   189,
   182,
   1);
   var lightCharcoal = A4(RGBA,
   136,
   138,
   133,
   1);
   var charcoal = A4(RGBA,
   85,
   87,
   83,
   1);
   var darkCharcoal = A4(RGBA,
   46,
   52,
   54,
   1);
   _elm.Color.values = {_op: _op
                       ,RGBA: RGBA
                       ,HSLA: HSLA
                       ,rgba: rgba
                       ,rgb: rgb
                       ,hsla: hsla
                       ,hsl: hsl
                       ,grayscale: grayscale
                       ,greyscale: greyscale
                       ,complement: complement
                       ,toHsl: toHsl
                       ,toRgb: toRgb
                       ,fmod: fmod
                       ,rgbToHsl: rgbToHsl
                       ,hslToRgb: hslToRgb
                       ,Linear: Linear
                       ,Radial: Radial
                       ,linear: linear
                       ,radial: radial
                       ,lightRed: lightRed
                       ,red: red
                       ,darkRed: darkRed
                       ,lightOrange: lightOrange
                       ,orange: orange
                       ,darkOrange: darkOrange
                       ,lightYellow: lightYellow
                       ,yellow: yellow
                       ,darkYellow: darkYellow
                       ,lightGreen: lightGreen
                       ,green: green
                       ,darkGreen: darkGreen
                       ,lightBlue: lightBlue
                       ,blue: blue
                       ,darkBlue: darkBlue
                       ,lightPurple: lightPurple
                       ,purple: purple
                       ,darkPurple: darkPurple
                       ,lightBrown: lightBrown
                       ,brown: brown
                       ,darkBrown: darkBrown
                       ,black: black
                       ,white: white
                       ,lightGrey: lightGrey
                       ,grey: grey
                       ,darkGrey: darkGrey
                       ,lightGray: lightGray
                       ,gray: gray
                       ,darkGray: darkGray
                       ,lightCharcoal: lightCharcoal
                       ,charcoal: charcoal
                       ,darkCharcoal: darkCharcoal};
   return _elm.Color.values;
};
Elm.Dict = Elm.Dict || {};
Elm.Dict.make = function (_elm) {
   "use strict";
   _elm.Dict = _elm.Dict || {};
   if (_elm.Dict.values)
   return _elm.Dict.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Dict",
   $Basics = Elm.Basics.make(_elm),
   $List = Elm.List.make(_elm),
   $Maybe = Elm.Maybe.make(_elm),
   $Native$Debug = Elm.Native.Debug.make(_elm),
   $String = Elm.String.make(_elm);
   var foldr = F3(function (f,
   acc,
   t) {
      return function () {
         switch (t.ctor)
         {case "RBEmpty":
            switch (t._0.ctor)
              {case "LBlack": return acc;}
              break;
            case "RBNode": return A3(foldr,
              f,
              A3(f,
              t._1,
              t._2,
              A3(foldr,f,acc,t._4)),
              t._3);}
         _U.badCase($moduleName,
         "between lines 409 and 417");
      }();
   });
   var keys = function (dict) {
      return A3(foldr,
      F3(function (key,
      value,
      keyList) {
         return A2($List._op["::"],
         key,
         keyList);
      }),
      _L.fromArray([]),
      dict);
   };
   var values = function (dict) {
      return A3(foldr,
      F3(function (key,
      value,
      valueList) {
         return A2($List._op["::"],
         value,
         valueList);
      }),
      _L.fromArray([]),
      dict);
   };
   var toList = function (dict) {
      return A3(foldr,
      F3(function (key,value,list) {
         return A2($List._op["::"],
         {ctor: "_Tuple2"
         ,_0: key
         ,_1: value},
         list);
      }),
      _L.fromArray([]),
      dict);
   };
   var foldl = F3(function (f,
   acc,
   dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            switch (dict._0.ctor)
              {case "LBlack": return acc;}
              break;
            case "RBNode": return A3(foldl,
              f,
              A3(f,
              dict._1,
              dict._2,
              A3(foldl,f,acc,dict._3)),
              dict._4);}
         _U.badCase($moduleName,
         "between lines 398 and 406");
      }();
   });
   var isBBlack = function (dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            switch (dict._0.ctor)
              {case "LBBlack": return true;}
              break;
            case "RBNode":
            switch (dict._0.ctor)
              {case "BBlack": return true;}
              break;}
         return false;
      }();
   };
   var showFlag = function (f) {
      return function () {
         switch (f.ctor)
         {case "Insert": return "Insert";
            case "Remove": return "Remove";
            case "Same": return "Same";}
         _U.badCase($moduleName,
         "between lines 174 and 180");
      }();
   };
   var Same = {ctor: "Same"};
   var Remove = {ctor: "Remove"};
   var Insert = {ctor: "Insert"};
   var get = F2(function (targetKey,
   dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            switch (dict._0.ctor)
              {case "LBlack":
                 return $Maybe.Nothing;}
              break;
            case "RBNode":
            return function () {
                 var _v29 = A2($Basics.compare,
                 targetKey,
                 dict._1);
                 switch (_v29.ctor)
                 {case "EQ":
                    return $Maybe.Just(dict._2);
                    case "GT": return A2(get,
                      targetKey,
                      dict._4);
                    case "LT": return A2(get,
                      targetKey,
                      dict._3);}
                 _U.badCase($moduleName,
                 "between lines 130 and 136");
              }();}
         _U.badCase($moduleName,
         "between lines 125 and 136");
      }();
   });
   var member = F2(function (key,
   dict) {
      return function () {
         var _v30 = A2(get,key,dict);
         switch (_v30.ctor)
         {case "Just": return true;
            case "Nothing": return false;}
         _U.badCase($moduleName,
         "between lines 139 and 141");
      }();
   });
   var max = function (dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            return $Native$Debug.crash("(max Empty) is not defined");
            case "RBNode":
            switch (dict._4.ctor)
              {case "RBEmpty":
                 return {ctor: "_Tuple2"
                        ,_0: dict._1
                        ,_1: dict._2};}
              return max(dict._4);}
         _U.badCase($moduleName,
         "between lines 101 and 122");
      }();
   };
   var min = function (dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            switch (dict._0.ctor)
              {case "LBlack":
                 return $Native$Debug.crash("(min Empty) is not defined");}
              break;
            case "RBNode":
            switch (dict._3.ctor)
              {case "RBEmpty":
                 switch (dict._3._0.ctor)
                   {case "LBlack":
                      return {ctor: "_Tuple2"
                             ,_0: dict._1
                             ,_1: dict._2};}
                   break;}
              return min(dict._3);}
         _U.badCase($moduleName,
         "between lines 88 and 96");
      }();
   };
   var RBEmpty = function (a) {
      return {ctor: "RBEmpty"
             ,_0: a};
   };
   var RBNode = F5(function (a,
   b,
   c,
   d,
   e) {
      return {ctor: "RBNode"
             ,_0: a
             ,_1: b
             ,_2: c
             ,_3: d
             ,_4: e};
   });
   var showLColor = function (color) {
      return function () {
         switch (color.ctor)
         {case "LBBlack":
            return "LBBlack";
            case "LBlack": return "LBlack";}
         _U.badCase($moduleName,
         "between lines 71 and 73");
      }();
   };
   var LBBlack = {ctor: "LBBlack"};
   var LBlack = {ctor: "LBlack"};
   var empty = RBEmpty(LBlack);
   var map = F2(function (f,dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            switch (dict._0.ctor)
              {case "LBlack":
                 return RBEmpty(LBlack);}
              break;
            case "RBNode": return A5(RBNode,
              dict._0,
              dict._1,
              A2(f,dict._1,dict._2),
              A2(map,f,dict._3),
              A2(map,f,dict._4));}
         _U.badCase($moduleName,
         "between lines 386 and 395");
      }();
   });
   var showNColor = function (c) {
      return function () {
         switch (c.ctor)
         {case "BBlack": return "BBlack";
            case "Black": return "Black";
            case "NBlack": return "NBlack";
            case "Red": return "Red";}
         _U.badCase($moduleName,
         "between lines 57 and 61");
      }();
   };
   var reportRemBug = F4(function (msg,
   c,
   lgot,
   rgot) {
      return $Native$Debug.crash($String.concat(_L.fromArray(["Internal red-black tree invariant violated, expected "
                                                             ,msg
                                                             ," and got "
                                                             ,showNColor(c)
                                                             ,"/"
                                                             ,lgot
                                                             ,"/"
                                                             ,rgot
                                                             ,"\nPlease report this bug to <https://github.com/elm-lang/Elm/issues>"])));
   });
   var NBlack = {ctor: "NBlack"};
   var BBlack = {ctor: "BBlack"};
   var Black = {ctor: "Black"};
   var ensureBlackRoot = function (dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            switch (dict._0.ctor)
              {case "LBlack": return dict;}
              break;
            case "RBNode":
            switch (dict._0.ctor)
              {case "Black": return dict;
                 case "Red": return A5(RBNode,
                   Black,
                   dict._1,
                   dict._2,
                   dict._3,
                   dict._4);}
              break;}
         _U.badCase($moduleName,
         "between lines 146 and 158");
      }();
   };
   var blackish = function (t) {
      return function () {
         switch (t.ctor)
         {case "RBEmpty": return true;
            case "RBNode":
            return _U.eq(t._0,
              Black) || _U.eq(t._0,BBlack);}
         _U.badCase($moduleName,
         "between lines 331 and 333");
      }();
   };
   var blacken = function (t) {
      return function () {
         switch (t.ctor)
         {case "RBEmpty":
            return RBEmpty(LBlack);
            case "RBNode": return A5(RBNode,
              Black,
              t._1,
              t._2,
              t._3,
              t._4);}
         _U.badCase($moduleName,
         "between lines 370 and 372");
      }();
   };
   var Red = {ctor: "Red"};
   var moreBlack = function (color) {
      return function () {
         switch (color.ctor)
         {case "BBlack":
            return $Native$Debug.crash("Can\'t make a double black node more black!");
            case "Black": return BBlack;
            case "NBlack": return Red;
            case "Red": return Black;}
         _U.badCase($moduleName,
         "between lines 236 and 240");
      }();
   };
   var lessBlack = function (color) {
      return function () {
         switch (color.ctor)
         {case "BBlack": return Black;
            case "Black": return Red;
            case "NBlack":
            return $Native$Debug.crash("Can\'t make a negative black node less black!");
            case "Red": return NBlack;}
         _U.badCase($moduleName,
         "between lines 245 and 249");
      }();
   };
   var lessBlackTree = function (dict) {
      return function () {
         switch (dict.ctor)
         {case "RBEmpty":
            switch (dict._0.ctor)
              {case "LBBlack":
                 return RBEmpty(LBlack);}
              break;
            case "RBNode": return A5(RBNode,
              lessBlack(dict._0),
              dict._1,
              dict._2,
              dict._3,
              dict._4);}
         _U.badCase($moduleName,
         "between lines 254 and 256");
      }();
   };
   var redden = function (t) {
      return function () {
         switch (t.ctor)
         {case "RBEmpty":
            return $Native$Debug.crash("can\'t make a Leaf red");
            case "RBNode": return A5(RBNode,
              Red,
              t._1,
              t._2,
              t._3,
              t._4);}
         _U.badCase($moduleName,
         "between lines 378 and 383");
      }();
   };
   var balance_node = function (t) {
      return function () {
         var assemble = function (col) {
            return function (xk) {
               return function (xv) {
                  return function (yk) {
                     return function (yv) {
                        return function (zk) {
                           return function (zv) {
                              return function (a) {
                                 return function (b) {
                                    return function (c) {
                                       return function (d) {
                                          return A5(RBNode,
                                          lessBlack(col),
                                          yk,
                                          yv,
                                          A5(RBNode,Black,xk,xv,a,b),
                                          A5(RBNode,Black,zk,zv,c,d));
                                       };
                                    };
                                 };
                              };
                           };
                        };
                     };
                  };
               };
            };
         };
         return blackish(t) ? function () {
            switch (t.ctor)
            {case "RBNode":
               switch (t._3.ctor)
                 {case "RBNode":
                    switch (t._3._0.ctor)
                      {case "Red":
                         switch (t._3._3.ctor)
                           {case "RBNode":
                              switch (t._3._3._0.ctor)
                                {case "Red":
                                   return assemble(t._0)(t._3._3._1)(t._3._3._2)(t._3._1)(t._3._2)(t._1)(t._2)(t._3._3._3)(t._3._3._4)(t._3._4)(t._4);}
                                break;}
                           switch (t._3._4.ctor)
                           {case "RBNode":
                              switch (t._3._4._0.ctor)
                                {case "Red":
                                   return assemble(t._0)(t._3._1)(t._3._2)(t._3._4._1)(t._3._4._2)(t._1)(t._2)(t._3._3)(t._3._4._3)(t._3._4._4)(t._4);}
                                break;}
                           break;}
                      break;}
                 switch (t._4.ctor)
                 {case "RBNode":
                    switch (t._4._0.ctor)
                      {case "Red":
                         switch (t._4._3.ctor)
                           {case "RBNode":
                              switch (t._4._3._0.ctor)
                                {case "Red":
                                   return assemble(t._0)(t._1)(t._2)(t._4._3._1)(t._4._3._2)(t._4._1)(t._4._2)(t._3)(t._4._3._3)(t._4._3._4)(t._4._4);}
                                break;}
                           switch (t._4._4.ctor)
                           {case "RBNode":
                              switch (t._4._4._0.ctor)
                                {case "Red":
                                   return assemble(t._0)(t._1)(t._2)(t._4._1)(t._4._2)(t._4._4._1)(t._4._4._2)(t._3)(t._4._3)(t._4._4._3)(t._4._4._4);}
                                break;}
                           break;}
                      break;}
                 switch (t._0.ctor)
                 {case "BBlack":
                    switch (t._4.ctor)
                      {case "RBNode":
                         switch (t._4._0.ctor)
                           {case "NBlack":
                              switch (t._4._3.ctor)
                                {case "RBNode":
                                   switch (t._4._3._0.ctor)
                                     {case "Black":
                                        return function () {
                                             switch (t._4._4.ctor)
                                             {case "RBNode":
                                                switch (t._4._4._0.ctor)
                                                  {case "Black":
                                                     return A5(RBNode,
                                                       Black,
                                                       t._4._3._1,
                                                       t._4._3._2,
                                                       A5(RBNode,
                                                       Black,
                                                       t._1,
                                                       t._2,
                                                       t._3,
                                                       t._4._3._3),
                                                       A5(balance,
                                                       Black,
                                                       t._4._1,
                                                       t._4._2,
                                                       t._4._3._4,
                                                       redden(t._4._4)));}
                                                  break;}
                                             return t;
                                          }();}
                                     break;}
                                break;}
                           break;}
                      switch (t._3.ctor)
                      {case "RBNode":
                         switch (t._3._0.ctor)
                           {case "NBlack":
                              switch (t._3._4.ctor)
                                {case "RBNode":
                                   switch (t._3._4._0.ctor)
                                     {case "Black":
                                        return function () {
                                             switch (t._3._3.ctor)
                                             {case "RBNode":
                                                switch (t._3._3._0.ctor)
                                                  {case "Black":
                                                     return A5(RBNode,
                                                       Black,
                                                       t._3._4._1,
                                                       t._3._4._2,
                                                       A5(balance,
                                                       Black,
                                                       t._3._1,
                                                       t._3._2,
                                                       redden(t._3._3),
                                                       t._3._4._3),
                                                       A5(RBNode,
                                                       Black,
                                                       t._1,
                                                       t._2,
                                                       t._3._4._4,
                                                       t._4));}
                                                  break;}
                                             return t;
                                          }();}
                                     break;}
                                break;}
                           break;}
                      break;}
                 break;}
            return t;
         }() : t;
      }();
   };
   var balance = F5(function (c,
   k,
   v,
   l,
   r) {
      return balance_node(A5(RBNode,
      c,
      k,
      v,
      l,
      r));
   });
   var bubble = F5(function (c,
   k,
   v,
   l,
   r) {
      return isBBlack(l) || isBBlack(r) ? A5(balance,
      moreBlack(c),
      k,
      v,
      lessBlackTree(l),
      lessBlackTree(r)) : A5(RBNode,
      c,
      k,
      v,
      l,
      r);
   });
   var remove_max = F5(function (c,
   k,
   v,
   l,
   r) {
      return function () {
         switch (r.ctor)
         {case "RBEmpty": return A3(rem,
              c,
              l,
              r);
            case "RBNode": return A5(bubble,
              c,
              k,
              v,
              l,
              A5(remove_max,
              r._0,
              r._1,
              r._2,
              r._3,
              r._4));}
         _U.badCase($moduleName,
         "between lines 315 and 320");
      }();
   });
   var rem = F3(function (c,l,r) {
      return function () {
         var _v169 = {ctor: "_Tuple2"
                     ,_0: l
                     ,_1: r};
         switch (_v169.ctor)
         {case "_Tuple2":
            switch (_v169._0.ctor)
              {case "RBEmpty":
                 switch (_v169._1.ctor)
                   {case "RBEmpty":
                      return function () {
                           switch (c.ctor)
                           {case "Black":
                              return RBEmpty(LBBlack);
                              case "Red":
                              return RBEmpty(LBlack);}
                           _U.badCase($moduleName,
                           "between lines 274 and 278");
                        }();
                      case "RBNode":
                      return function () {
                           var _v191 = {ctor: "_Tuple3"
                                       ,_0: c
                                       ,_1: _v169._0._0
                                       ,_2: _v169._1._0};
                           switch (_v191.ctor)
                           {case "_Tuple3":
                              switch (_v191._0.ctor)
                                {case "Black":
                                   switch (_v191._1.ctor)
                                     {case "LBlack":
                                        switch (_v191._2.ctor)
                                          {case "Red": return A5(RBNode,
                                               Black,
                                               _v169._1._1,
                                               _v169._1._2,
                                               _v169._1._3,
                                               _v169._1._4);}
                                          break;}
                                     break;}
                                break;}
                           return A4(reportRemBug,
                           "Black/LBlack/Red",
                           c,
                           showLColor(_v169._0._0),
                           showNColor(_v169._1._0));
                        }();}
                   break;
                 case "RBNode":
                 switch (_v169._1.ctor)
                   {case "RBEmpty":
                      return function () {
                           var _v195 = {ctor: "_Tuple3"
                                       ,_0: c
                                       ,_1: _v169._0._0
                                       ,_2: _v169._1._0};
                           switch (_v195.ctor)
                           {case "_Tuple3":
                              switch (_v195._0.ctor)
                                {case "Black":
                                   switch (_v195._1.ctor)
                                     {case "Red":
                                        switch (_v195._2.ctor)
                                          {case "LBlack":
                                             return A5(RBNode,
                                               Black,
                                               _v169._0._1,
                                               _v169._0._2,
                                               _v169._0._3,
                                               _v169._0._4);}
                                          break;}
                                     break;}
                                break;}
                           return A4(reportRemBug,
                           "Black/Red/LBlack",
                           c,
                           showNColor(_v169._0._0),
                           showLColor(_v169._1._0));
                        }();
                      case "RBNode":
                      return function () {
                           var l$ = A5(remove_max,
                           _v169._0._0,
                           _v169._0._1,
                           _v169._0._2,
                           _v169._0._3,
                           _v169._0._4);
                           var r = A5(RBNode,
                           _v169._1._0,
                           _v169._1._1,
                           _v169._1._2,
                           _v169._1._3,
                           _v169._1._4);
                           var l = A5(RBNode,
                           _v169._0._0,
                           _v169._0._1,
                           _v169._0._2,
                           _v169._0._3,
                           _v169._0._4);
                           var $ = max(l),
                           k = $._0,
                           v = $._1;
                           return A5(bubble,c,k,v,l$,r);
                        }();}
                   break;}
              break;}
         _U.badCase($moduleName,
         "between lines 272 and 301");
      }();
   });
   var update = F3(function (k,
   alter,
   dict) {
      return function () {
         var up = function (dict) {
            return function () {
               switch (dict.ctor)
               {case "RBEmpty":
                  switch (dict._0.ctor)
                    {case "LBlack":
                       return function () {
                            var _v206 = alter($Maybe.Nothing);
                            switch (_v206.ctor)
                            {case "Just":
                               return {ctor: "_Tuple2"
                                      ,_0: Insert
                                      ,_1: A5(RBNode,
                                      Red,
                                      k,
                                      _v206._0,
                                      empty,
                                      empty)};
                               case "Nothing":
                               return {ctor: "_Tuple2"
                                      ,_0: Same
                                      ,_1: empty};}
                            _U.badCase($moduleName,
                            "between lines 186 and 190");
                         }();}
                    break;
                  case "RBNode":
                  return function () {
                       var _v208 = A2($Basics.compare,
                       k,
                       dict._1);
                       switch (_v208.ctor)
                       {case "EQ": return function () {
                               var _v209 = alter($Maybe.Just(dict._2));
                               switch (_v209.ctor)
                               {case "Just":
                                  return {ctor: "_Tuple2"
                                         ,_0: Same
                                         ,_1: A5(RBNode,
                                         dict._0,
                                         dict._1,
                                         _v209._0,
                                         dict._3,
                                         dict._4)};
                                  case "Nothing":
                                  return {ctor: "_Tuple2"
                                         ,_0: Remove
                                         ,_1: A3(rem,
                                         dict._0,
                                         dict._3,
                                         dict._4)};}
                               _U.badCase($moduleName,
                               "between lines 193 and 198");
                            }();
                          case "GT": return function () {
                               var $ = up(dict._4),
                               flag = $._0,
                               newRight = $._1;
                               return function () {
                                  switch (flag.ctor)
                                  {case "Insert":
                                     return {ctor: "_Tuple2"
                                            ,_0: Insert
                                            ,_1: A5(balance,
                                            dict._0,
                                            dict._1,
                                            dict._2,
                                            dict._3,
                                            newRight)};
                                     case "Remove":
                                     return {ctor: "_Tuple2"
                                            ,_0: Remove
                                            ,_1: A5(bubble,
                                            dict._0,
                                            dict._1,
                                            dict._2,
                                            dict._3,
                                            newRight)};
                                     case "Same":
                                     return {ctor: "_Tuple2"
                                            ,_0: Same
                                            ,_1: A5(RBNode,
                                            dict._0,
                                            dict._1,
                                            dict._2,
                                            dict._3,
                                            newRight)};}
                                  _U.badCase($moduleName,
                                  "between lines 207 and 212");
                               }();
                            }();
                          case "LT": return function () {
                               var $ = up(dict._3),
                               flag = $._0,
                               newLeft = $._1;
                               return function () {
                                  switch (flag.ctor)
                                  {case "Insert":
                                     return {ctor: "_Tuple2"
                                            ,_0: Insert
                                            ,_1: A5(balance,
                                            dict._0,
                                            dict._1,
                                            dict._2,
                                            newLeft,
                                            dict._4)};
                                     case "Remove":
                                     return {ctor: "_Tuple2"
                                            ,_0: Remove
                                            ,_1: A5(bubble,
                                            dict._0,
                                            dict._1,
                                            dict._2,
                                            newLeft,
                                            dict._4)};
                                     case "Same":
                                     return {ctor: "_Tuple2"
                                            ,_0: Same
                                            ,_1: A5(RBNode,
                                            dict._0,
                                            dict._1,
                                            dict._2,
                                            newLeft,
                                            dict._4)};}
                                  _U.badCase($moduleName,
                                  "between lines 200 and 205");
                               }();
                            }();}
                       _U.badCase($moduleName,
                       "between lines 191 and 212");
                    }();}
               _U.badCase($moduleName,
               "between lines 184 and 212");
            }();
         };
         var $ = up(dict),
         flag = $._0,
         updatedDict = $._1;
         return function () {
            switch (flag.ctor)
            {case "Insert":
               return ensureBlackRoot(updatedDict);
               case "Remove":
               return blacken(updatedDict);
               case "Same":
               return updatedDict;}
            _U.badCase($moduleName,
            "between lines 214 and 220");
         }();
      }();
   });
   var insert = F3(function (key,
   value,
   dict) {
      return A3(update,
      key,
      $Basics.always($Maybe.Just(value)),
      dict);
   });
   var singleton = F2(function (key,
   value) {
      return A3(insert,
      key,
      value,
      RBEmpty(LBlack));
   });
   var union = F2(function (t1,
   t2) {
      return A3(foldl,
      insert,
      t2,
      t1);
   });
   var fromList = function (assocs) {
      return A3($List.foldl,
      F2(function (_v214,dict) {
         return function () {
            switch (_v214.ctor)
            {case "_Tuple2":
               return A3(insert,
                 _v214._0,
                 _v214._1,
                 dict);}
            _U.badCase($moduleName,
            "on line 458, column 38 to 59");
         }();
      }),
      empty,
      assocs);
   };
   var filter = F2(function (predicate,
   dictionary) {
      return function () {
         var add = F3(function (key,
         value,
         dict) {
            return A2(predicate,
            key,
            value) ? A3(insert,
            key,
            value,
            dict) : dict;
         });
         return A3(foldl,
         add,
         empty,
         dictionary);
      }();
   });
   var intersect = F2(function (t1,
   t2) {
      return A2(filter,
      F2(function (k,_v218) {
         return function () {
            return A2(member,k,t2);
         }();
      }),
      t1);
   });
   var partition = F2(function (predicate,
   dict) {
      return function () {
         var add = F3(function (key,
         value,
         _v220) {
            return function () {
               switch (_v220.ctor)
               {case "_Tuple2":
                  return A2(predicate,
                    key,
                    value) ? {ctor: "_Tuple2"
                             ,_0: A3(insert,
                             key,
                             value,
                             _v220._0)
                             ,_1: _v220._1} : {ctor: "_Tuple2"
                                              ,_0: _v220._0
                                              ,_1: A3(insert,
                                              key,
                                              value,
                                              _v220._1)};}
               _U.badCase($moduleName,
               "between lines 479 and 481");
            }();
         });
         return A3(foldl,
         add,
         {ctor: "_Tuple2"
         ,_0: empty
         ,_1: empty},
         dict);
      }();
   });
   var remove = F2(function (key,
   dict) {
      return A3(update,
      key,
      $Basics.always($Maybe.Nothing),
      dict);
   });
   var diff = F2(function (t1,t2) {
      return A3(foldl,
      F3(function (k,v,t) {
         return A2(remove,k,t);
      }),
      t1,
      t2);
   });
   _elm.Dict.values = {_op: _op
                      ,empty: empty
                      ,singleton: singleton
                      ,insert: insert
                      ,update: update
                      ,get: get
                      ,remove: remove
                      ,member: member
                      ,filter: filter
                      ,partition: partition
                      ,foldl: foldl
                      ,foldr: foldr
                      ,map: map
                      ,union: union
                      ,intersect: intersect
                      ,diff: diff
                      ,keys: keys
                      ,values: values
                      ,toList: toList
                      ,fromList: fromList};
   return _elm.Dict.values;
};
Elm.Graphics = Elm.Graphics || {};
Elm.Graphics.Collage = Elm.Graphics.Collage || {};
Elm.Graphics.Collage.make = function (_elm) {
   "use strict";
   _elm.Graphics = _elm.Graphics || {};
   _elm.Graphics.Collage = _elm.Graphics.Collage || {};
   if (_elm.Graphics.Collage.values)
   return _elm.Graphics.Collage.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Graphics.Collage",
   $Basics = Elm.Basics.make(_elm),
   $Color = Elm.Color.make(_elm),
   $Graphics$Element = Elm.Graphics.Element.make(_elm),
   $List = Elm.List.make(_elm),
   $Native$Graphics$Collage = Elm.Native.Graphics.Collage.make(_elm),
   $Transform2D = Elm.Transform2D.make(_elm);
   var ngon = F2(function (n,r) {
      return function () {
         var m = $Basics.toFloat(n);
         var t = 2 * $Basics.pi / m;
         var f = function (i) {
            return {ctor: "_Tuple2"
                   ,_0: r * $Basics.cos(t * i)
                   ,_1: r * $Basics.sin(t * i)};
         };
         return A2($List.map,
         f,
         _L.range(0,m - 1));
      }();
   });
   var oval = F2(function (w,h) {
      return function () {
         var hh = h / 2;
         var hw = w / 2;
         var n = 50;
         var t = 2 * $Basics.pi / n;
         var f = function (i) {
            return {ctor: "_Tuple2"
                   ,_0: hw * $Basics.cos(t * i)
                   ,_1: hh * $Basics.sin(t * i)};
         };
         return A2($List.map,
         f,
         _L.range(0,n - 1));
      }();
   });
   var circle = function (r) {
      return A2(oval,2 * r,2 * r);
   };
   var rect = F2(function (w,h) {
      return function () {
         var hh = h / 2;
         var hw = w / 2;
         return _L.fromArray([{ctor: "_Tuple2"
                              ,_0: 0 - hw
                              ,_1: 0 - hh}
                             ,{ctor: "_Tuple2"
                              ,_0: 0 - hw
                              ,_1: hh}
                             ,{ctor: "_Tuple2",_0: hw,_1: hh}
                             ,{ctor: "_Tuple2"
                              ,_0: hw
                              ,_1: 0 - hh}]);
      }();
   });
   var square = function (n) {
      return A2(rect,n,n);
   };
   var polygon = function (points) {
      return points;
   };
   var segment = F2(function (p1,
   p2) {
      return _L.fromArray([p1,p2]);
   });
   var path = function (ps) {
      return ps;
   };
   var collage = $Native$Graphics$Collage.collage;
   var alpha = F2(function (a,f) {
      return _U.replace([["alpha"
                         ,a]],
      f);
   });
   var rotate = F2(function (t,f) {
      return _U.replace([["theta"
                         ,f.theta + t]],
      f);
   });
   var scale = F2(function (s,f) {
      return _U.replace([["scale"
                         ,f.scale * s]],
      f);
   });
   var moveY = F2(function (y,f) {
      return _U.replace([["y"
                         ,f.y + y]],
      f);
   });
   var moveX = F2(function (x,f) {
      return _U.replace([["x"
                         ,f.x + x]],
      f);
   });
   var move = F2(function (_v0,f) {
      return function () {
         switch (_v0.ctor)
         {case "_Tuple2":
            return _U.replace([["x"
                               ,f.x + _v0._0]
                              ,["y",f.y + _v0._1]],
              f);}
         _U.badCase($moduleName,
         "on line 179, column 20 to 48");
      }();
   });
   var form = function (f) {
      return {_: {}
             ,alpha: 1
             ,form: f
             ,scale: 1
             ,theta: 0
             ,x: 0
             ,y: 0};
   };
   var Fill = function (a) {
      return {ctor: "Fill",_0: a};
   };
   var Line = function (a) {
      return {ctor: "Line",_0: a};
   };
   var FGroup = F2(function (a,b) {
      return {ctor: "FGroup"
             ,_0: a
             ,_1: b};
   });
   var group = function (fs) {
      return form(A2(FGroup,
      $Transform2D.identity,
      fs));
   };
   var groupTransform = F2(function (matrix,
   fs) {
      return form(A2(FGroup,
      matrix,
      fs));
   });
   var FElement = function (a) {
      return {ctor: "FElement"
             ,_0: a};
   };
   var toForm = function (e) {
      return form(FElement(e));
   };
   var FImage = F4(function (a,
   b,
   c,
   d) {
      return {ctor: "FImage"
             ,_0: a
             ,_1: b
             ,_2: c
             ,_3: d};
   });
   var sprite = F4(function (w,
   h,
   pos,
   src) {
      return form(A4(FImage,
      w,
      h,
      pos,
      src));
   });
   var FShape = F2(function (a,b) {
      return {ctor: "FShape"
             ,_0: a
             ,_1: b};
   });
   var fill = F2(function (style,
   shape) {
      return form(A2(FShape,
      Fill(style),
      shape));
   });
   var outlined = F2(function (style,
   shape) {
      return form(A2(FShape,
      Line(style),
      shape));
   });
   var FPath = F2(function (a,b) {
      return {ctor: "FPath"
             ,_0: a
             ,_1: b};
   });
   var traced = F2(function (style,
   path) {
      return form(A2(FPath,
      style,
      path));
   });
   var LineStyle = F6(function (a,
   b,
   c,
   d,
   e,
   f) {
      return {_: {}
             ,cap: c
             ,color: a
             ,dashOffset: f
             ,dashing: e
             ,join: d
             ,width: b};
   });
   var Clipped = {ctor: "Clipped"};
   var Sharp = function (a) {
      return {ctor: "Sharp",_0: a};
   };
   var Smooth = {ctor: "Smooth"};
   var Padded = {ctor: "Padded"};
   var Round = {ctor: "Round"};
   var Flat = {ctor: "Flat"};
   var defaultLine = {_: {}
                     ,cap: Flat
                     ,color: $Color.black
                     ,dashOffset: 0
                     ,dashing: _L.fromArray([])
                     ,join: Sharp(10)
                     ,width: 1};
   var solid = function (clr) {
      return _U.replace([["color"
                         ,clr]],
      defaultLine);
   };
   var dashed = function (clr) {
      return _U.replace([["color"
                         ,clr]
                        ,["dashing"
                         ,_L.fromArray([8,4])]],
      defaultLine);
   };
   var dotted = function (clr) {
      return _U.replace([["color"
                         ,clr]
                        ,["dashing"
                         ,_L.fromArray([3,3])]],
      defaultLine);
   };
   var Grad = function (a) {
      return {ctor: "Grad",_0: a};
   };
   var gradient = F2(function (grad,
   shape) {
      return A2(fill,
      Grad(grad),
      shape);
   });
   var Texture = function (a) {
      return {ctor: "Texture"
             ,_0: a};
   };
   var textured = F2(function (src,
   shape) {
      return A2(fill,
      Texture(src),
      shape);
   });
   var Solid = function (a) {
      return {ctor: "Solid",_0: a};
   };
   var filled = F2(function (color,
   shape) {
      return A2(fill,
      Solid(color),
      shape);
   });
   var Form = F6(function (a,
   b,
   c,
   d,
   e,
   f) {
      return {_: {}
             ,alpha: e
             ,form: f
             ,scale: b
             ,theta: a
             ,x: c
             ,y: d};
   });
   _elm.Graphics.Collage.values = {_op: _op
                                  ,Form: Form
                                  ,Solid: Solid
                                  ,Texture: Texture
                                  ,Grad: Grad
                                  ,Flat: Flat
                                  ,Round: Round
                                  ,Padded: Padded
                                  ,Smooth: Smooth
                                  ,Sharp: Sharp
                                  ,Clipped: Clipped
                                  ,LineStyle: LineStyle
                                  ,defaultLine: defaultLine
                                  ,solid: solid
                                  ,dashed: dashed
                                  ,dotted: dotted
                                  ,FPath: FPath
                                  ,FShape: FShape
                                  ,FImage: FImage
                                  ,FElement: FElement
                                  ,FGroup: FGroup
                                  ,Line: Line
                                  ,Fill: Fill
                                  ,form: form
                                  ,fill: fill
                                  ,filled: filled
                                  ,textured: textured
                                  ,gradient: gradient
                                  ,outlined: outlined
                                  ,traced: traced
                                  ,sprite: sprite
                                  ,toForm: toForm
                                  ,group: group
                                  ,groupTransform: groupTransform
                                  ,move: move
                                  ,moveX: moveX
                                  ,moveY: moveY
                                  ,scale: scale
                                  ,rotate: rotate
                                  ,alpha: alpha
                                  ,collage: collage
                                  ,path: path
                                  ,segment: segment
                                  ,polygon: polygon
                                  ,rect: rect
                                  ,square: square
                                  ,oval: oval
                                  ,circle: circle
                                  ,ngon: ngon};
   return _elm.Graphics.Collage.values;
};
Elm.Graphics = Elm.Graphics || {};
Elm.Graphics.Element = Elm.Graphics.Element || {};
Elm.Graphics.Element.make = function (_elm) {
   "use strict";
   _elm.Graphics = _elm.Graphics || {};
   _elm.Graphics.Element = _elm.Graphics.Element || {};
   if (_elm.Graphics.Element.values)
   return _elm.Graphics.Element.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Graphics.Element",
   $Basics = Elm.Basics.make(_elm),
   $Color = Elm.Color.make(_elm),
   $List = Elm.List.make(_elm),
   $Maybe = Elm.Maybe.make(_elm),
   $Native$Graphics$Element = Elm.Native.Graphics.Element.make(_elm);
   var DOut = {ctor: "DOut"};
   var outward = DOut;
   var DIn = {ctor: "DIn"};
   var inward = DIn;
   var DRight = {ctor: "DRight"};
   var right = DRight;
   var DLeft = {ctor: "DLeft"};
   var left = DLeft;
   var DDown = {ctor: "DDown"};
   var down = DDown;
   var DUp = {ctor: "DUp"};
   var up = DUp;
   var Position = F4(function (a,
   b,
   c,
   d) {
      return {_: {}
             ,horizontal: a
             ,vertical: b
             ,x: c
             ,y: d};
   });
   var Relative = function (a) {
      return {ctor: "Relative"
             ,_0: a};
   };
   var relative = Relative;
   var Absolute = function (a) {
      return {ctor: "Absolute"
             ,_0: a};
   };
   var absolute = Absolute;
   var N = {ctor: "N"};
   var bottomLeftAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: N
             ,vertical: N
             ,x: x
             ,y: y};
   });
   var Z = {ctor: "Z"};
   var middle = {_: {}
                ,horizontal: Z
                ,vertical: Z
                ,x: Relative(0.5)
                ,y: Relative(0.5)};
   var midLeft = _U.replace([["horizontal"
                             ,N]
                            ,["x",Absolute(0)]],
   middle);
   var middleAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: Z
             ,vertical: Z
             ,x: x
             ,y: y};
   });
   var midLeftAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: N
             ,vertical: Z
             ,x: x
             ,y: y};
   });
   var midBottomAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: Z
             ,vertical: N
             ,x: x
             ,y: y};
   });
   var P = {ctor: "P"};
   var topLeft = {_: {}
                 ,horizontal: N
                 ,vertical: P
                 ,x: Absolute(0)
                 ,y: Absolute(0)};
   var bottomLeft = _U.replace([["vertical"
                                ,N]],
   topLeft);
   var topRight = _U.replace([["horizontal"
                              ,P]],
   topLeft);
   var bottomRight = _U.replace([["horizontal"
                                 ,P]],
   bottomLeft);
   var midRight = _U.replace([["horizontal"
                              ,P]],
   midLeft);
   var midTop = _U.replace([["vertical"
                            ,P]
                           ,["y",Absolute(0)]],
   middle);
   var midBottom = _U.replace([["vertical"
                               ,N]],
   midTop);
   var topLeftAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: N
             ,vertical: P
             ,x: x
             ,y: y};
   });
   var topRightAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: P
             ,vertical: P
             ,x: x
             ,y: y};
   });
   var bottomRightAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: P
             ,vertical: N
             ,x: x
             ,y: y};
   });
   var midRightAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: P
             ,vertical: Z
             ,x: x
             ,y: y};
   });
   var midTopAt = F2(function (x,
   y) {
      return {_: {}
             ,horizontal: Z
             ,vertical: P
             ,x: x
             ,y: y};
   });
   var Tiled = {ctor: "Tiled"};
   var Cropped = function (a) {
      return {ctor: "Cropped"
             ,_0: a};
   };
   var Fitted = {ctor: "Fitted"};
   var Plain = {ctor: "Plain"};
   var Custom = {ctor: "Custom"};
   var RawHtml = {ctor: "RawHtml"};
   var Spacer = {ctor: "Spacer"};
   var Flow = F2(function (a,b) {
      return {ctor: "Flow"
             ,_0: a
             ,_1: b};
   });
   var Container = F2(function (a,
   b) {
      return {ctor: "Container"
             ,_0: a
             ,_1: b};
   });
   var Image = F4(function (a,
   b,
   c,
   d) {
      return {ctor: "Image"
             ,_0: a
             ,_1: b
             ,_2: c
             ,_3: d};
   });
   var link = F2(function (href,
   e) {
      return function () {
         var p = e.props;
         return {_: {}
                ,element: e.element
                ,props: _U.replace([["href"
                                    ,href]],
                p)};
      }();
   });
   var tag = F2(function (name,e) {
      return function () {
         var p = e.props;
         return {_: {}
                ,element: e.element
                ,props: _U.replace([["tag"
                                    ,name]],
                p)};
      }();
   });
   var color = F2(function (c,e) {
      return function () {
         var p = e.props;
         return {_: {}
                ,element: e.element
                ,props: _U.replace([["color"
                                    ,$Maybe.Just(c)]],
                p)};
      }();
   });
   var opacity = F2(function (o,
   e) {
      return function () {
         var p = e.props;
         return {_: {}
                ,element: e.element
                ,props: _U.replace([["opacity"
                                    ,o]],
                p)};
      }();
   });
   var height = F2(function (nh,
   e) {
      return function () {
         var p = e.props;
         var props = function () {
            var _v0 = e.element;
            switch (_v0.ctor)
            {case "Image":
               return _U.replace([["width"
                                  ,$Basics.round($Basics.toFloat(_v0._1) / $Basics.toFloat(_v0._2) * $Basics.toFloat(nh))]],
                 p);}
            return p;
         }();
         return {_: {}
                ,element: e.element
                ,props: _U.replace([["height"
                                    ,nh]],
                p)};
      }();
   });
   var width = F2(function (nw,e) {
      return function () {
         var p = e.props;
         var props = function () {
            var _v5 = e.element;
            switch (_v5.ctor)
            {case "Image":
               return _U.replace([["height"
                                  ,$Basics.round($Basics.toFloat(_v5._2) / $Basics.toFloat(_v5._1) * $Basics.toFloat(nw))]],
                 p);
               case "RawHtml":
               return _U.replace([["height"
                                  ,$Basics.snd(A2($Native$Graphics$Element.htmlHeight,
                                  nw,
                                  e.element))]],
                 p);}
            return p;
         }();
         return {_: {}
                ,element: e.element
                ,props: _U.replace([["width"
                                    ,nw]],
                props)};
      }();
   });
   var size = F3(function (w,h,e) {
      return A2(height,
      h,
      A2(width,w,e));
   });
   var sizeOf = function (e) {
      return {ctor: "_Tuple2"
             ,_0: e.props.width
             ,_1: e.props.height};
   };
   var heightOf = function (e) {
      return e.props.height;
   };
   var widthOf = function (e) {
      return e.props.width;
   };
   var Element = F2(function (a,
   b) {
      return {_: {}
             ,element: b
             ,props: a};
   });
   var Properties = F9(function (a,
   b,
   c,
   d,
   e,
   f,
   g,
   h,
   i) {
      return {_: {}
             ,click: i
             ,color: e
             ,height: c
             ,hover: h
             ,href: f
             ,id: a
             ,opacity: d
             ,tag: g
             ,width: b};
   });
   var newElement = F3(function (w,
   h,
   e) {
      return {_: {}
             ,element: e
             ,props: A9(Properties,
             $Native$Graphics$Element.guid({ctor: "_Tuple0"}),
             w,
             h,
             1,
             $Maybe.Nothing,
             "",
             "",
             {ctor: "_Tuple0"},
             {ctor: "_Tuple0"})};
   });
   var image = F3(function (w,
   h,
   src) {
      return A3(newElement,
      w,
      h,
      A4(Image,Plain,w,h,src));
   });
   var fittedImage = F3(function (w,
   h,
   src) {
      return A3(newElement,
      w,
      h,
      A4(Image,Fitted,w,h,src));
   });
   var croppedImage = F4(function (pos,
   w,
   h,
   src) {
      return A3(newElement,
      w,
      h,
      A4(Image,Cropped(pos),w,h,src));
   });
   var tiledImage = F3(function (w,
   h,
   src) {
      return A3(newElement,
      w,
      h,
      A4(Image,Tiled,w,h,src));
   });
   var container = F4(function (w,
   h,
   pos,
   e) {
      return A3(newElement,
      w,
      h,
      A2(Container,pos,e));
   });
   var spacer = F2(function (w,h) {
      return A3(newElement,
      w,
      h,
      Spacer);
   });
   var empty = A2(spacer,0,0);
   var flow = F2(function (dir,
   es) {
      return function () {
         var newFlow = F2(function (w,
         h) {
            return A3(newElement,
            w,
            h,
            A2(Flow,dir,es));
         });
         var hs = A2($List.map,
         heightOf,
         es);
         var ws = A2($List.map,
         widthOf,
         es);
         return _U.eq(es,
         _L.fromArray([])) ? empty : function () {
            switch (dir.ctor)
            {case "DDown":
               return A2(newFlow,
                 $List.maximum(ws),
                 $List.sum(hs));
               case "DIn": return A2(newFlow,
                 $List.maximum(ws),
                 $List.maximum(hs));
               case "DLeft": return A2(newFlow,
                 $List.sum(ws),
                 $List.maximum(hs));
               case "DOut": return A2(newFlow,
                 $List.maximum(ws),
                 $List.maximum(hs));
               case "DRight":
               return A2(newFlow,
                 $List.sum(ws),
                 $List.maximum(hs));
               case "DUp": return A2(newFlow,
                 $List.maximum(ws),
                 $List.sum(hs));}
            _U.badCase($moduleName,
            "between lines 280 and 291");
         }();
      }();
   });
   var above = F2(function (hi,
   lo) {
      return A3(newElement,
      A2($Basics.max,
      widthOf(hi),
      widthOf(lo)),
      heightOf(hi) + heightOf(lo),
      A2(Flow,
      DDown,
      _L.fromArray([hi,lo])));
   });
   var below = F2(function (lo,
   hi) {
      return A3(newElement,
      A2($Basics.max,
      widthOf(hi),
      widthOf(lo)),
      heightOf(hi) + heightOf(lo),
      A2(Flow,
      DDown,
      _L.fromArray([hi,lo])));
   });
   var beside = F2(function (lft,
   rht) {
      return A3(newElement,
      widthOf(lft) + widthOf(rht),
      A2($Basics.max,
      heightOf(lft),
      heightOf(rht)),
      A2(Flow,
      right,
      _L.fromArray([lft,rht])));
   });
   var layers = function (es) {
      return function () {
         var hs = A2($List.map,
         heightOf,
         es);
         var ws = A2($List.map,
         widthOf,
         es);
         return A3(newElement,
         $List.maximum(ws),
         $List.maximum(hs),
         A2(Flow,DOut,es));
      }();
   };
   _elm.Graphics.Element.values = {_op: _op
                                  ,Properties: Properties
                                  ,Element: Element
                                  ,empty: empty
                                  ,widthOf: widthOf
                                  ,heightOf: heightOf
                                  ,sizeOf: sizeOf
                                  ,width: width
                                  ,height: height
                                  ,size: size
                                  ,opacity: opacity
                                  ,color: color
                                  ,tag: tag
                                  ,link: link
                                  ,newElement: newElement
                                  ,Image: Image
                                  ,Container: Container
                                  ,Flow: Flow
                                  ,Spacer: Spacer
                                  ,RawHtml: RawHtml
                                  ,Custom: Custom
                                  ,Plain: Plain
                                  ,Fitted: Fitted
                                  ,Cropped: Cropped
                                  ,Tiled: Tiled
                                  ,image: image
                                  ,fittedImage: fittedImage
                                  ,croppedImage: croppedImage
                                  ,tiledImage: tiledImage
                                  ,P: P
                                  ,Z: Z
                                  ,N: N
                                  ,Absolute: Absolute
                                  ,Relative: Relative
                                  ,Position: Position
                                  ,container: container
                                  ,spacer: spacer
                                  ,DUp: DUp
                                  ,DDown: DDown
                                  ,DLeft: DLeft
                                  ,DRight: DRight
                                  ,DIn: DIn
                                  ,DOut: DOut
                                  ,flow: flow
                                  ,above: above
                                  ,below: below
                                  ,beside: beside
                                  ,layers: layers
                                  ,absolute: absolute
                                  ,relative: relative
                                  ,middle: middle
                                  ,topLeft: topLeft
                                  ,topRight: topRight
                                  ,bottomLeft: bottomLeft
                                  ,bottomRight: bottomRight
                                  ,midLeft: midLeft
                                  ,midRight: midRight
                                  ,midTop: midTop
                                  ,midBottom: midBottom
                                  ,middleAt: middleAt
                                  ,topLeftAt: topLeftAt
                                  ,topRightAt: topRightAt
                                  ,bottomLeftAt: bottomLeftAt
                                  ,bottomRightAt: bottomRightAt
                                  ,midLeftAt: midLeftAt
                                  ,midRightAt: midRightAt
                                  ,midTopAt: midTopAt
                                  ,midBottomAt: midBottomAt
                                  ,up: up
                                  ,down: down
                                  ,left: left
                                  ,right: right
                                  ,inward: inward
                                  ,outward: outward};
   return _elm.Graphics.Element.values;
};
Elm.Graphics = Elm.Graphics || {};
Elm.Graphics.Input = Elm.Graphics.Input || {};
Elm.Graphics.Input.make = function (_elm) {
   "use strict";
   _elm.Graphics = _elm.Graphics || {};
   _elm.Graphics.Input = _elm.Graphics.Input || {};
   if (_elm.Graphics.Input.values)
   return _elm.Graphics.Input.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Graphics.Input",
   $Graphics$Element = Elm.Graphics.Element.make(_elm),
   $Native$Graphics$Input = Elm.Native.Graphics.Input.make(_elm),
   $Signal = Elm.Signal.make(_elm);
   var clickable = $Native$Graphics$Input.clickable;
   var hoverable = $Native$Graphics$Input.hoverable;
   var dropDown = $Native$Graphics$Input.dropDown;
   var checkbox = $Native$Graphics$Input.checkbox;
   var customButton = $Native$Graphics$Input.customButton;
   var button = $Native$Graphics$Input.button;
   _elm.Graphics.Input.values = {_op: _op
                                ,button: button
                                ,customButton: customButton
                                ,checkbox: checkbox
                                ,dropDown: dropDown
                                ,hoverable: hoverable
                                ,clickable: clickable};
   return _elm.Graphics.Input.values;
};
Elm.Html = Elm.Html || {};
Elm.Html.make = function (_elm) {
   "use strict";
   _elm.Html = _elm.Html || {};
   if (_elm.Html.values)
   return _elm.Html.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Html",
   $Graphics$Element = Elm.Graphics.Element.make(_elm),
   $VirtualDom = Elm.VirtualDom.make(_elm);
   var fromElement = $VirtualDom.fromElement;
   var toElement = $VirtualDom.toElement;
   var text = $VirtualDom.text;
   var node = $VirtualDom.node;
   var body = node("body");
   var section = node("section");
   var nav = node("nav");
   var article = node("article");
   var aside = node("aside");
   var h1 = node("h1");
   var h2 = node("h2");
   var h3 = node("h3");
   var h4 = node("h4");
   var h5 = node("h5");
   var h6 = node("h6");
   var header = node("header");
   var footer = node("footer");
   var address = node("address");
   var main$ = node("main");
   var p = node("p");
   var hr = node("hr");
   var pre = node("pre");
   var blockquote = node("blockquote");
   var ol = node("ol");
   var ul = node("ul");
   var li = node("li");
   var dl = node("dl");
   var dt = node("dt");
   var dd = node("dd");
   var figure = node("figure");
   var figcaption = node("figcaption");
   var div = node("div");
   var a = node("a");
   var em = node("em");
   var strong = node("strong");
   var small = node("small");
   var s = node("s");
   var cite = node("cite");
   var q = node("q");
   var dfn = node("dfn");
   var abbr = node("abbr");
   var time = node("time");
   var code = node("code");
   var $var = node("var");
   var samp = node("samp");
   var kbd = node("kbd");
   var sub = node("sub");
   var sup = node("sup");
   var i = node("i");
   var b = node("b");
   var u = node("u");
   var mark = node("mark");
   var ruby = node("ruby");
   var rt = node("rt");
   var rp = node("rp");
   var bdi = node("bdi");
   var bdo = node("bdo");
   var span = node("span");
   var br = node("br");
   var wbr = node("wbr");
   var ins = node("ins");
   var del = node("del");
   var img = node("img");
   var iframe = node("iframe");
   var embed = node("embed");
   var object = node("object");
   var param = node("param");
   var video = node("video");
   var audio = node("audio");
   var source = node("source");
   var track = node("track");
   var canvas = node("canvas");
   var svg = node("svg");
   var math = node("math");
   var table = node("table");
   var caption = node("caption");
   var colgroup = node("colgroup");
   var col = node("col");
   var tbody = node("tbody");
   var thead = node("thead");
   var tfoot = node("tfoot");
   var tr = node("tr");
   var td = node("td");
   var th = node("th");
   var form = node("form");
   var fieldset = node("fieldset");
   var legend = node("legend");
   var label = node("label");
   var input = node("input");
   var button = node("button");
   var select = node("select");
   var datalist = node("datalist");
   var optgroup = node("optgroup");
   var option = node("option");
   var textarea = node("textarea");
   var keygen = node("keygen");
   var output = node("output");
   var progress = node("progress");
   var meter = node("meter");
   var details = node("details");
   var summary = node("summary");
   var menuitem = node("menuitem");
   var menu = node("menu");
   _elm.Html.values = {_op: _op
                      ,node: node
                      ,text: text
                      ,toElement: toElement
                      ,fromElement: fromElement
                      ,body: body
                      ,section: section
                      ,nav: nav
                      ,article: article
                      ,aside: aside
                      ,h1: h1
                      ,h2: h2
                      ,h3: h3
                      ,h4: h4
                      ,h5: h5
                      ,h6: h6
                      ,header: header
                      ,footer: footer
                      ,address: address
                      ,main$: main$
                      ,p: p
                      ,hr: hr
                      ,pre: pre
                      ,blockquote: blockquote
                      ,ol: ol
                      ,ul: ul
                      ,li: li
                      ,dl: dl
                      ,dt: dt
                      ,dd: dd
                      ,figure: figure
                      ,figcaption: figcaption
                      ,div: div
                      ,a: a
                      ,em: em
                      ,strong: strong
                      ,small: small
                      ,s: s
                      ,cite: cite
                      ,q: q
                      ,dfn: dfn
                      ,abbr: abbr
                      ,time: time
                      ,code: code
                      ,$var: $var
                      ,samp: samp
                      ,kbd: kbd
                      ,sub: sub
                      ,sup: sup
                      ,i: i
                      ,b: b
                      ,u: u
                      ,mark: mark
                      ,ruby: ruby
                      ,rt: rt
                      ,rp: rp
                      ,bdi: bdi
                      ,bdo: bdo
                      ,span: span
                      ,br: br
                      ,wbr: wbr
                      ,ins: ins
                      ,del: del
                      ,img: img
                      ,iframe: iframe
                      ,embed: embed
                      ,object: object
                      ,param: param
                      ,video: video
                      ,audio: audio
                      ,source: source
                      ,track: track
                      ,canvas: canvas
                      ,svg: svg
                      ,math: math
                      ,table: table
                      ,caption: caption
                      ,colgroup: colgroup
                      ,col: col
                      ,tbody: tbody
                      ,thead: thead
                      ,tfoot: tfoot
                      ,tr: tr
                      ,td: td
                      ,th: th
                      ,form: form
                      ,fieldset: fieldset
                      ,legend: legend
                      ,label: label
                      ,input: input
                      ,button: button
                      ,select: select
                      ,datalist: datalist
                      ,optgroup: optgroup
                      ,option: option
                      ,textarea: textarea
                      ,keygen: keygen
                      ,output: output
                      ,progress: progress
                      ,meter: meter
                      ,details: details
                      ,summary: summary
                      ,menuitem: menuitem
                      ,menu: menu};
   return _elm.Html.values;
};
Elm.Html = Elm.Html || {};
Elm.Html.Attributes = Elm.Html.Attributes || {};
Elm.Html.Attributes.make = function (_elm) {
   "use strict";
   _elm.Html = _elm.Html || {};
   _elm.Html.Attributes = _elm.Html.Attributes || {};
   if (_elm.Html.Attributes.values)
   return _elm.Html.Attributes.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Html.Attributes",
   $Basics = Elm.Basics.make(_elm),
   $Html = Elm.Html.make(_elm),
   $Json$Encode = Elm.Json.Encode.make(_elm),
   $List = Elm.List.make(_elm),
   $String = Elm.String.make(_elm),
   $VirtualDom = Elm.VirtualDom.make(_elm);
   var attribute = $VirtualDom.attribute;
   var property = $VirtualDom.property;
   var stringProperty = F2(function (name,
   string) {
      return A2(property,
      name,
      $Json$Encode.string(string));
   });
   var $class = function (name) {
      return A2(stringProperty,
      "className",
      name);
   };
   var id = function (name) {
      return A2(stringProperty,
      "id",
      name);
   };
   var title = function (name) {
      return A2(stringProperty,
      "title",
      name);
   };
   var accesskey = function ($char) {
      return A2(stringProperty,
      "accesskey",
      $String.fromList(_L.fromArray([$char])));
   };
   var contextmenu = function (value) {
      return A2(stringProperty,
      "contextmenu",
      value);
   };
   var dir = function (value) {
      return A2(stringProperty,
      "dir",
      value);
   };
   var draggable = function (value) {
      return A2(stringProperty,
      "draggable",
      value);
   };
   var dropzone = function (value) {
      return A2(stringProperty,
      "dropzone",
      value);
   };
   var itemprop = function (value) {
      return A2(stringProperty,
      "itemprop",
      value);
   };
   var lang = function (value) {
      return A2(stringProperty,
      "lang",
      value);
   };
   var tabindex = function (n) {
      return A2(stringProperty,
      "tabIndex",
      $Basics.toString(n));
   };
   var charset = function (value) {
      return A2(stringProperty,
      "charset",
      value);
   };
   var content = function (value) {
      return A2(stringProperty,
      "content",
      value);
   };
   var httpEquiv = function (value) {
      return A2(stringProperty,
      "httpEquiv",
      value);
   };
   var language = function (value) {
      return A2(stringProperty,
      "language",
      value);
   };
   var src = function (value) {
      return A2(stringProperty,
      "src",
      value);
   };
   var height = function (value) {
      return A2(stringProperty,
      "height",
      $Basics.toString(value));
   };
   var width = function (value) {
      return A2(stringProperty,
      "width",
      $Basics.toString(value));
   };
   var alt = function (value) {
      return A2(stringProperty,
      "alt",
      value);
   };
   var poster = function (value) {
      return A2(stringProperty,
      "poster",
      value);
   };
   var kind = function (value) {
      return A2(stringProperty,
      "kind",
      value);
   };
   var srclang = function (value) {
      return A2(stringProperty,
      "srclang",
      value);
   };
   var sandbox = function (value) {
      return A2(stringProperty,
      "sandbox",
      value);
   };
   var srcdoc = function (value) {
      return A2(stringProperty,
      "srcdoc",
      value);
   };
   var type$ = function (value) {
      return A2(stringProperty,
      "type",
      value);
   };
   var value = function (value) {
      return A2(stringProperty,
      "value",
      value);
   };
   var placeholder = function (value) {
      return A2(stringProperty,
      "placeholder",
      value);
   };
   var accept = function (value) {
      return A2(stringProperty,
      "accept",
      value);
   };
   var acceptCharset = function (value) {
      return A2(stringProperty,
      "acceptCharset",
      value);
   };
   var action = function (value) {
      return A2(stringProperty,
      "action",
      value);
   };
   var autocomplete = function (bool) {
      return A2(stringProperty,
      "autocomplete",
      bool ? "on" : "off");
   };
   var autosave = function (value) {
      return A2(stringProperty,
      "autosave",
      value);
   };
   var enctype = function (value) {
      return A2(stringProperty,
      "enctype",
      value);
   };
   var formaction = function (value) {
      return A2(stringProperty,
      "formaction",
      value);
   };
   var list = function (value) {
      return A2(stringProperty,
      "list",
      value);
   };
   var minlength = function (n) {
      return A2(stringProperty,
      "minLength",
      $Basics.toString(n));
   };
   var maxlength = function (n) {
      return A2(stringProperty,
      "maxLength",
      $Basics.toString(n));
   };
   var method = function (value) {
      return A2(stringProperty,
      "method",
      value);
   };
   var name = function (value) {
      return A2(stringProperty,
      "name",
      value);
   };
   var pattern = function (value) {
      return A2(stringProperty,
      "pattern",
      value);
   };
   var size = function (n) {
      return A2(stringProperty,
      "size",
      $Basics.toString(n));
   };
   var $for = function (value) {
      return A2(stringProperty,
      "htmlFor",
      value);
   };
   var form = function (value) {
      return A2(stringProperty,
      "form",
      value);
   };
   var max = function (value) {
      return A2(stringProperty,
      "max",
      value);
   };
   var min = function (value) {
      return A2(stringProperty,
      "min",
      value);
   };
   var step = function (n) {
      return A2(stringProperty,
      "step",
      $Basics.toString(n));
   };
   var cols = function (n) {
      return A2(stringProperty,
      "cols",
      $Basics.toString(n));
   };
   var rows = function (n) {
      return A2(stringProperty,
      "rows",
      $Basics.toString(n));
   };
   var wrap = function (value) {
      return A2(stringProperty,
      "wrap",
      value);
   };
   var ismap = function (value) {
      return A2(stringProperty,
      "ismap",
      value);
   };
   var usemap = function (value) {
      return A2(stringProperty,
      "usemap",
      value);
   };
   var shape = function (value) {
      return A2(stringProperty,
      "shape",
      value);
   };
   var coords = function (value) {
      return A2(stringProperty,
      "coords",
      value);
   };
   var challenge = function (value) {
      return A2(stringProperty,
      "challenge",
      value);
   };
   var keytype = function (value) {
      return A2(stringProperty,
      "keytype",
      value);
   };
   var align = function (value) {
      return A2(stringProperty,
      "align",
      value);
   };
   var cite = function (value) {
      return A2(stringProperty,
      "cite",
      value);
   };
   var href = function (value) {
      return A2(stringProperty,
      "href",
      value);
   };
   var target = function (value) {
      return A2(stringProperty,
      "target",
      value);
   };
   var downloadAs = function (value) {
      return A2(stringProperty,
      "download",
      value);
   };
   var hreflang = function (value) {
      return A2(stringProperty,
      "hreflang",
      value);
   };
   var media = function (value) {
      return A2(stringProperty,
      "media",
      value);
   };
   var ping = function (value) {
      return A2(stringProperty,
      "ping",
      value);
   };
   var rel = function (value) {
      return A2(stringProperty,
      "rel",
      value);
   };
   var datetime = function (value) {
      return A2(stringProperty,
      "datetime",
      value);
   };
   var pubdate = function (value) {
      return A2(stringProperty,
      "pubdate",
      value);
   };
   var start = function (n) {
      return A2(stringProperty,
      "start",
      $Basics.toString(n));
   };
   var colspan = function (n) {
      return A2(stringProperty,
      "colSpan",
      $Basics.toString(n));
   };
   var headers = function (value) {
      return A2(stringProperty,
      "headers",
      value);
   };
   var rowspan = function (n) {
      return A2(stringProperty,
      "rowSpan",
      $Basics.toString(n));
   };
   var scope = function (value) {
      return A2(stringProperty,
      "scope",
      value);
   };
   var manifest = function (value) {
      return A2(stringProperty,
      "manifest",
      value);
   };
   var boolProperty = F2(function (name,
   bool) {
      return A2(property,
      name,
      $Json$Encode.bool(bool));
   });
   var hidden = function (bool) {
      return A2(boolProperty,
      "hidden",
      bool);
   };
   var contenteditable = function (bool) {
      return A2(boolProperty,
      "contentEditable",
      bool);
   };
   var spellcheck = function (bool) {
      return A2(boolProperty,
      "spellcheck",
      bool);
   };
   var async = function (bool) {
      return A2(boolProperty,
      "async",
      bool);
   };
   var defer = function (bool) {
      return A2(boolProperty,
      "defer",
      bool);
   };
   var scoped = function (bool) {
      return A2(boolProperty,
      "scoped",
      bool);
   };
   var autoplay = function (bool) {
      return A2(boolProperty,
      "autoplay",
      bool);
   };
   var controls = function (bool) {
      return A2(boolProperty,
      "controls",
      bool);
   };
   var loop = function (bool) {
      return A2(boolProperty,
      "loop",
      bool);
   };
   var preload = function (bool) {
      return A2(boolProperty,
      "preload",
      bool);
   };
   var $default = function (bool) {
      return A2(boolProperty,
      "default",
      bool);
   };
   var seamless = function (bool) {
      return A2(boolProperty,
      "seamless",
      bool);
   };
   var checked = function (bool) {
      return A2(boolProperty,
      "checked",
      bool);
   };
   var selected = function (bool) {
      return A2(boolProperty,
      "selected",
      bool);
   };
   var autofocus = function (bool) {
      return A2(boolProperty,
      "autofocus",
      bool);
   };
   var disabled = function (bool) {
      return A2(boolProperty,
      "disabled",
      bool);
   };
   var multiple = function (bool) {
      return A2(boolProperty,
      "multiple",
      bool);
   };
   var novalidate = function (bool) {
      return A2(boolProperty,
      "noValidate",
      bool);
   };
   var readonly = function (bool) {
      return A2(boolProperty,
      "readOnly",
      bool);
   };
   var required = function (bool) {
      return A2(boolProperty,
      "required",
      bool);
   };
   var download = function (bool) {
      return A2(boolProperty,
      "download",
      bool);
   };
   var reversed = function (bool) {
      return A2(boolProperty,
      "reversed",
      bool);
   };
   var classList = function (list) {
      return $class($String.join(" ")($List.map($Basics.fst)($List.filter($Basics.snd)(list))));
   };
   var style = function (props) {
      return property("style")($Json$Encode.object($List.map(function (_v0) {
         return function () {
            switch (_v0.ctor)
            {case "_Tuple2":
               return {ctor: "_Tuple2"
                      ,_0: _v0._0
                      ,_1: $Json$Encode.string(_v0._1)};}
            _U.badCase($moduleName,
            "on line 134, column 35 to 57");
         }();
      })(props)));
   };
   var key = function (k) {
      return A2(stringProperty,
      "key",
      k);
   };
   _elm.Html.Attributes.values = {_op: _op
                                 ,key: key
                                 ,style: style
                                 ,classList: classList
                                 ,property: property
                                 ,stringProperty: stringProperty
                                 ,boolProperty: boolProperty
                                 ,attribute: attribute
                                 ,$class: $class
                                 ,hidden: hidden
                                 ,id: id
                                 ,title: title
                                 ,accesskey: accesskey
                                 ,contenteditable: contenteditable
                                 ,contextmenu: contextmenu
                                 ,dir: dir
                                 ,draggable: draggable
                                 ,dropzone: dropzone
                                 ,itemprop: itemprop
                                 ,lang: lang
                                 ,spellcheck: spellcheck
                                 ,tabindex: tabindex
                                 ,async: async
                                 ,charset: charset
                                 ,content: content
                                 ,defer: defer
                                 ,httpEquiv: httpEquiv
                                 ,language: language
                                 ,scoped: scoped
                                 ,src: src
                                 ,height: height
                                 ,width: width
                                 ,alt: alt
                                 ,autoplay: autoplay
                                 ,controls: controls
                                 ,loop: loop
                                 ,preload: preload
                                 ,poster: poster
                                 ,$default: $default
                                 ,kind: kind
                                 ,srclang: srclang
                                 ,sandbox: sandbox
                                 ,seamless: seamless
                                 ,srcdoc: srcdoc
                                 ,type$: type$
                                 ,value: value
                                 ,checked: checked
                                 ,placeholder: placeholder
                                 ,selected: selected
                                 ,accept: accept
                                 ,acceptCharset: acceptCharset
                                 ,action: action
                                 ,autocomplete: autocomplete
                                 ,autofocus: autofocus
                                 ,autosave: autosave
                                 ,disabled: disabled
                                 ,enctype: enctype
                                 ,formaction: formaction
                                 ,list: list
                                 ,minlength: minlength
                                 ,maxlength: maxlength
                                 ,method: method
                                 ,multiple: multiple
                                 ,name: name
                                 ,novalidate: novalidate
                                 ,pattern: pattern
                                 ,readonly: readonly
                                 ,required: required
                                 ,size: size
                                 ,$for: $for
                                 ,form: form
                                 ,max: max
                                 ,min: min
                                 ,step: step
                                 ,cols: cols
                                 ,rows: rows
                                 ,wrap: wrap
                                 ,ismap: ismap
                                 ,usemap: usemap
                                 ,shape: shape
                                 ,coords: coords
                                 ,challenge: challenge
                                 ,keytype: keytype
                                 ,align: align
                                 ,cite: cite
                                 ,href: href
                                 ,target: target
                                 ,download: download
                                 ,downloadAs: downloadAs
                                 ,hreflang: hreflang
                                 ,media: media
                                 ,ping: ping
                                 ,rel: rel
                                 ,datetime: datetime
                                 ,pubdate: pubdate
                                 ,reversed: reversed
                                 ,start: start
                                 ,colspan: colspan
                                 ,headers: headers
                                 ,rowspan: rowspan
                                 ,scope: scope
                                 ,manifest: manifest};
   return _elm.Html.Attributes.values;
};
Elm.Json = Elm.Json || {};
Elm.Json.Decode = Elm.Json.Decode || {};
Elm.Json.Decode.make = function (_elm) {
   "use strict";
   _elm.Json = _elm.Json || {};
   _elm.Json.Decode = _elm.Json.Decode || {};
   if (_elm.Json.Decode.values)
   return _elm.Json.Decode.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Json.Decode",
   $Array = Elm.Array.make(_elm),
   $Dict = Elm.Dict.make(_elm),
   $Json$Encode = Elm.Json.Encode.make(_elm),
   $List = Elm.List.make(_elm),
   $Maybe = Elm.Maybe.make(_elm),
   $Native$Json = Elm.Native.Json.make(_elm),
   $Result = Elm.Result.make(_elm);
   var tuple8 = $Native$Json.decodeTuple8;
   var tuple7 = $Native$Json.decodeTuple7;
   var tuple6 = $Native$Json.decodeTuple6;
   var tuple5 = $Native$Json.decodeTuple5;
   var tuple4 = $Native$Json.decodeTuple4;
   var tuple3 = $Native$Json.decodeTuple3;
   var tuple2 = $Native$Json.decodeTuple2;
   var tuple1 = $Native$Json.decodeTuple1;
   var succeed = $Native$Json.succeed;
   var fail = $Native$Json.fail;
   var andThen = $Native$Json.andThen;
   var customDecoder = $Native$Json.customDecoder;
   var decodeValue = $Native$Json.runDecoderValue;
   var value = $Native$Json.decodeValue;
   var maybe = $Native$Json.decodeMaybe;
   var $null = $Native$Json.decodeNull;
   var array = $Native$Json.decodeArray;
   var list = $Native$Json.decodeList;
   var bool = $Native$Json.decodeBool;
   var $int = $Native$Json.decodeInt;
   var $float = $Native$Json.decodeFloat;
   var string = $Native$Json.decodeString;
   var oneOf = $Native$Json.oneOf;
   var keyValuePairs = $Native$Json.decodeKeyValuePairs;
   var object8 = $Native$Json.decodeObject8;
   var object7 = $Native$Json.decodeObject7;
   var object6 = $Native$Json.decodeObject6;
   var object5 = $Native$Json.decodeObject5;
   var object4 = $Native$Json.decodeObject4;
   var object3 = $Native$Json.decodeObject3;
   var object2 = $Native$Json.decodeObject2;
   var object1 = $Native$Json.decodeObject1;
   _op[":="] = $Native$Json.decodeField;
   var at = F2(function (fields,
   decoder) {
      return A3($List.foldr,
      F2(function (x,y) {
         return A2(_op[":="],x,y);
      }),
      decoder,
      fields);
   });
   var decodeString = $Native$Json.runDecoderString;
   var map = $Native$Json.decodeObject1;
   var dict = function (decoder) {
      return A2(map,
      $Dict.fromList,
      keyValuePairs(decoder));
   };
   var Decoder = {ctor: "Decoder"};
   _elm.Json.Decode.values = {_op: _op
                             ,Decoder: Decoder
                             ,map: map
                             ,decodeString: decodeString
                             ,at: at
                             ,object1: object1
                             ,object2: object2
                             ,object3: object3
                             ,object4: object4
                             ,object5: object5
                             ,object6: object6
                             ,object7: object7
                             ,object8: object8
                             ,keyValuePairs: keyValuePairs
                             ,dict: dict
                             ,oneOf: oneOf
                             ,string: string
                             ,$float: $float
                             ,$int: $int
                             ,bool: bool
                             ,list: list
                             ,array: array
                             ,$null: $null
                             ,maybe: maybe
                             ,value: value
                             ,decodeValue: decodeValue
                             ,customDecoder: customDecoder
                             ,andThen: andThen
                             ,fail: fail
                             ,succeed: succeed
                             ,tuple1: tuple1
                             ,tuple2: tuple2
                             ,tuple3: tuple3
                             ,tuple4: tuple4
                             ,tuple5: tuple5
                             ,tuple6: tuple6
                             ,tuple7: tuple7
                             ,tuple8: tuple8};
   return _elm.Json.Decode.values;
};
Elm.Json = Elm.Json || {};
Elm.Json.Encode = Elm.Json.Encode || {};
Elm.Json.Encode.make = function (_elm) {
   "use strict";
   _elm.Json = _elm.Json || {};
   _elm.Json.Encode = _elm.Json.Encode || {};
   if (_elm.Json.Encode.values)
   return _elm.Json.Encode.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Json.Encode",
   $Array = Elm.Array.make(_elm),
   $Native$Json = Elm.Native.Json.make(_elm);
   var list = $Native$Json.encodeList;
   var array = $Native$Json.encodeArray;
   var object = $Native$Json.encodeObject;
   var $null = $Native$Json.encodeNull;
   var bool = $Native$Json.identity;
   var $float = $Native$Json.identity;
   var $int = $Native$Json.identity;
   var string = $Native$Json.identity;
   var encode = $Native$Json.encode;
   var Value = {ctor: "Value"};
   _elm.Json.Encode.values = {_op: _op
                             ,Value: Value
                             ,encode: encode
                             ,string: string
                             ,$int: $int
                             ,$float: $float
                             ,bool: bool
                             ,$null: $null
                             ,object: object
                             ,array: array
                             ,list: list};
   return _elm.Json.Encode.values;
};
Elm.List = Elm.List || {};
Elm.List.make = function (_elm) {
   "use strict";
   _elm.List = _elm.List || {};
   if (_elm.List.values)
   return _elm.List.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "List",
   $Basics = Elm.Basics.make(_elm),
   $Maybe = Elm.Maybe.make(_elm),
   $Native$List = Elm.Native.List.make(_elm);
   var sortWith = $Native$List.sortWith;
   var sortBy = $Native$List.sortBy;
   var sort = $Native$List.sort;
   var repeat = $Native$List.repeat;
   var drop = $Native$List.drop;
   var take = $Native$List.take;
   var map5 = $Native$List.map5;
   var map4 = $Native$List.map4;
   var map3 = $Native$List.map3;
   var map2 = $Native$List.map2;
   var append = $Native$List.append;
   var any = $Native$List.any;
   var all = $Native$List.all;
   var length = $Native$List.length;
   var filter = $Native$List.filter;
   var scanl1 = $Native$List.scanl1;
   var scanl = $Native$List.scanl;
   var foldr1 = $Native$List.foldr1;
   var foldl1 = $Native$List.foldl1;
   var maximum = foldl1($Basics.max);
   var minimum = foldl1($Basics.min);
   var foldr = $Native$List.foldr;
   var concat = function (lists) {
      return A3(foldr,
      append,
      _L.fromArray([]),
      lists);
   };
   var foldl = $Native$List.foldl;
   var sum = function (numbers) {
      return A3(foldl,
      F2(function (x,y) {
         return x + y;
      }),
      0,
      numbers);
   };
   var product = function (numbers) {
      return A3(foldl,
      F2(function (x,y) {
         return x * y;
      }),
      1,
      numbers);
   };
   var indexedMap = F2(function (f,
   xs) {
      return A3(map2,
      f,
      _L.range(0,length(xs) - 1),
      xs);
   });
   var map = $Native$List.map;
   var concatMap = F2(function (f,
   list) {
      return concat(A2(map,
      f,
      list));
   });
   var member = $Native$List.member;
   var isEmpty = function (xs) {
      return function () {
         switch (xs.ctor)
         {case "[]": return true;}
         return false;
      }();
   };
   var tail = $Native$List.tail;
   var head = $Native$List.head;
   _op["::"] = $Native$List.cons;
   var maybeCons = F3(function (f,
   mx,
   xs) {
      return function () {
         var _v1 = f(mx);
         switch (_v1.ctor)
         {case "Just":
            return A2(_op["::"],_v1._0,xs);
            case "Nothing": return xs;}
         _U.badCase($moduleName,
         "between lines 162 and 169");
      }();
   });
   var filterMap = F2(function (f,
   xs) {
      return A3(foldr,
      maybeCons(f),
      _L.fromArray([]),
      xs);
   });
   var reverse = A2(foldl,
   F2(function (x,y) {
      return A2(_op["::"],x,y);
   }),
   _L.fromArray([]));
   var partition = F2(function (pred,
   list) {
      return function () {
         var step = F2(function (x,
         _v3) {
            return function () {
               switch (_v3.ctor)
               {case "_Tuple2":
                  return pred(x) ? {ctor: "_Tuple2"
                                   ,_0: A2(_op["::"],x,_v3._0)
                                   ,_1: _v3._1} : {ctor: "_Tuple2"
                                                  ,_0: _v3._0
                                                  ,_1: A2(_op["::"],x,_v3._1)};}
               _U.badCase($moduleName,
               "between lines 271 and 273");
            }();
         });
         return A3(foldr,
         step,
         {ctor: "_Tuple2"
         ,_0: _L.fromArray([])
         ,_1: _L.fromArray([])},
         list);
      }();
   });
   var unzip = function (pairs) {
      return function () {
         var step = F2(function (_v7,
         _v8) {
            return function () {
               switch (_v8.ctor)
               {case "_Tuple2":
                  return function () {
                       switch (_v7.ctor)
                       {case "_Tuple2":
                          return {ctor: "_Tuple2"
                                 ,_0: A2(_op["::"],_v7._0,_v8._0)
                                 ,_1: A2(_op["::"],
                                 _v7._1,
                                 _v8._1)};}
                       _U.badCase($moduleName,
                       "on line 309, column 12 to 28");
                    }();}
               _U.badCase($moduleName,
               "on line 309, column 12 to 28");
            }();
         });
         return A3(foldr,
         step,
         {ctor: "_Tuple2"
         ,_0: _L.fromArray([])
         ,_1: _L.fromArray([])},
         pairs);
      }();
   };
   var intersperse = F2(function (sep,
   xs) {
      return function () {
         switch (xs.ctor)
         {case "::": return function () {
                 var step = F2(function (x,
                 rest) {
                    return A2(_op["::"],
                    sep,
                    A2(_op["::"],x,rest));
                 });
                 var spersed = A3(foldr,
                 step,
                 _L.fromArray([]),
                 xs._1);
                 return A2(_op["::"],
                 xs._0,
                 spersed);
              }();
            case "[]":
            return _L.fromArray([]);}
         _U.badCase($moduleName,
         "between lines 320 and 331");
      }();
   });
   _elm.List.values = {_op: _op
                      ,head: head
                      ,tail: tail
                      ,isEmpty: isEmpty
                      ,member: member
                      ,map: map
                      ,indexedMap: indexedMap
                      ,foldl: foldl
                      ,foldr: foldr
                      ,foldl1: foldl1
                      ,foldr1: foldr1
                      ,scanl: scanl
                      ,scanl1: scanl1
                      ,filter: filter
                      ,filterMap: filterMap
                      ,maybeCons: maybeCons
                      ,length: length
                      ,reverse: reverse
                      ,all: all
                      ,any: any
                      ,append: append
                      ,concat: concat
                      ,concatMap: concatMap
                      ,sum: sum
                      ,product: product
                      ,maximum: maximum
                      ,minimum: minimum
                      ,partition: partition
                      ,map2: map2
                      ,map3: map3
                      ,map4: map4
                      ,map5: map5
                      ,unzip: unzip
                      ,intersperse: intersperse
                      ,take: take
                      ,drop: drop
                      ,repeat: repeat
                      ,sort: sort
                      ,sortBy: sortBy
                      ,sortWith: sortWith};
   return _elm.List.values;
};
Elm.Main = Elm.Main || {};
Elm.Main.make = function (_elm) {
   "use strict";
   _elm.Main = _elm.Main || {};
   if (_elm.Main.values)
   return _elm.Main.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Main",
   $Basics = Elm.Basics.make(_elm),
   $Color = Elm.Color.make(_elm),
   $Graphics$Collage = Elm.Graphics.Collage.make(_elm),
   $Graphics$Element = Elm.Graphics.Element.make(_elm),
   $Graphics$Input = Elm.Graphics.Input.make(_elm),
   $Html = Elm.Html.make(_elm),
   $Html$Attributes = Elm.Html.Attributes.make(_elm),
   $Signal = Elm.Signal.make(_elm),
   $String = Elm.String.make(_elm),
   $Text = Elm.Text.make(_elm);
   var resourcesMsg = A2($Basics._op["++"],
   "For more information on the Elm\n",
   A2($Basics._op["++"],
   "language, check out the following\n",
   "resources:"));
   var resourcesTitle = "Elm Resources";
   var videoLink3 = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("http://elm-lang.org/learn/courses/beginner/Lists-and-Records.elm")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Intro to Lists and Records")]));
   var videoLink2 = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("http://elm-lang.org/learn/courses/beginner/Graphics.elm")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Intro to Elm Graphics")]));
   var videoLink1 = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("http://elm-lang.org/learn/courses/beginner/Programming.elm")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Intro to Elm Video")]));
   var ircLink = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("http://webchat.freenode.net/?channels=elm")
                ,$Html$Attributes.target("_black")]),
   _L.fromArray([$Html.text("Elm on IRC")]));
   var twitterLink = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("https://twitter.com/elmlang")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Elm on Twitter")]));
   var mailingLink = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("https://groups.google.com/forum/?fromgroups#!forum/elm-discuss")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Elm Mailing List")]));
   var syntaxLink = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("http://elm-lang.org/learn/Syntax.elm")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Elm Syntax")]));
   var exampleLink = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("http://elm-lang.org/Examples.elm")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Elm Examples")]));
   var packageLink = A2($Html.a,
   _L.fromArray([$Html$Attributes.href("http://package.elm-lang.org/")
                ,$Html$Attributes.target("_blank")]),
   _L.fromArray([$Html.text("Elm Package Catalog")]));
   var viewIdea3Msg2 = A2($Basics._op["++"],
   "Avoid boring the player by using a\n",
   A2($Basics._op["++"],
   "rectangle layout for every level.\n",
   A2($Basics._op["++"],
   "Think of ways to modify or enhance\n",
   A2($Basics._op["++"],
   "the layout to make the game fun\n",
   A2($Basics._op["++"],
   "and interesting. Some suggestions\n",
   A2($Basics._op["++"],
   "include:\n\n",
   A2($Basics._op["++"],
   "&bull; Have obstacles through which\n",
   A2($Basics._op["++"],
   "    the player cannot pass.\n",
   A2($Basics._op["++"],
   "&bull; Change the color of certain parts\n",
   A2($Basics._op["++"],
   "    of the layout. The colored regions\n",
   A2($Basics._op["++"],
   "    take a life of the player when\n",
   "    touched.")))))))))));
   var viewIdea3Msg1 = "New Layouts";
   var viewIdea2Msg2 = A2($Basics._op["++"],
   "To differentiate the levels and increase\n",
   A2($Basics._op["++"],
   "the difficulty, add another enemy to the\n",
   A2($Basics._op["++"],
   "game.\n\n",
   A2($Basics._op["++"],
   "&bull; Have them move at different speeds.\n",
   A2($Basics._op["++"],
   "&bull; Use a different size and shape.\n",
   A2($Basics._op["++"],
   "&bull; Use a different color. Try the orange\n",
   A2($Basics._op["++"],
   "    from the Elm logo - rgb 237 149 0.\n",
   A2($Basics._op["++"],
   "&bull; Increase the number of enemies on a\n",
   A2($Basics._op["++"],
   "    set interval, i.e. every five levels adds\n",
   "    another enemy.")))))))));
   var viewIdea2Msg1 = "Another Enemy";
   var viewIdea1Msg2 = A2($Basics._op["++"],
   "Good video games hold the attention\n",
   A2($Basics._op["++"],
   "of the player. To do this, you will need\n",
   A2($Basics._op["++"],
   "to add some more levels. Some\n",
   A2($Basics._op["++"],
   "suggestions include:\n\n",
   A2($Basics._op["++"],
   " &bull; Stay alive for a certain amount of\n",
   A2($Basics._op["++"],
   "     time. The amount of time required\n",
   A2($Basics._op["++"],
   "     to stay alive will increase with each\n",
   A2($Basics._op["++"],
   "     level.\n",
   A2($Basics._op["++"],
   " &bull; Collect a certain number of objects\n",
   A2($Basics._op["++"],
   "     before advancing. Each object will\n",
   "     randomly appears one at a time."))))))))));
   var viewIdea1Msg1 = "Next Level";
   var viewCongratsMsg2 = A2($Basics._op["++"],
   "You made the foundation of a game.\n",
   A2($Basics._op["++"],
   "Advance through the next few pages\n",
   A2($Basics._op["++"],
   "for some ideas on what you can do to\n",
   A2($Basics._op["++"],
   "make the game better. Possible ideas\n",
   A2($Basics._op["++"],
   "include:\n\n",
   A2($Basics._op["++"],
   "&bull; Adding additional levels.\n",
   A2($Basics._op["++"],
   "&bull; Adding another enemy.\n",
   A2($Basics._op["++"],
   "&bull; Changing the layout.\n\n",
   A2($Basics._op["++"],
   "This tutorial ends with some links to\n",
   "more resources for learning Elm.")))))))));
   var viewCongratsMsg1 = "Congratulations";
   var msgFuncMsg = A2($Basics._op["++"],
   "When the state of the game is Pause, you\n",
   A2($Basics._op["++"],
   "will see this message at the bottom of the\n",
   A2($Basics._op["++"],
   "game. These are the instructions. &larr ;\n",
   A2($Basics._op["++"],
   "inserts a left arrow symbol. Remove the\n",
   A2($Basics._op["++"],
   "space before the semi-colon so the symbol\n",
   A2($Basics._op["++"],
   "will appear. With a space &larr ;. Without\n",
   "a space &larr;."))))));
   var txtFunc2Msg = "The text function also sets the font to monospace.";
   var txtFunc1Msg = A2($Basics._op["++"],
   "The txt function sets up the characteristics for\n",
   A2($Basics._op["++"],
   "the text used in the game. The text is converted\n",
   "from a string, has the color textColor (white)."));
   var textColorMsg = A2($Basics._op["++"],
   "textColor is set to white. This is the color\n",
   "used for any text prefaced with txt.");
   var elmGreenColorMsg = A2($Basics._op["++"],
   "elmGreen is a custom color with a red value\n",
   A2($Basics._op["++"],
   "of 127, a green value of 209, and a blue value\n",
   "of 17. This color was taken from the Elm logo."));
   var elmBlueColorMsg = A2($Basics._op["++"],
   "elmBlue is a custom color with a red value\n",
   A2($Basics._op["++"],
   "of 76, a green value of 166, and a blue value\n",
   "of 195. This color was taken from the Elm logo."));
   var elmGreyColorMsg = A2($Basics._op["++"],
   "elmGrey is a custom color with a red value\n",
   A2($Basics._op["++"],
   "of 71, a green value of 80, and a blue value\n",
   "of 102. This color was taken from the Elm logo."));
   var viewFunc20Msg = A2($Basics._op["++"],
   "This bracket closes the list of forms\n",
   "found in the collage.");
   var viewFunc19Msg = A2($Basics._op["++"],
   "The form is moved to the location 0 (centered),\n",
   A2($Basics._op["++"],
   "gameHeight/2 - 40 (40 pixels from the bottom\n",
   "of the game area)."));
   var viewFunc18Msg = A2($Basics._op["++"],
   "There is one last form in the collage. If the\n",
   A2($Basics._op["++"],
   "state of the game is Play, then there is a\n",
   A2($Basics._op["++"],
   "spacer with the width of 1 and the height of 1.\n",
   A2($Basics._op["++"],
   "A spacer is an empty place holder. If the state\n",
   A2($Basics._op["++"],
   "is Pause, then the contents of the variable msg\n",
   A2($Basics._op["++"],
   "are modified by the function txt. Both msg and\n",
   "txt are defined over the next few pages."))))));
   var viewFunc17Msg = A2($Basics._op["++"],
   "The form lives is moved to the location 0\n",
   A2($Basics._op["++"],
   "(centered), gameHeight/2 - 40 (40 pixels\n",
   "from the top of the game area)."));
   var viewFunc16Msg = A2($Basics._op["++"],
   "The object lives (created 5 pages ago)\n",
   A2($Basics._op["++"],
   "is also in the collage. Since only forms\n",
   A2($Basics._op["++"],
   "can exist in a collage, lives is transformed\n",
   "into a form.")));
   var viewFunc15Msg = A2($Basics._op["++"],
   "The circle is moved to the x and y\n",
   A2($Basics._op["++"],
   "coordinates of player1. The circle\n",
   "represents the protagonist in the game."));
   var viewFunc14Msg = A2($Basics._op["++"],
   "The circle is filled with the custom color\n",
   A2($Basics._op["++"],
   "elmBue, which is defined below. The color\n",
   "comes from the Elm logo."));
   var viewFunc13Msg = "A circle with a radius of 20 is also in the collage.";
   var viewFunc12Msg = A2($Basics._op["++"],
   "The hexagon is moved to the x and y\n",
   A2($Basics._op["++"],
   "coordinates of badGuy. The hexagon\n",
   "represents the antagonist in the game."));
   var viewFunc11Msg = A2($Basics._op["++"],
   "The hexagon is filled with the custom color\n",
   A2($Basics._op["++"],
   "elmOrange, which is defined below. The color\n",
   "comes from the Elm logo."));
   var viewFunc10Msg = A2($Basics._op["++"],
   "Also in the collage is a six-sided polygon\n",
   "with a radius of 25.");
   var viewFunc9Msg = A2($Basics._op["++"],
   "The rectangle is filled with the custom color\n",
   A2($Basics._op["++"],
   "elmGrey, which is defined below. The color comes\n",
   "from the Elm logo."));
   var viewFunc8Msg = A2($Basics._op["++"],
   "Inside of the collage is a rectangle with\n",
   "the same dimensions as the collage.");
   var viewFunc7Msg = A2($Basics._op["++"],
   "The container holds a collage, which is a\n",
   A2($Basics._op["++"],
   "collection of 2D forms. The forms can be\n",
   A2($Basics._op["++"],
   "placed anywhere inside the collage. This\n",
   A2($Basics._op["++"],
   "collage has a width of gameWidth (600) and\n",
   "a height of gameHeight (400)."))));
   var viewFunc6Msg = A2($Basics._op["++"],
   "A container is an object that holds elements. It\n",
   A2($Basics._op["++"],
   "width and a height. Whatever it is holding will be\n",
   "placed in the middle of the element."));
   var viewFunc5Msg = A2($Basics._op["++"],
   "In is part of the let expression, and indicates\n",
   "where the newly defined lives will be used.");
   var viewFunc4Msg = A2($Basics._op["++"],
   "The objecct lives is assigned the value of\n",
   A2($Basics._op["++"],
   "player1.lives, which is the remaining lives\n",
   A2($Basics._op["++"],
   "of player1. The object lives is converted to\n",
   "a string, and has a size of 50.")));
   var viewFunc3Msg = A2($Basics._op["++"],
   "The let expression creates an object lives,\n",
   "which is of type element.");
   var viewFunc2Msg = A2($Basics._op["++"],
   "The function view is passed the width and\n",
   A2($Basics._op["++"],
   "height of the window, as well as state, badGuy\n",
   "and player1 which make up defaultGame."));
   var viewFunc1Msg = A2($Basics._op["++"],
   "The view function is what outputs the game\n",
   A2($Basics._op["++"],
   "to the computer screen. The view function\n",
   A2($Basics._op["++"],
   "takes a pair of integers and a game, and it\n",
   "returns an element.")));
   var viewWelcomeMsg2 = A2($Basics._op["++"],
   "This is our final section of the\n",
   A2($Basics._op["++"],
   "game. We\'re going to draw the models\n",
   "to the screen."));
   var viewWelcomeMsg1 = "View Section\n";
   var updateStepV4Msg = A2($Basics._op["++"],
   "In all other cases, stepV returns the value\n",
   A2($Basics._op["++"],
   "of v. If badGuy is not touching any edges, then\n",
   A2($Basics._op["++"],
   "do not change the direction; keep going in the\n",
   "same direction.")));
   var updateStepV3Msg = A2($Basics._op["++"],
   "If condition2 is true, then stepV returns 0 -\n",
   A2($Basics._op["++"],
   "absolute value of v. This bounces badGuy off\n",
   "of the right and top edges of the game area."));
   var updateStepV2Msg = A2($Basics._op["++"],
   "If condition1 is true, then stepV returns the\n",
   A2($Basics._op["++"],
   "absolute value of v. This bounces badGuy off\n",
   "of the left and bottom edges of the game area."));
   var updateStepV1Msg = A2($Basics._op["++"],
   "The function stepV takes two conditions (true\n",
   A2($Basics._op["++"],
   "or false) and a thrid term v. stepV is used to\n",
   "bounce badGuy off of the edges of the game area."));
   var updateWithin2Msg = A2($Basics._op["++"],
   "The function within calls the function near,\n",
   A2($Basics._op["++"],
   "and passes it the x positions of player1 and\n",
   A2($Basics._op["++"],
   "badGuy, as well as the number 25. 25 is used\n",
   A2($Basics._op["++"],
   "because that is the radius of badGuy. This also\n",
   "checks to see if the y positions are touching."))));
   var updateWithin1Msg = A2($Basics._op["++"],
   "The function within takes badGuy and player1\n",
   "and determines if they are touching.");
   var updateNear2Msg = A2($Basics._op["++"],
   "This is the logic equation to determine if two\n",
   A2($Basics._op["++"],
   "objects are touching. If the x-value of badGuy\n",
   A2($Basics._op["++"],
   "is greater than or equal to its radius minus the\n",
   A2($Basics._op["++"],
   "x-value of player1 and the x-value of badGuy is\n",
   A2($Basics._op["++"],
   "less than or equal to its radius plus the x-value\n",
   A2($Basics._op["++"],
   "of player1, then the function returns true. In all\n",
   "other cases, it returns false."))))));
   var updateNear1Msg = A2($Basics._op["++"],
   "The function near takes three arguments: k, c,\n",
   A2($Basics._op["++"],
   "and n.It determines if two objects (k and n) are\n",
   A2($Basics._op["++"],
   "near one another based upon a third number (c).\n",
   A2($Basics._op["++"],
   "c represents the radius of badGuy. k and n are the\n",
   "x- or y-values of badGuy and player1."))));
   var updatePhysics5Msg = "This brakcet closes the updatePhysics function.";
   var updatePhysics4Msg = A2($Basics._op["++"],
   "The y attribute takes the value y plus vy\n",
   "multiplied by t.");
   var updatePhysics3Msg = A2($Basics._op["++"],
   "The x attribute takes the value of x plus vx\n",
   "multiplied by t.");
   var updatePhysics2Msg = A2($Basics._op["++"],
   "This code means that the object will have its\n",
   "attribures modified.");
   var updatePhysics1Msg = A2($Basics._op["++"],
   "The function updatePhysics takes t (time) and\n",
   A2($Basics._op["++"],
   "the values of x, y, vx, and vy which are treated\n",
   A2($Basics._op["++"],
   "as one object. This function determines the\n",
   "location of badGuy and player1 in the game area.\n")));
   var updatePlayer13Msg = "This bracket ends the update for player1.";
   var updatePlayer12Msg = A2($Basics._op["++"],
   "The updated attribute lives takes the\n",
   "value of alive.");
   var updatePlayer11Msg = A2($Basics._op["++"],
   "The updated attribute x takes the value of\n",
   A2($Basics._op["++"],
   "player1.x. However, the value is limited (or\n",
   A2($Basics._op["++"],
   "clamped) to any number between 35 -\n",
   "halfWidth (-265) and halfWidth - 35 (265).")));
   var updatePlayer10Msg = A2($Basics._op["++"],
   "The updated attribute y takes the value of\n",
   A2($Basics._op["++"],
   "player1.y. However, the value is limited (or\n",
   A2($Basics._op["++"],
   "clamped) to any number between 35 -\n",
   "halfHeight (-165) and halfHeight - 35 (165).")));
   var updatePlayer9Msg = A2($Basics._op["++"],
   "This says that within player1, the following\n",
   "attributes will be updated.");
   var updatePlayer8Msg = A2($Basics._op["++"],
   "This is the second part of the let statement.\n",
   "The newly introduced alive will be used below.");
   var updatePlayer7Msg = A2($Basics._op["++"],
   "If the previous conditional statement is not\n",
   A2($Basics._op["++"],
   "true, then alive will equal player.lives minus\n",
   "the value of lives."));
   var updatePlayer6Msg = A2($Basics._op["++"],
   "If the previous conditional statement is true,\n",
   A2($Basics._op["++"],
   "then alives takes the value of 0. This keeps the\n",
   "lives from becoming a negative number."));
   var updatePlayer5Msg = A2($Basics._op["++"],
   "The value of alive depends upon the conditional\n",
   A2($Basics._op["++"],
   "statement tha wants to know if player.lives minus\n",
   A2($Basics._op["++"],
   "lives is greater than 0. Conditionals return either\n",
   "true or false.")));
   var updatePlayer4Msg = A2($Basics._op["++"],
   "The updated vy attribute takes the value of dir2\n",
   A2($Basics._op["++"],
   "multiplied by 200. However, dir2 multiplied by\n",
   A2($Basics._op["++"],
   "200 is an integer. The value vy is a float. The\n",
   "toFloat function converts an integer into a float.")));
   var updatePlayer3Msg = A2($Basics._op["++"],
   "An object player1 is created. Its attributes\n",
   A2($Basics._op["++"],
   "of vx and vy are set to the values created by\n",
   A2($Basics._op["++"],
   "the function physicsUpdate, which takes time t.\n",
   A2($Basics._op["++"],
   "The updated vx attribute takes the value of dir1\n",
   A2($Basics._op["++"],
   "multiplied by 200. However, dir1 multiplied by\n",
   A2($Basics._op["++"],
   "200 is an integer. The value vy is a float. The\n",
   "toFloat function converts an integer into a float."))))));
   var updatePlayer2Msg = A2($Basics._op["++"],
   "The function updatePlayer is called with\n",
   "t, dir1, dir2, lives, and player.");
   var updatePlayer1Msg = A2($Basics._op["++"],
   "This defines the function updatePlayer,\n",
   A2($Basics._op["++"],
   "which takes a time, an integer, another\n",
   A2($Basics._op["++"],
   "integer, another integer, a player, and\n",
   "returns a player.")));
   var updateBadGuy13Msg = A2($Basics._op["++"],
   "The bracket ends the attributes of badGuy which\n",
   "are modified.");
   var updateBadGuy12Msg = A2($Basics._op["++"],
   "The value vy takes the result of the function\n",
   A2($Basics._op["++"],
   "stepV. This is checking to see if badGuy is\n",
   A2($Basics._op["++"],
   "going outside the game area. The number 25 is\n",
   A2($Basics._op["++"],
   "the radius of badGuy. This will keep it in the\n",
   "game area."))));
   var updateBadGuy11Msg = A2($Basics._op["++"],
   "The value vx takes the result of the function\n",
   A2($Basics._op["++"],
   "stepV. This is checking to see if badGuy is\n",
   A2($Basics._op["++"],
   "going outside the game area. The number 25 is\n",
   A2($Basics._op["++"],
   "the radius of badGuy. This will keep it in the\n",
   "game area."))));
   var updateBadGuy10Msg = A2($Basics._op["++"],
   "Some of the attributes of the object badGuy\n",
   "will be modified.");
   var updateBadGuy9Msg = A2($Basics._op["++"],
   "In all other cases, the function physicsUpdate\n",
   "will be called with different arguments.");
   var updateBadGuy8Msg = A2($Basics._op["++"],
   "The bracket ends the attributes of\n",
   "badGuy which are modified.");
   var updateBadGuy7Msg = A2($Basics._op["++"],
   "The vy-value of badGuy takes the\n",
   A2($Basics._op["++"],
   "result of the stepV funtion which\n",
   A2($Basics._op["++"],
   "takes the true or false value for\n",
   "the conditional statements.")));
   var updateBadGuy6Msg = A2($Basics._op["++"],
   "The vx-value of badGuy takes the\n",
   A2($Basics._op["++"],
   "result of the stepV funtion which\n",
   A2($Basics._op["++"],
   "takes the true or false value for\n",
   "the conditional statements.")));
   var updateBadGuy5Msg = A2($Basics._op["++"],
   "This bit of code is setting up the\n",
   A2($Basics._op["++"],
   "attributes of badGuy that will be\n",
   "modified."));
   var updateBadGuy4Msg = A2($Basics._op["++"],
   "If badGuy is touching player1, then the\n",
   A2($Basics._op["++"],
   "function physicsUpdate is called with t\n",
   "(time)."));
   var updateBadGuy3Msg = A2($Basics._op["++"],
   "If player1 has no more lives, then\n",
   A2($Basics._op["++"],
   "the x- and y-values of badGuy are set\n",
   A2($Basics._op["++"],
   "to 0. That is, badGuy moves to the\n",
   "middle of the game area.")));
   var updateBadGuy2Msg = A2($Basics._op["++"],
   "UpdateBadGuy takes t as time; the x, y,\n",
   A2($Basics._op["++"],
   "vx, and vy values of badGuy; and the x,\n",
   "y, vx, vy, and lives values of player1."));
   var updateBadGuy1Msg = A2($Basics._op["++"],
   "The function updateBadGuy takes a Time, a\n",
   A2($Basics._op["++"],
   "BadGuy, and a Player. The function returns\n",
   "a type of BadGuy."));
   var updateFunc18Msg = "This bracket closes the update function.";
   var updateFunc17Msg = A2($Basics._op["++"],
   "Player1 assumes the value of the function\n",
   A2($Basics._op["++"],
   "updatePlayer which needs delta, dir1, dir2,\n",
   A2($Basics._op["++"],
   "lives, and player1. The function updatePlayer\n",
   "is defined later.")));
   var updateFunc16Msg = A2($Basics._op["++"],
   "BadGuy assumes the value of the\n",
   A2($Basics._op["++"],
   "function newBadGuy from the previous\n",
   "page."));
   var updateFunc15Msg = A2($Basics._op["++"],
   "State will assume the value of the\n",
   "function newState.");
   var updateFunc14Msg = "Game will have its attributes updated.";
   var updateFunc13Msg = A2($Basics._op["++"],
   "The in part of the let expression tells us how\n",
   "the newBadGuy function will be used.");
   var updateFunc12Msg = A2($Basics._op["++"],
   "When state is not equal to Pause, then\n",
   A2($Basics._op["++"],
   "newBadGuy takes the value of the function\n",
   A2($Basics._op["++"],
   "updateBadGuy, which is defined later. This\n",
   "function takes delta, badGuy, and player1.")));
   var updateFunc11Msg = A2($Basics._op["++"],
   "If the value of state is Pause, then\n",
   A2($Basics._op["++"],
   "the function newBadGuy takes the value\n",
   "badGuy. That is, nothing changes."));
   var updateFunc10Msg = A2($Basics._op["++"],
   "The function checks to see if the value\n",
   "of state is equal to Pause.");
   var updateFunc9Msg = A2($Basics._op["++"],
   "The value of the function newBadGuy is\n",
   "dependent upon the following cases:");
   var updateFunc8Msg = A2($Basics._op["++"],
   "In all other cases, newState assumes the value\n",
   "of state. That is, nothing changes.");
   var updateFunc7Msg = A2($Basics._op["++"],
   "newState assumes the value of Pause if\n",
   A2($Basics._op["++"],
   "player1.lives is 0. That is, the game stops\n",
   "when player1 runs out of lives."));
   var updateFunc6Msg = A2($Basics._op["++"],
   "If the space bar is pressed, then newState takes\n",
   "the value Play.");
   var updateFunc5Msg = A2($Basics._op["++"],
   "The function newState assumes a value\n",
   "dependent upon the cases below:");
   var updateFunc4Msg = A2($Basics._op["++"],
   "The let expression assigns the value of 1 to\n",
   A2($Basics._op["++"],
   "lives if badGuy is within player1. within is a\n",
   A2($Basics._op["++"],
   "that will be discussed later in this section. If\n",
   A2($Basics._op["++"],
   "If badGuy is not within player1, the value of 0\n",
   "is assigned to lives."))));
   var updateFunc2Msg = A2($Basics._op["++"],
   "Specifically, update takes Input in the form of\n",
   A2($Basics._op["++"],
   "space, dir1, dir2, and delta. The Game is defined\n",
   "as state, badGuy, and player1."));
   var updateFunc1Msg = A2($Basics._op["++"],
   "Update is a function that takes an object of type\n",
   A2($Basics._op["++"],
   "Input, an object of type Game, and returns\n",
   "a Game."));
   var updateWelcomeMsg2 = A2($Basics._op["++"],
   "The Update Section is where the magic\n",
   A2($Basics._op["++"],
   "happens. We\'re going to take the signals\n",
   "and have them modify the models."));
   var updateWelcomeMsg1 = "Update Section\n";
   var aliasInput6Msg = "Ends the list of attributes for Input.";
   var aliasInput5Msg = "There is an attribute called delta with a Time value.";
   var aliasInput4Msg = A2($Basics._op["++"],
   "There is an attribute called dir2, of type integer.\n",
   "Integer means a number without a decimal.");
   var aliasInput3Msg = A2($Basics._op["++"],
   "There is an attribute called dir1, of type integer.\n",
   "Integer means a number without a decimal.");
   var aliasInput2Msg = A2($Basics._op["++"],
   "There is an attribute called space, which is a\n",
   A2($Basics._op["++"],
   "boolean value. That is, it is either true or false.\n",
   "space is mapped to the space bar in gameState."));
   var aliasInput1Msg = "Create data type Input wich is an alias.";
   var defaultGame7Msg = "Ends the list of attributes for defaultGame.";
   var defaultGame5Msg = A2($Basics._op["++"],
   "The player1 attribute has the values of:\n",
   A2($Basics._op["++"],
   "x = 15-halfWidth and y = 0, its starting position\n",
   A2($Basics._op["++"],
   "15 is the radius of player1, so 15-halfWidth keeps\n",
   A2($Basics._op["++"],
   "all of player1 on the game area. vx = 0 and vy = 0,\n",
   A2($Basics._op["++"],
   "its velocity (speed). The velocity is set to 0 as\n",
   A2($Basics._op["++"],
   "you have to use arrow keys to make player1 move.\n",
   "It does not move automatically. lives are set to 3."))))));
   var defaultGame4Msg = A2($Basics._op["++"],
   "The badGuy attribute has the values of:\n",
   A2($Basics._op["++"],
   "x = 0 and y = 0, its starting position\n",
   "vx = 300 and vy = 300, its velocity (speed)."));
   var defaultGame3Msg = "The state is set to the value of Pause.";
   var defaultGame2Msg = "Describe specific values for defaultGame.";
   var defaultGame1Msg = "Create an object defaultGame of type Game.";
   var aliasGame2Msg = A2($Basics._op["++"],
   "The data type Game has the following attributes:\n",
   A2($Basics._op["++"],
   "a state of type State (either Play or Pause), a \n",
   A2($Basics._op["++"],
   "badGuy of type BadGuy including all its attributes,\n",
   "and a player of type Player with all of its attributes.\n")));
   var aliasGame1Msg = A2($Basics._op["++"],
   "Create the type Game as an alias. An alias\n",
   "means that you can define attributes individually.\n");
   var aliasPlayer2Msg = A2($Basics._op["++"],
   "The data type Player has the following attributes:\n",
   A2($Basics._op["++"],
   "an x-value of type float, a y-value of type float,\n",
   A2($Basics._op["++"],
   "a vx-value of type Float, and a vy-value of type\n",
   A2($Basics._op["++"],
   "float. Floats are numbers with a decimal. Player\n",
   "also has an integer that represents its lives."))));
   var aliasPlayer1Msg = A2($Basics._op["++"],
   "Create the type BadGuy as an alias. An alias\n",
   "means that you can define attributes individually.\n");
   var aliasBadGuy2Msg = A2($Basics._op["++"],
   "The data type BadGuy has the following attributes:\n",
   A2($Basics._op["++"],
   "an x-value of type float, a y-value of type float,\n",
   A2($Basics._op["++"],
   "a vx-value of type Float, and a vy-value of type\n",
   "float. Floats are numbers with a decimal.")));
   var aliasBadGuy1Msg = A2($Basics._op["++"],
   "Create the type BadGuy as an alias. An alias\n",
   "means that you can define attributes individually.\n");
   var typeStateMsg = A2($Basics._op["++"],
   "The data type State is created. It has\n",
   "the value of either Play or Pause.");
   var playingSizeMsg = A2($Basics._op["++"],
   "Set halfWidth to 300 and halfHeight to 200.\n",
   A2($Basics._op["++"],
   "halfWidth and halfHeight are also grouped\n",
   "together as a tuple.\n"));
   var gameSizeMsg = A2($Basics._op["++"],
   "Set gameWidth to 600 and gameHeight to 400.\n",
   A2($Basics._op["++"],
   "gameWidth and gameHeight are also grouped\n",
   "together as a tuple.\n"));
   var modelWelcomeMsg2 = A2($Basics._op["++"],
   "In the Model Section we\'ll create the\n",
   A2($Basics._op["++"],
   "objects and their characteristics to be\n",
   "used in the game."));
   var modelWelcomeMsg1 = "Model Section";
   var signalInput8Msg = "Finally, the change in time is recorded in seconds.";
   var signalInput7Msg = A2($Basics._op["++"],
   "The next pieceof data recorded is the up/down\n",
   A2($Basics._op["++"],
   "keys. If down arrow is pressed then, the y-value\n",
   A2($Basics._op["++"],
   "decreases. If the up arrow is pressed, then the\n",
   "y-value increases.")));
   var signalInput6Msg = A2($Basics._op["++"],
   "The next pieceof data recorded is the left/right\n",
   A2($Basics._op["++"],
   "keys. If left arrow is pressed then, the x-value\n",
   A2($Basics._op["++"],
   "decreases. If the right arrow is pressed, then the\n",
   "x-value increases.")));
   var signalInput5Msg = A2($Basics._op["++"],
   "The first piece of data recorded is the space bar.\n",
   A2($Basics._op["++"],
   "The result is a true or false based upon the space\n",
   "bar being pressed."));
   var signalInput4Msg = A2($Basics._op["++"],
   "The data recorded is a signal that combines the\n",
   "four attributes of type Indput.");
   var signalInput3Msg = A2($Basics._op["++"],
   "This function records some data on every delta,\n",
   "which is every 1/35 of a second.");
   var signalInput2Msg = "Defines the specifics of input.";
   var signalInput1Msg = A2($Basics._op["++"],
   "Defines input as a signal of type Input.\n",
   A2($Basics._op["++"],
   "The data type Input will be discussed in\n",
   "Model section."));
   var signalDelta2Msg = A2($Basics._op["++"],
   "inSeconds marks the current time in seconds. fps\n",
   A2($Basics._op["++"],
   "marks the change in time every one-thrity-fifth\n",
   A2($Basics._op["++"],
   "of a second. This signal maps (or combines) the\n",
   A2($Basics._op["++"],
   "above together so that the change in time is in\n.",
   "seconds."))));
   var signalDelta1Msg = " Define specific characteristics of the delta signal.";
   var signalGameState3Msg = A2($Basics._op["++"],
   "gameState is a past dependent function, which\n",
   A2($Basics._op["++"],
   "means it remembers the past values of update,\n",
   "defaultGame, and input.\n"));
   var signalGameState2Msg = "Define the specifics of gameState.";
   var signalGameState1Msg = A2($Basics._op["++"],
   "Define gameState as a signal of type Game.\n",
   A2($Basics._op["++"],
   "The data type Game will be discussed in the\n",
   "Model section."));
   var signalMain2Msg = A2($Basics._op["++"],
   "This function maps (or combines) the view\n",
   A2($Basics._op["++"],
   "function (writes the game to the screen)\n",
   A2($Basics._op["++"],
   "with the windo dimensions signal and the\n",
   "gameState signal.")));
   var signalMain1Msg = A2($Basics._op["++"],
   "Define the main function. Every Elm\n",
   A2($Basics._op["++"],
   "program must have a main. Main functions\n",
   A2($Basics._op["++"],
   "often combine signals with the function\n",
   "that writes the output to the screen.")));
   var signalsWelcomeMsg2 = A2($Basics._op["++"],
   "Signals are the interactions in the game.\n",
   A2($Basics._op["++"],
   "Some signals, like clicks, come from the\n",
   A2($Basics._op["++"],
   "user. Other signals, like time, happen all\n",
   "by themselves.")));
   var signalsWelcomeMsg1 = "Signals Section";
   var windowMsg = A2($Basics._op["++"],
   "Import the Window library. This allows you to\n",
   A2($Basics._op["++"],
   "access the width and height of the window, which\n",
   "is used when centering the game on the page."));
   var timeMsg = A2($Basics._op["++"],
   "Import the Time library. Specifically, you\n",
   A2($Basics._op["++"],
   "need the frames per second function, which\n",
   "notes the changes in time."));
   var keyboardMsg = A2($Basics._op["++"],
   "Import the Keyboard library. This allows the\n",
   A2($Basics._op["++"],
   "game to register the key presses when moveing\n",
   "the circle."));
   var signalMsg = A2($Basics._op["++"],
   "Import the Signal library. Signals are values\n",
   A2($Basics._op["++"],
   "that change over time. Signals often are input\n",
   A2($Basics._op["++"],
   "from the user. Signals can also be time or the\n",
   "size of a window.")));
   var textMsg = A2($Basics._op["++"],
   "Import the Text library. This library allows\n",
   A2($Basics._op["++"],
   "you to change the size, color, and position\n",
   "of the text used in this game."));
   var graphicsCollageMsg = A2($Basics._op["++"],
   "Import everything from the Graphics.Collage\n",
   A2($Basics._op["++"],
   "library. Collages are freeform graphics. This is\n",
   "the game area with the shapes that move around."));
   var graphicsElementMsg = A2($Basics._op["++"],
   "Import everything from the Graphics.Element\n",
   A2($Basics._op["++"],
   "library. Elements help with the layoutof the\n",
   A2($Basics._op["++"],
   "game. This program uses an element to center\n",
   "the game in the middle of the page.")));
   var colorMsg = A2($Basics._op["++"],
   "Import the Color library. This allows you\n",
   A2($Basics._op["++"],
   "setting the colors for the game area and\n",
   "the shapes."));
   var importsWelcomeMsg2 = A2($Basics._op["++"],
   "Imports allow us to add features\n",
   A2($Basics._op["++"],
   "to the game. Here\'s what we can\n",
   "now use:"));
   var importsWelcomeMsg1 = "Imports Section";
   var stepDescription3 = "Move code with &uArr; to the line above";
   var stepNumber3 = "3";
   var stepDescription2 = "Mouse over the code for an explanation";
   var stepNumber2 = "2";
   var stepDescription1 = "Copy the code to the editor";
   var stepNumber1 = "1";
   var welcomeMsg2 = A2($Basics._op["++"],
   "Let\'s make a game with elm play.\n",
   "Here\'s how:");
   var welcomeMsg1 = "elm play";
   var middleText = function (f) {
      return $Text.centered($Text.height(20)($Text.typeface(_L.fromArray(["futura"
                                                                         ,"sans-serif"]))($Text.fromString(f))));
   };
   var body = function (f) {
      return $Text.leftAligned($Text.typeface(_L.fromArray(["futura"
                                                           ,"sans-serif"]))($Text.fromString(f)));
   };
   var subTitle = function (f) {
      return $Text.leftAligned($Text.height(20)($Text.typeface(_L.fromArray(["futura"
                                                                            ,"sans-serif"]))($Text.fromString(f))));
   };
   var viewIcon = A3($Graphics$Element.image,
   100,
   100,
   "images/viewIcon.svg");
   var updateIcon = A3($Graphics$Element.image,
   100,
   100,
   "images/updateIcon.svg");
   var signalsIcon = A3($Graphics$Element.image,
   100,
   100,
   "images/signalsIcon.svg");
   var modelIcon = A3($Graphics$Element.image,
   100,
   100,
   "images/modelIcon.svg");
   var importsIcon = A3($Graphics$Element.image,
   100,
   100,
   "images/importsIcon.svg");
   var elmLogoGIF5 = A3($Graphics$Element.image,
   145,
   125,
   "/images/multiLogoGIF5.gif");
   var elmLogoGIF4 = A3($Graphics$Element.image,
   145,
   125,
   "/images/multiLogoGIF4.gif");
   var elmLogoGIF3 = A3($Graphics$Element.image,
   145,
   125,
   "/images/multiLogoGIF3.gif");
   var elmLogoGIF2 = A3($Graphics$Element.image,
   145,
   125,
   "/images/multiLogoGIF2.gif");
   var elmLogoGIF1 = A3($Graphics$Element.image,
   145,
   125,
   "/images/multiLogoGIF1.gif");
   var viewGIF = A3($Graphics$Element.image,
   388,
   260,
   "/images/view2GIF.gif");
   var updateGIF = A3($Graphics$Element.image,
   218,
   112,
   "/images/updateGIF.gif");
   var modelGIF = A3($Graphics$Element.image,
   326,
   260,
   "/images/modelGIF.gif");
   var buttonGIF = A3($Graphics$Element.image,
   116,
   64,
   "/images/buttonGIF.gif");
   var importsGIF = A3($Graphics$Element.image,
   350,
   96,
   "/images/importsGIF.gif");
   var multiLine = A3($Graphics$Element.image,
   344,
   27,
   "/images/multiLineGIF.gif");
   var welcomeAnimation3 = $Graphics$Collage.toForm(multiLine);
   var hoverCode = A3($Graphics$Element.image,
   226,
   190,
   "/images/hoverCodeGIF.gif");
   var welcomeAnimation2 = $Graphics$Collage.move({ctor: "_Tuple2"
                                                  ,_0: 0
                                                  ,_1: -20})($Graphics$Collage.toForm(hoverCode));
   var copyCode = A3($Graphics$Element.image,
   180,
   103,
   "/images/copyCodeGIF.gif");
   var welcomeAnimation1 = $Graphics$Collage.toForm(copyCode);
   var gifImage = A3($Graphics$Element.image,
   180,
   119,
   "/images/demoGif1.gif");
   var elmGreen = A3($Color.rgb,
   127,
   209,
   17);
   var title = function (f) {
      return $Text.centered($Text.height(50)($Text.color(elmGreen)($Text.typeface(_L.fromArray(["futura"
                                                                                               ,"sans-serif"]))($Text.fromString(f)))));
   };
   var elmBlue = A3($Color.rgb,
   76,
   166,
   195);
   var codeText = function (f) {
      return $Text.leftAligned($Text.color(elmBlue)($Text.typeface(_L.fromArray(["futura"
                                                                                ,"sans-serif"]))($Text.fromString(f))));
   };
   var elmOrange = A3($Color.rgb,
   237,
   149,
   0);
   var elmGrey = A3($Color.rgb,
   71,
   80,
   102);
   var darkerOrange = A3($Color.rgb,
   166,
   105,
   10);
   var darkerBlue = A3($Color.rgb,
   42,
   105,
   129);
   var darkerGreen = A3($Color.rgb,
   90,
   146,
   15);
   var darkerPurple = A3($Color.rgb,
   39,
   45,
   60);
   var containerColor = $Color.white;
   var backgroundColor = darkerPurple;
   var dashPresent = $Graphics$Collage.filled(elmBlue)(A2($Graphics$Collage.rect,
   35,
   5));
   var dashPast = $Graphics$Collage.alpha(0.5)($Graphics$Collage.filled(elmBlue)(A2($Graphics$Collage.rect,
   35,
   5)));
   var wayfinderFuture = $Graphics$Collage.outlined(_U.replace([["color"
                                                                ,elmBlue]
                                                               ,["width",4]],
   $Graphics$Collage.defaultLine))($Graphics$Collage.circle(13));
   var wayfinderPresent = $Graphics$Collage.filled(elmBlue)($Graphics$Collage.circle(15));
   var wayfindingWelcome = A2($Graphics$Element.flow,
   $Graphics$Element.right,
   _L.fromArray([A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))]));
   var wayfinderPast = $Graphics$Collage.alpha(0.5)($Graphics$Collage.filled(elmBlue)($Graphics$Collage.circle(15)));
   var wayfindingImports = A2($Graphics$Element.flow,
   $Graphics$Element.right,
   _L.fromArray([A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))]));
   var wayfindingSignals = A2($Graphics$Element.flow,
   $Graphics$Element.right,
   _L.fromArray([A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))]));
   var wayfindingModel = A2($Graphics$Element.flow,
   $Graphics$Element.right,
   _L.fromArray([A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))]));
   var wayfindingUpdate = A2($Graphics$Element.flow,
   $Graphics$Element.right,
   _L.fromArray([A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))]));
   var wayfindingView = A2($Graphics$Element.flow,
   $Graphics$Element.right,
   _L.fromArray([A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPresent]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderFuture]))]));
   var wayfindingCongrats = A2($Graphics$Element.flow,
   $Graphics$Element.right,
   _L.fromArray([A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([dashPast]))
                ,A3($Graphics$Collage.collage,
                30,
                50,
                _L.fromArray([wayfinderPresent]))]));
   var extraLine = A2($Basics._op["++"],
   "\n",
   "-- Copy this line too");
   var dropdownHeight = 100;
   var questionHeight = 300;
   var linkWidth = 200;
   var iconHeight = 125;
   var bottomHeight = 150;
   var gameHeight = 225;
   var codeHeight = 30;
   var subtitleHeight = 375;
   var containerHeight = 700;
   var containerWidth = 400;
   var gifElement = function (gif) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Collage.collage,
      containerWidth,
      125,
      _L.fromArray([$Graphics$Collage.toForm(gifImage)])));
   };
   var resourcesElement = function (strg) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      90,
      $Graphics$Element.middle)(subTitle(strg)));
   };
   var welcomeElement = function (strg) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      70,
      $Graphics$Element.middle)(subTitle(strg)));
   };
   var animationElement = F3(function (form,
   stepNumber,
   stepDescription) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([$Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      305,
      $Graphics$Element.middle)(A3($Graphics$Collage.collage,
      400,
      305,
      _L.fromArray([$Graphics$Collage.outlined(_U.replace([["color"
                                                           ,elmBlue]
                                                          ,["width",4]
                                                          ,["join"
                                                           ,$Graphics$Collage.Sharp(10)]
                                                          ,["cap"
                                                           ,$Graphics$Collage.Padded]],
                   $Graphics$Collage.defaultLine))(A2($Graphics$Collage.rect,
                   380,
                   260))
                   ,$Graphics$Collage.move({ctor: "_Tuple2"
                                           ,_0: 0
                                           ,_1: 100})($Graphics$Collage.toForm(subTitle(stepDescription)))
                   ,$Graphics$Collage.move({ctor: "_Tuple2"
                                           ,_0: 0
                                           ,_1: 130})($Graphics$Collage.filled(elmBlue)($Graphics$Collage.circle(15)))
                   ,$Graphics$Collage.move({ctor: "_Tuple2"
                                           ,_0: 0
                                           ,_1: 130})($Graphics$Collage.toForm(subTitle(stepNumber)))
                   ,form]))))]));
   });
   var wayfindingElement = function (wayfinding) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      50,
      $Graphics$Element.middle)(wayfinding));
   };
   var titleElement = function (strg) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      100,
      $Graphics$Element.middle)(title(strg)));
   };
   var subtitleElement = function (strg) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      subtitleHeight,
      $Graphics$Element.middle)(subTitle(strg)));
   };
   var codeTitleElement = function (strg) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      50,
      $Graphics$Element.middle)(subTitle(strg)));
   };
   var codeElement = function (gameCode) {
      return $Graphics$Element.color(containerColor)(A4($Graphics$Element.container,
      containerWidth,
      gameHeight,
      $Graphics$Element.midLeft,
      gameCode));
   };
   var helpElement = function (hoveredOn) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      bottomHeight,
      $Graphics$Element.middle)(body(hoveredOn)));
   };
   var iconElement = function (iconType) {
      return $Graphics$Element.color(containerColor)(A4($Graphics$Element.container,
      containerWidth,
      iconHeight,
      $Graphics$Element.middle,
      iconType));
   };
   var questionElement = function (strg) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      questionHeight,
      $Graphics$Element.middle)(subTitle(strg)));
   };
   var indent = 20;
   var hoveredOn = $Signal.channel("");
   var importColor = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      colorMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Color exposing (..)"));
   var importGraphicsElement = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      graphicsElementMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Graphics.Element exposing (..)"));
   var importGraphicsCollage = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      graphicsCollageMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Graphics.Collage exposing (..)"));
   var importText = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      textMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Text"));
   var importSignal = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Signal"));
   var importKeyboard = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      keyboardMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Keyboard"));
   var importTime = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      timeMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Time"));
   var importWindow = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      windowMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("import Window"));
   var importsContainer = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importColor]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importGraphicsCollage]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importGraphicsElement]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importKeyboard]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importSignal]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importText]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importTime]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,importWindow]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,codeText(extraLine)]))]));
   });
   var signalMain1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalMain1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("main ="));
   var signalMain2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalMain2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("  Signal.map2 view Window.dimensions gameState"));
   var signalsContainer1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalMain1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalMain2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,codeText(extraLine)]))]));
   });
   var signalGameState1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalGameState1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("gameState : Signal Game"));
   var signalGameState2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalGameState2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("gameState ="));
   var signalGameState3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalGameState3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(codeText("  Signal.foldp update defaultGame input"));
   var signalsContainer2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalGameState1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalGameState2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalGameState3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,codeText(extraLine)]))]));
   });
   var signalDelta1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalDelta1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("delta ="));
   var signalDelta2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalDelta2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("Signal.map inSeconds (fps 35)"));
   var signalsContainer3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalDelta1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,signalDelta2]))]));
   });
   var signalInput1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("input : Signal Input"));
   var signalInput2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("input ="));
   var signalInput3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("Signal.sampleOn delta <|"));
   var signalInput4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("Signal.map4 Input"));
   var signalInput5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("Keyboard.space"));
   var signalInput6 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput6Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("(Signal.map .x Keyboard.arrows)"));
   var signalInput7 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput7Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("(Signal.map .y Keyboard.arrows)"));
   var signalInput8 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      signalInput8Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("delta"));
   var signalsContainer4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalInput1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,signalInput2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,signalInput3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,signalInput4]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,signalInput5]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,signalInput6]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,signalInput7]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,signalInput8]))]));
   });
   var gameSize = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      gameSizeMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("(gameWidth, gameHeight) = (600, 400)"));
   var playingSize = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      playingSizeMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("(halfWidth, halfHeight) = (300, 200)"));
   var modelContainer1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,gameSize]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,playingSize]))]));
   });
   var typeState = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      typeStateMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("type State = Play | Pause"));
   var modelContainer2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
      $Graphics$Element.right,
      _L.fromArray([A2($Graphics$Element.spacer,
                   10,
                   5)
                   ,typeState]))]));
   });
   var aliasBadGuy1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasBadGuy1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("type alias BadGuy ="));
   var aliasBadGuy2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasBadGuy2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ x:Float, y:Float, vx:Float, vy:Float }"));
   var modelContainer3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,aliasBadGuy1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasBadGuy2]))]));
   });
   var aliasPlayer1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasPlayer1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("type alias Player ="));
   var aliasPlayer2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasPlayer2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ x:Float, y:Float, vx:Float, vy:Float, lives:Int }"));
   var modelContainer4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,aliasPlayer1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasPlayer2]))]));
   });
   var aliasGame1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasGame1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("type alias Game ="));
   var aliasGame2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasGame2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ state:State, badGuy:BadGuy, player1:Player }"));
   var modelContainer5 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,aliasGame1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasGame2]))]));
   });
   var defaultGame1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      defaultGame1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("defaultGame : Game"));
   var defaultGame2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      defaultGame2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("defaultGame ="));
   var defaultGame3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      defaultGame3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ state = Pause"));
   var defaultGame4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      defaultGame4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(", badGuy = { x=0, y=0, vx=300, vy=300 }"));
   var defaultGame5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      defaultGame5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(", player1 = { x = 15-halfWidth, y = 0, vx = 0,"));
   var defaultGame6 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      defaultGame5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; vy = 0, lives = 3 }"));
   var defaultGame7 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      defaultGame7Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("}"));
   var modelContainer6 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,defaultGame1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,defaultGame2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,defaultGame3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,defaultGame4]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,defaultGame5]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,defaultGame6]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,defaultGame7]))]));
   });
   var aliasInput1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasInput1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("type alias Input ="));
   var aliasInput2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasInput2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(A3($String.padLeft,
   19,
   _U.chr(" "),
   " { space : Bool")));
   var aliasInput3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasInput3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(A3($String.padLeft,
   17,
   _U.chr(" "),
   " , dir1 : Int")));
   var aliasInput4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasInput4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(A3($String.padLeft,
   17,
   _U.chr(" "),
   " , dir2 : Int")));
   var aliasInput5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasInput5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(A3($String.padLeft,
   19,
   _U.chr(" "),
   " , delta : Time")));
   var aliasInput6 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      aliasInput6Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(A3($String.padLeft,
   6,
   _U.chr(" "),
   " }")));
   var modelContainer7 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,aliasInput1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasInput2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasInput3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasInput4]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasInput5]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,aliasInput6]))]));
   });
   var updateFunc1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("update : Input -> Game -> Game"));
   var updateFunc2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("update {space,dir1,dir2,delta} ({state,badGuy,"));
   var updateFunc3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; player1} as game) ="));
   var updateFunc4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("let lives = if (badGuy `within` player1) then 1"));
   var updateFunc4a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; else 0"));
   var updateContainer1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updateFunc1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updateFunc2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateFunc3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateFunc4]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateFunc4a]))]));
   });
   var updateFunc5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("newState ="));
   var updateFunc6 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc6Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("if | space                    -> Play"));
   var updateFunc7 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc7Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("| player1.lives == 0 -> Pause"));
   var updateFunc8 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc8Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("| otherwise              -> state"));
   var updateContainer2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateFunc5]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateFunc6]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateFunc7]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateFunc8]))]));
   });
   var updateFunc9 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc9Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("newBadGuy ="));
   var updateFunc10 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc10Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("if state == Pause"));
   var updateFunc11 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc11Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("then badGuy"));
   var updateFunc12 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc12Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("else updateBadGuy delta badGuy player1"));
   var updateContainer3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateFunc9]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateFunc10]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateFunc11]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateFunc12]))]));
   });
   var updateFunc13 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc13Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("in"));
   var updateFunc14 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc14Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ game |"));
   var updateFunc15 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc15Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("state   <- newState,"));
   var updateFunc16 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc16Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("badGuy  <- newBadGuy,"));
   var updateFunc17 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc17Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("player1 <- updatePlayer delta dir1 dir2"));
   var updateFunc17a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc17Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; lives player1"));
   var updateFunc18 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateFunc18Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("}"));
   var updateContainer4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateFunc13]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateFunc14]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateFunc15]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateFunc16]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateFunc17]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateFunc17a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateFunc18]))]));
   });
   var updateBadGuy1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("updateBadGuy : Time -> BadGuy -> Player ->"));
   var updateBadGuy1a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; BadGuy"));
   var updateBadGuy2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("updateBadGuy t ({x,y,vx,vy} as badGuy)"));
   var updateBadGuy2a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; ({x,y,vx,vy,lives} as player1) ="));
   var updateContainer5 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updateBadGuy1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateBadGuy1a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updateBadGuy2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateBadGuy2a]))]));
   });
   var updateBadGuy3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("if | (player1.lives == 0) -> { badGuy | x <- 0,"));
   var updateBadGuy3a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; y <- 0}"));
   var updateBadGuy4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("| (badGuy `within` player1) -> physicsUpdate t"));
   var updateBadGuy5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ badGuy |"));
   var updateBadGuy6 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy6Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("vx <- stepV vx (badGuy.vx < 0)"));
   var updateBadGuy6a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy6Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; (badGuy.vx > 0),"));
   var updateBadGuy7 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy7Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("vy <- stepV vy (badGuy.vy < 0 ) "));
   var updateBadGuy7a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy7Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; (badGuy.vy > 0)"));
   var updateBadGuy8 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy8Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("}"));
   var updateContainer6 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateBadGuy3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateBadGuy3a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateBadGuy4]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateBadGuy5]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateBadGuy6]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                85,
                                5)
                                ,updateBadGuy6a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateBadGuy7]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                85,
                                5)
                                ,updateBadGuy7a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateBadGuy8]))]));
   });
   var updateBadGuy9 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy9Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("| otherwise -> physicsUpdate t"));
   var updateBadGuy10 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy10Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ badGuy |"));
   var updateBadGuy11 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy11Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("vx <- stepV vx (x < 25-halfWidth) "));
   var updateBadGuy11a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy11Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; (x > halfWidth-25),"));
   var updateBadGuy12 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy12Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("vy <- stepV vy (y < 25-halfHeight) "));
   var updateBadGuy12a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy12Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; (y > halfHeight-25)"));
   var updateBadGuy13 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateBadGuy13Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("}"));
   var updateContainer7 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateBadGuy9]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateBadGuy10]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateBadGuy11]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                85,
                                5)
                                ,updateBadGuy11a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,updateBadGuy12]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                85,
                                5)
                                ,updateBadGuy12a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updateBadGuy13]))]));
   });
   var updatePlayer1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("updatePlayer : Time -> Int -> Int -> Int -> "));
   var updatePlayer1a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; Player -> Player"));
   var updatePlayer2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("updatePlayer t dir1 dir2 lives player ="));
   var updateContainer8 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updatePlayer1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updatePlayer1a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updatePlayer2]))]));
   });
   var updatePlayer3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("let player1 = physicsUpdate  t { player | "));
   var updatePlayer3a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; vx <- toFloat dir1 * 200"));
   var updatePlayer4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("vy <- toFloat dir2 * 200}"));
   var updatePlayer5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("alive = if (player.lives - lives < 0)"));
   var updatePlayer6 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer6Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("then 0"));
   var updatePlayer7 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer7Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("else (player.lives - lives)"));
   var updateContainer9 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updatePlayer3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                130,
                                5)
                                ,updatePlayer3a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                130,
                                5)
                                ,updatePlayer4]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updatePlayer5]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updatePlayer6]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updatePlayer7]))]));
   });
   var updatePlayer8 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer8Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("in"));
   var updatePlayer9 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer9Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ player1 |"));
   var updatePlayer10 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer10Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("y <- clamp (35-halfHeight) (halfHeight-35)"));
   var updatePlayer10a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer10Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; player1.y,"));
   var updatePlayer11 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer11Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("x <- clamp (35-halfWidth) (halfWidth-35)"));
   var updatePlayer11a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer11Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; player1.x,"));
   var updatePlayer12 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer12Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("lives <- alive"));
   var updatePlayer13 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePlayer13Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("}"));
   var updateContainer10 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updatePlayer8]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updatePlayer9]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updatePlayer10]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                85,
                                5)
                                ,updatePlayer10a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updatePlayer11]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                85,
                                5)
                                ,updatePlayer11a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,updatePlayer12]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updatePlayer13]))]));
   });
   var updatePhysics1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePhysics1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("physicsUpdate t ({x,y,vx,vy} as obj) ="));
   var updatePhysics2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePhysics2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("{ obj |"));
   var updatePhysics3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePhysics3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("x <- x + vx * t,"));
   var updatePhysics4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePhysics4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("y <- y + vy * t"));
   var updatePhysics5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updatePhysics5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("}"));
   var updateContainer11 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updatePhysics1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updatePhysics2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updatePhysics3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updatePhysics4]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updatePhysics5]))]));
   });
   var updateNear1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateNear1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("near k c n ="));
   var updateNear2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateNear2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("n >= k-c && n <= k+c"));
   var updateContainer12 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updateNear1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateNear2]))]));
   });
   var updateWithin1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateWithin1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("within badGuy player1 ="));
   var updateWithin2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateWithin2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("near player1.x 25 badGuy.x && "));
   var updateWithin2a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateWithin2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; near player1.y 25 badGuy.y"));
   var updateContainer13 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updateWithin1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateWithin2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateWithin2a]))]));
   });
   var updateStepV1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateStepV1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("stepV v condition1 condition2 ="));
   var updateStepV2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateStepV2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("if | condition1 -> abs v"));
   var updateStepV3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateStepV3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("| condition2 -> 0 - abs v"));
   var updateStepV4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      updateStepV4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("| otherwise  -> v"));
   var updateContainer14 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,updateStepV1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,updateStepV2]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateStepV3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,updateStepV4]))]));
   });
   var viewFunc1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("view : (Int, Int) -> Game -> Element"));
   var viewFunc2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("view (w, h) {state, badGuy, player1} ="));
   var viewContainer1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,viewFunc1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,viewFunc2]))]));
   });
   var viewFunc3 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc3Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("let lives : Element"));
   var viewFunc4 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc4Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("lives = txt(Text.height 50) (toString player1.lives)"));
   var viewContainer2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,viewFunc3]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,viewFunc4]))]));
   });
   var viewFunc5 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc5Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("in"));
   var viewFunc6 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc6Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("container w h middle <|"));
   var viewFunc7 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc7Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("collage gameWidth gameHeight"));
   var viewContainer3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,viewFunc5]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,viewFunc6]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                40,
                                5)
                                ,viewFunc7]))]));
   });
   var viewFunc8 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc8Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("[ rect gameWidth gameHeight"));
   var viewFunc9 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc9Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("|> filled elmGrey"));
   var viewContainer4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,viewFunc8]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,viewFunc9]))]));
   });
   var viewFunc10 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc10Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(", ngon 6 25 "));
   var viewFunc11 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc11Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("|> filled elmOrange"));
   var viewFunc12 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc12Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("|> move (badGuy.x, badGuy.y)"));
   var viewContainer5 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,viewFunc10]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,viewFunc11]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,viewFunc12]))]));
   });
   var viewFunc13 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc13Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(", circle 20"));
   var viewFunc14 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc14Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("|> filled elmBlue"));
   var viewFunc15 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc15Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("|> move (player1.x, player1.y)"));
   var viewContainer6 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,viewFunc13]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,viewFunc14]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,viewFunc15]))]));
   });
   var viewFunc16 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc16Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(", toForm lives"));
   var viewFunc17 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc17Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("|> move (0, gameHeight/2 - 40)"));
   var viewContainer7 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,viewFunc16]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,viewFunc17]))]));
   });
   var viewFunc18 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc18Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body(", toForm (if state == Play then spacer 1 1"));
   var viewFunc18a = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc18Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; else txt identity msg"));
   var viewFunc19 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc19Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("|> move (0, 40 - gameHeight/2)"));
   var viewFunc20 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      viewFunc20Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("]"));
   var viewContainer8 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,viewFunc18]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                85,
                                5)
                                ,viewFunc18a]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                70,
                                5)
                                ,viewFunc19]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                55,
                                5)
                                ,viewFunc20]))]));
   });
   var elmGreyColor = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      elmGreyColorMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("elmGrey = rgb 71 80 102"));
   var elmBlueColor = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      elmBlueColorMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("elmBlue = rgb 76 166 195"));
   var elmGreenColor = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      elmGreenColorMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("elmGreen = rgb 127 209 17"));
   var textColor = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      textColorMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("textColor = white"));
   var viewContainer9 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,elmGreyColor]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,elmBlueColor]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,elmGreenColor]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,textColor]))]));
   });
   var txtFunc1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      txtFunc1Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("txt f = Text.fromString >> Text.color textColor >>"));
   var txtFunc2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      txtFunc2Msg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; Text.monospace >> f >> leftAligned"));
   var viewContainer10 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,txtFunc1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,txtFunc2]))]));
   });
   var msgFunc1 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      msgFuncMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("msg = \'SPACE to start, &larr ;&uarr ;&darr ;"));
   var msgFunc2 = $Graphics$Input.hoverable(function (r) {
      return r ? A2($Signal.send,
      hoveredOn,
      msgFuncMsg) : A2($Signal.send,
      hoveredOn,
      "");
   })(body("&uArr; &rarr ; to move\'"));
   var viewContainer11 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                10,
                                5)
                                ,msgFunc1]))
                   ,A2($Graphics$Element.flow,
                   $Graphics$Element.right,
                   _L.fromArray([A2($Graphics$Element.spacer,
                                25,
                                5)
                                ,msgFunc2]))]));
   });
   var chan = $Signal.channel(0);
   var sig = $Signal.subscribe(chan);
   var customLButton = function (sig) {
      return A4($Graphics$Input.customButton,
      A2($Signal.send,chan,sig - 1),
      A3($Graphics$Element.image,
      40,
      40,
      "/images/leftButton.svg"),
      A3($Graphics$Element.image,
      40,
      40,
      "/images/leftButton.svg"),
      A3($Graphics$Element.image,
      40,
      40,
      "/images/leftButton.svg"));
   };
   var customRButton = function (sig) {
      return A4($Graphics$Input.customButton,
      A2($Signal.send,chan,sig + 1),
      A3($Graphics$Element.image,
      40,
      40,
      "/images/rightButton.svg"),
      A3($Graphics$Element.image,
      40,
      40,
      "/images/rightButton.svg"),
      A3($Graphics$Element.image,
      40,
      40,
      "/images/rightButton.svg"));
   };
   var buttonsLRElement = function (sig) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      50,
      $Graphics$Element.midRight)(A2($Graphics$Element.flow,
      $Graphics$Element.left,
      _L.fromArray([A2($Graphics$Element.spacer,
                   5,
                   1)
                   ,customRButton(sig)
                   ,A2($Graphics$Element.spacer,
                   5,
                   1)
                   ,customLButton(sig)]))));
   };
   var displayWelcome2 = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingWelcome)
                   ,titleElement(welcomeMsg1)
                   ,gifElement(gifImage)
                   ,welcomeElement(welcomeMsg2)
                   ,A3(animationElement,
                   welcomeAnimation2,
                   stepNumber2,
                   stepDescription2)
                   ,buttonsLRElement(sig)]));
   };
   var displayWelcome3 = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingWelcome)
                   ,titleElement(welcomeMsg1)
                   ,gifElement(gifImage)
                   ,welcomeElement(welcomeMsg2)
                   ,A3(animationElement,
                   welcomeAnimation3,
                   stepNumber3,
                   stepDescription3)
                   ,buttonsLRElement(sig)]));
   };
   var importsWelcome = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingImports)
                   ,titleElement(importsWelcomeMsg1)
                   ,iconElement(importsIcon)
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
                   containerWidth,
                   100,
                   $Graphics$Element.middle)(subTitle(importsWelcomeMsg2)))
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Collage.collage,
                   containerWidth,
                   275,
                   _L.fromArray([$Graphics$Collage.toForm(importsGIF)])))
                   ,buttonsLRElement(sig)]));
   };
   var displayImports = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingImports)
                   ,titleElement(importsWelcomeMsg1)
                   ,iconElement(importsIcon)
                   ,codeElement(A2(importsContainer,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var signalsWelcome = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingSignals)
                   ,titleElement(signalsWelcomeMsg1)
                   ,iconElement(signalsIcon)
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
                   containerWidth,
                   100,
                   $Graphics$Element.middle)(subTitle(signalsWelcomeMsg2)))
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Collage.collage,
                   containerWidth,
                   275,
                   _L.fromArray([$Graphics$Collage.toForm(buttonGIF)])))
                   ,buttonsLRElement(sig)]));
   };
   var displaySignals1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingSignals)
                   ,titleElement(signalsWelcomeMsg1)
                   ,iconElement(signalsIcon)
                   ,codeElement(A2(signalsContainer1,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displaySignals2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingSignals)
                   ,titleElement(signalsWelcomeMsg1)
                   ,iconElement(signalsIcon)
                   ,codeElement(A2(signalsContainer2,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displaySignals3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingSignals)
                   ,titleElement(signalsWelcomeMsg1)
                   ,iconElement(signalsIcon)
                   ,codeElement(A2(signalsContainer3,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displaySignals4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingSignals)
                   ,titleElement(signalsWelcomeMsg1)
                   ,iconElement(signalsIcon)
                   ,codeElement(A2(signalsContainer4,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var modelWelcome = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
                   containerWidth,
                   100,
                   $Graphics$Element.middle)(subTitle(modelWelcomeMsg2)))
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Collage.collage,
                   containerWidth,
                   275,
                   _L.fromArray([$Graphics$Collage.toForm(modelGIF)])))
                   ,buttonsLRElement(sig)]));
   };
   var displayModel1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,codeElement(A2(modelContainer1,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayModel2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,codeElement(A2(modelContainer2,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayModel3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,codeElement(A2(modelContainer3,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayModel4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,codeElement(A2(modelContainer4,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayModel5 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,codeElement(A2(modelContainer5,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayModel6 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,codeElement(A2(modelContainer6,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayModel7 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingModel)
                   ,titleElement(modelWelcomeMsg1)
                   ,iconElement(modelIcon)
                   ,codeElement(A2(modelContainer7,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var updateWelcome = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
                   containerWidth,
                   100,
                   $Graphics$Element.middle)(subTitle(updateWelcomeMsg2)))
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Collage.collage,
                   containerWidth,
                   275,
                   _L.fromArray([$Graphics$Collage.toForm(updateGIF)])))
                   ,buttonsLRElement(sig)]));
   };
   var displayUpdate1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer1,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer2,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer3,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer4,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate5 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer5,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate6 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer6,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate7 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer7,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate8 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer8,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate9 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer9,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate10 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer10,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate11 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer11,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate12 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer12,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate13 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer13,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayUpdate14 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingUpdate)
                   ,titleElement(updateWelcomeMsg1)
                   ,iconElement(updateIcon)
                   ,codeElement(A2(updateContainer14,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var viewWelcome = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
                   containerWidth,
                   100,
                   $Graphics$Element.middle)(subTitle(viewWelcomeMsg2)))
                   ,$Graphics$Element.color(containerColor)(A3($Graphics$Collage.collage,
                   containerWidth,
                   275,
                   _L.fromArray([$Graphics$Collage.toForm(viewGIF)])))
                   ,buttonsLRElement(sig)]));
   };
   var displayView1 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer1,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView2 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer2,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView3 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer3,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView4 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer4,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView5 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer5,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView6 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer6,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView7 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer7,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView8 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer8,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView9 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer9,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView10 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer10,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var displayView11 = F2(function (sig,
   hoveredOn) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingView)
                   ,titleElement(viewWelcomeMsg1)
                   ,iconElement(viewIcon)
                   ,codeElement(A2(viewContainer11,
                   sig,
                   hoveredOn))
                   ,helpElement(hoveredOn)
                   ,buttonsLRElement(sig)]));
   });
   var congrats = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingCongrats)
                   ,titleElement(viewCongratsMsg1)
                   ,iconElement(elmLogoGIF1)
                   ,subtitleElement(viewCongratsMsg2)
                   ,buttonsLRElement(sig)]));
   };
   var idea1 = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingCongrats)
                   ,titleElement(viewIdea1Msg1)
                   ,iconElement(elmLogoGIF2)
                   ,subtitleElement(viewIdea1Msg2)
                   ,buttonsLRElement(sig)]));
   };
   var idea2 = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingCongrats)
                   ,titleElement(viewIdea2Msg1)
                   ,iconElement(elmLogoGIF3)
                   ,subtitleElement(viewIdea2Msg2)
                   ,buttonsLRElement(sig)]));
   };
   var idea3 = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingCongrats)
                   ,titleElement(viewIdea3Msg1)
                   ,iconElement(elmLogoGIF4)
                   ,subtitleElement(viewIdea3Msg2)
                   ,buttonsLRElement(sig)]));
   };
   var customGoButton = function (sig) {
      return A4($Graphics$Input.customButton,
      A2($Signal.send,chan,sig + 1),
      A3($Graphics$Element.image,
      100,
      40,
      "/images/goButton.svg"),
      A3($Graphics$Element.image,
      100,
      40,
      "/images/goButton.svg"),
      A3($Graphics$Element.image,
      100,
      40,
      "/images/goButton.svg"));
   };
   var buttonGoElement = function (sig) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      50,
      $Graphics$Element.midRight)(A2($Graphics$Element.flow,
      $Graphics$Element.left,
      _L.fromArray([A2($Graphics$Element.spacer,
                   5,
                   1)
                   ,customGoButton(sig)]))));
   };
   var displayWelcome1 = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingWelcome)
                   ,titleElement(welcomeMsg1)
                   ,gifElement(gifImage)
                   ,welcomeElement(welcomeMsg2)
                   ,A3(animationElement,
                   welcomeAnimation1,
                   stepNumber1,
                   stepDescription1)
                   ,buttonGoElement(sig)]));
   };
   var customRestartButton = A4($Graphics$Input.customButton,
   A2($Signal.send,chan,0),
   A3($Graphics$Element.image,
   100,
   40,
   "/images/restartButton.svg"),
   A3($Graphics$Element.image,
   100,
   40,
   "/images/restartButton.svg"),
   A3($Graphics$Element.image,
   100,
   40,
   "/images/restartButton.svg"));
   var buttonSOElement = function (sig) {
      return $Graphics$Element.color(containerColor)(A3($Graphics$Element.container,
      containerWidth,
      50,
      $Graphics$Element.midLeft)(A2($Graphics$Element.flow,
      $Graphics$Element.right,
      _L.fromArray([A2($Graphics$Element.spacer,
                   5,
                   1)
                   ,customRestartButton]))));
   };
   var elmResources = function (sig) {
      return A2($Graphics$Element.flow,
      $Graphics$Element.down,
      _L.fromArray([wayfindingElement(wayfindingCongrats)
                   ,titleElement(resourcesTitle)
                   ,iconElement(elmLogoGIF5)
                   ,resourcesElement(resourcesMsg)
                   ,$Graphics$Element.color(containerColor)(A4($Graphics$Element.container,
                   containerWidth,
                   285,
                   $Graphics$Element.middle,
                   A2($Graphics$Element.flow,
                   $Graphics$Element.down,
                   _L.fromArray([subTitle("Elm Websites")
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                packageLink)
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                exampleLink)
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                syntaxLink)
                                ,A2($Graphics$Element.spacer,
                                1,
                                5)
                                ,subTitle("Elm Community")
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                mailingLink)
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                twitterLink)
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                ircLink)
                                ,A2($Graphics$Element.spacer,
                                1,
                                5)
                                ,subTitle("Elm Videos")
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                videoLink1)
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                videoLink2)
                                ,A3($Html.toElement,
                                linkWidth,
                                20,
                                videoLink3)]))))
                   ,buttonSOElement(sig)]));
   };
   var view = F2(function (sig,
   hoveredOn) {
      return $Graphics$Element.color(backgroundColor)(A4($Graphics$Element.container,
      420,
      720,
      $Graphics$Element.middle,
      _U.eq(sig,
      0) ? displayWelcome1(sig) : _U.eq(sig,
      1) ? displayWelcome2(sig) : _U.eq(sig,
      2) ? displayWelcome3(sig) : _U.eq(sig,
      3) ? importsWelcome(sig) : _U.eq(sig,
      4) ? A2(displayImports,
      sig,
      hoveredOn) : _U.eq(sig,
      5) ? signalsWelcome(sig) : _U.eq(sig,
      6) ? A2(displaySignals1,
      sig,
      hoveredOn) : _U.eq(sig,
      7) ? A2(displaySignals2,
      sig,
      hoveredOn) : _U.eq(sig,
      8) ? A2(displaySignals3,
      sig,
      hoveredOn) : _U.eq(sig,
      9) ? A2(displaySignals4,
      sig,
      hoveredOn) : _U.eq(sig,
      10) ? modelWelcome(sig) : _U.eq(sig,
      11) ? A2(displayModel1,
      sig,
      hoveredOn) : _U.eq(sig,
      12) ? A2(displayModel2,
      sig,
      hoveredOn) : _U.eq(sig,
      13) ? A2(displayModel3,
      sig,
      hoveredOn) : _U.eq(sig,
      14) ? A2(displayModel4,
      sig,
      hoveredOn) : _U.eq(sig,
      15) ? A2(displayModel5,
      sig,
      hoveredOn) : _U.eq(sig,
      16) ? A2(displayModel6,
      sig,
      hoveredOn) : _U.eq(sig,
      17) ? A2(displayModel7,
      sig,
      hoveredOn) : _U.eq(sig,
      18) ? updateWelcome(sig) : _U.eq(sig,
      19) ? A2(displayUpdate1,
      sig,
      hoveredOn) : _U.eq(sig,
      20) ? A2(displayUpdate2,
      sig,
      hoveredOn) : _U.eq(sig,
      21) ? A2(displayUpdate3,
      sig,
      hoveredOn) : _U.eq(sig,
      22) ? A2(displayUpdate4,
      sig,
      hoveredOn) : _U.eq(sig,
      23) ? A2(displayUpdate5,
      sig,
      hoveredOn) : _U.eq(sig,
      24) ? A2(displayUpdate6,
      sig,
      hoveredOn) : _U.eq(sig,
      25) ? A2(displayUpdate7,
      sig,
      hoveredOn) : _U.eq(sig,
      26) ? A2(displayUpdate8,
      sig,
      hoveredOn) : _U.eq(sig,
      27) ? A2(displayUpdate9,
      sig,
      hoveredOn) : _U.eq(sig,
      28) ? A2(displayUpdate10,
      sig,
      hoveredOn) : _U.eq(sig,
      29) ? A2(displayUpdate11,
      sig,
      hoveredOn) : _U.eq(sig,
      30) ? A2(displayUpdate12,
      sig,
      hoveredOn) : _U.eq(sig,
      31) ? A2(displayUpdate13,
      sig,
      hoveredOn) : _U.eq(sig,
      32) ? A2(displayUpdate14,
      sig,
      hoveredOn) : _U.eq(sig,
      33) ? viewWelcome(sig) : _U.eq(sig,
      34) ? A2(displayView1,
      sig,
      hoveredOn) : _U.eq(sig,
      35) ? A2(displayView2,
      sig,
      hoveredOn) : _U.eq(sig,
      36) ? A2(displayView3,
      sig,
      hoveredOn) : _U.eq(sig,
      37) ? A2(displayView4,
      sig,
      hoveredOn) : _U.eq(sig,
      38) ? A2(displayView5,
      sig,
      hoveredOn) : _U.eq(sig,
      39) ? A2(displayView6,
      sig,
      hoveredOn) : _U.eq(sig,
      40) ? A2(displayView7,
      sig,
      hoveredOn) : _U.eq(sig,
      41) ? A2(displayView8,
      sig,
      hoveredOn) : _U.eq(sig,
      42) ? A2(displayView9,
      sig,
      hoveredOn) : _U.eq(sig,
      43) ? A2(displayView10,
      sig,
      hoveredOn) : _U.eq(sig,
      44) ? A2(displayView11,
      sig,
      hoveredOn) : _U.eq(sig,
      45) ? congrats(sig) : _U.eq(sig,
      46) ? idea1(sig) : _U.eq(sig,
      47) ? idea2(sig) : _U.eq(sig,
      48) ? idea3(sig) : _U.eq(sig,
      49) ? elmResources(sig) : displayWelcome1(sig)));
   });
   var main = A3($Signal.map2,
   view,
   sig,
   $Signal.subscribe(hoveredOn));
   _elm.Main.values = {_op: _op
                      ,main: main
                      ,chan: chan
                      ,sig: sig
                      ,hoveredOn: hoveredOn
                      ,view: view
                      ,indent: indent
                      ,containerWidth: containerWidth
                      ,containerHeight: containerHeight
                      ,subtitleHeight: subtitleHeight
                      ,codeHeight: codeHeight
                      ,gameHeight: gameHeight
                      ,bottomHeight: bottomHeight
                      ,iconHeight: iconHeight
                      ,linkWidth: linkWidth
                      ,questionHeight: questionHeight
                      ,dropdownHeight: dropdownHeight
                      ,extraLine: extraLine
                      ,wayfinderPast: wayfinderPast
                      ,wayfinderPresent: wayfinderPresent
                      ,wayfinderFuture: wayfinderFuture
                      ,dashPast: dashPast
                      ,dashPresent: dashPresent
                      ,gifElement: gifElement
                      ,resourcesElement: resourcesElement
                      ,welcomeElement: welcomeElement
                      ,animationElement: animationElement
                      ,wayfindingElement: wayfindingElement
                      ,titleElement: titleElement
                      ,subtitleElement: subtitleElement
                      ,codeTitleElement: codeTitleElement
                      ,codeElement: codeElement
                      ,helpElement: helpElement
                      ,iconElement: iconElement
                      ,buttonGoElement: buttonGoElement
                      ,buttonsLRElement: buttonsLRElement
                      ,buttonSOElement: buttonSOElement
                      ,questionElement: questionElement
                      ,customLButton: customLButton
                      ,customRButton: customRButton
                      ,customGoButton: customGoButton
                      ,customRestartButton: customRestartButton
                      ,backgroundColor: backgroundColor
                      ,containerColor: containerColor
                      ,darkerPurple: darkerPurple
                      ,darkerGreen: darkerGreen
                      ,darkerBlue: darkerBlue
                      ,darkerOrange: darkerOrange
                      ,elmGrey: elmGrey
                      ,elmOrange: elmOrange
                      ,elmBlue: elmBlue
                      ,elmGreen: elmGreen
                      ,gifImage: gifImage
                      ,copyCode: copyCode
                      ,hoverCode: hoverCode
                      ,multiLine: multiLine
                      ,importsGIF: importsGIF
                      ,buttonGIF: buttonGIF
                      ,modelGIF: modelGIF
                      ,updateGIF: updateGIF
                      ,viewGIF: viewGIF
                      ,elmLogoGIF1: elmLogoGIF1
                      ,elmLogoGIF2: elmLogoGIF2
                      ,elmLogoGIF3: elmLogoGIF3
                      ,elmLogoGIF4: elmLogoGIF4
                      ,elmLogoGIF5: elmLogoGIF5
                      ,importsIcon: importsIcon
                      ,modelIcon: modelIcon
                      ,signalsIcon: signalsIcon
                      ,updateIcon: updateIcon
                      ,viewIcon: viewIcon
                      ,title: title
                      ,subTitle: subTitle
                      ,body: body
                      ,middleText: middleText
                      ,codeText: codeText
                      ,displayWelcome1: displayWelcome1
                      ,wayfindingWelcome: wayfindingWelcome
                      ,welcomeMsg1: welcomeMsg1
                      ,welcomeMsg2: welcomeMsg2
                      ,stepNumber1: stepNumber1
                      ,stepDescription1: stepDescription1
                      ,welcomeAnimation1: welcomeAnimation1
                      ,displayWelcome2: displayWelcome2
                      ,stepNumber2: stepNumber2
                      ,stepDescription2: stepDescription2
                      ,welcomeAnimation2: welcomeAnimation2
                      ,displayWelcome3: displayWelcome3
                      ,stepNumber3: stepNumber3
                      ,stepDescription3: stepDescription3
                      ,welcomeAnimation3: welcomeAnimation3
                      ,importsWelcome: importsWelcome
                      ,wayfindingImports: wayfindingImports
                      ,importsWelcomeMsg1: importsWelcomeMsg1
                      ,importsWelcomeMsg2: importsWelcomeMsg2
                      ,displayImports: displayImports
                      ,importsContainer: importsContainer
                      ,colorMsg: colorMsg
                      ,importColor: importColor
                      ,graphicsElementMsg: graphicsElementMsg
                      ,importGraphicsElement: importGraphicsElement
                      ,graphicsCollageMsg: graphicsCollageMsg
                      ,importGraphicsCollage: importGraphicsCollage
                      ,textMsg: textMsg
                      ,importText: importText
                      ,signalMsg: signalMsg
                      ,importSignal: importSignal
                      ,keyboardMsg: keyboardMsg
                      ,importKeyboard: importKeyboard
                      ,timeMsg: timeMsg
                      ,importTime: importTime
                      ,windowMsg: windowMsg
                      ,importWindow: importWindow
                      ,signalsWelcome: signalsWelcome
                      ,wayfindingSignals: wayfindingSignals
                      ,signalsWelcomeMsg1: signalsWelcomeMsg1
                      ,signalsWelcomeMsg2: signalsWelcomeMsg2
                      ,displaySignals1: displaySignals1
                      ,signalsContainer1: signalsContainer1
                      ,signalMain1Msg: signalMain1Msg
                      ,signalMain1: signalMain1
                      ,signalMain2Msg: signalMain2Msg
                      ,signalMain2: signalMain2
                      ,displaySignals2: displaySignals2
                      ,signalsContainer2: signalsContainer2
                      ,signalGameState1Msg: signalGameState1Msg
                      ,signalGameState1: signalGameState1
                      ,signalGameState2Msg: signalGameState2Msg
                      ,signalGameState2: signalGameState2
                      ,signalGameState3Msg: signalGameState3Msg
                      ,signalGameState3: signalGameState3
                      ,displaySignals3: displaySignals3
                      ,signalsContainer3: signalsContainer3
                      ,signalDelta1Msg: signalDelta1Msg
                      ,signalDelta1: signalDelta1
                      ,signalDelta2Msg: signalDelta2Msg
                      ,signalDelta2: signalDelta2
                      ,displaySignals4: displaySignals4
                      ,signalsContainer4: signalsContainer4
                      ,signalInput1Msg: signalInput1Msg
                      ,signalInput1: signalInput1
                      ,signalInput2Msg: signalInput2Msg
                      ,signalInput2: signalInput2
                      ,signalInput3Msg: signalInput3Msg
                      ,signalInput3: signalInput3
                      ,signalInput4Msg: signalInput4Msg
                      ,signalInput4: signalInput4
                      ,signalInput5Msg: signalInput5Msg
                      ,signalInput5: signalInput5
                      ,signalInput6Msg: signalInput6Msg
                      ,signalInput6: signalInput6
                      ,signalInput7Msg: signalInput7Msg
                      ,signalInput7: signalInput7
                      ,signalInput8Msg: signalInput8Msg
                      ,signalInput8: signalInput8
                      ,modelWelcome: modelWelcome
                      ,wayfindingModel: wayfindingModel
                      ,modelWelcomeMsg1: modelWelcomeMsg1
                      ,modelWelcomeMsg2: modelWelcomeMsg2
                      ,displayModel1: displayModel1
                      ,modelContainer1: modelContainer1
                      ,gameSizeMsg: gameSizeMsg
                      ,gameSize: gameSize
                      ,playingSizeMsg: playingSizeMsg
                      ,playingSize: playingSize
                      ,displayModel2: displayModel2
                      ,modelContainer2: modelContainer2
                      ,typeStateMsg: typeStateMsg
                      ,typeState: typeState
                      ,displayModel3: displayModel3
                      ,modelContainer3: modelContainer3
                      ,aliasBadGuy1Msg: aliasBadGuy1Msg
                      ,aliasBadGuy1: aliasBadGuy1
                      ,aliasBadGuy2Msg: aliasBadGuy2Msg
                      ,aliasBadGuy2: aliasBadGuy2
                      ,displayModel4: displayModel4
                      ,modelContainer4: modelContainer4
                      ,aliasPlayer1Msg: aliasPlayer1Msg
                      ,aliasPlayer1: aliasPlayer1
                      ,aliasPlayer2Msg: aliasPlayer2Msg
                      ,aliasPlayer2: aliasPlayer2
                      ,displayModel5: displayModel5
                      ,modelContainer5: modelContainer5
                      ,aliasGame1Msg: aliasGame1Msg
                      ,aliasGame1: aliasGame1
                      ,aliasGame2Msg: aliasGame2Msg
                      ,aliasGame2: aliasGame2
                      ,displayModel6: displayModel6
                      ,modelContainer6: modelContainer6
                      ,defaultGame1Msg: defaultGame1Msg
                      ,defaultGame1: defaultGame1
                      ,defaultGame2Msg: defaultGame2Msg
                      ,defaultGame2: defaultGame2
                      ,defaultGame3Msg: defaultGame3Msg
                      ,defaultGame3: defaultGame3
                      ,defaultGame4Msg: defaultGame4Msg
                      ,defaultGame4: defaultGame4
                      ,defaultGame5Msg: defaultGame5Msg
                      ,defaultGame5: defaultGame5
                      ,defaultGame6: defaultGame6
                      ,defaultGame7Msg: defaultGame7Msg
                      ,defaultGame7: defaultGame7
                      ,displayModel7: displayModel7
                      ,modelContainer7: modelContainer7
                      ,aliasInput1Msg: aliasInput1Msg
                      ,aliasInput1: aliasInput1
                      ,aliasInput2Msg: aliasInput2Msg
                      ,aliasInput2: aliasInput2
                      ,aliasInput3Msg: aliasInput3Msg
                      ,aliasInput3: aliasInput3
                      ,aliasInput4Msg: aliasInput4Msg
                      ,aliasInput4: aliasInput4
                      ,aliasInput5Msg: aliasInput5Msg
                      ,aliasInput5: aliasInput5
                      ,aliasInput6Msg: aliasInput6Msg
                      ,aliasInput6: aliasInput6
                      ,updateWelcome: updateWelcome
                      ,wayfindingUpdate: wayfindingUpdate
                      ,updateWelcomeMsg1: updateWelcomeMsg1
                      ,updateWelcomeMsg2: updateWelcomeMsg2
                      ,displayUpdate1: displayUpdate1
                      ,updateContainer1: updateContainer1
                      ,updateFunc1Msg: updateFunc1Msg
                      ,updateFunc1: updateFunc1
                      ,updateFunc2Msg: updateFunc2Msg
                      ,updateFunc2: updateFunc2
                      ,updateFunc3: updateFunc3
                      ,updateFunc4Msg: updateFunc4Msg
                      ,updateFunc4: updateFunc4
                      ,updateFunc4a: updateFunc4a
                      ,displayUpdate2: displayUpdate2
                      ,updateContainer2: updateContainer2
                      ,updateFunc5Msg: updateFunc5Msg
                      ,updateFunc5: updateFunc5
                      ,updateFunc6Msg: updateFunc6Msg
                      ,updateFunc6: updateFunc6
                      ,updateFunc7Msg: updateFunc7Msg
                      ,updateFunc7: updateFunc7
                      ,updateFunc8Msg: updateFunc8Msg
                      ,updateFunc8: updateFunc8
                      ,displayUpdate3: displayUpdate3
                      ,updateContainer3: updateContainer3
                      ,updateFunc9Msg: updateFunc9Msg
                      ,updateFunc9: updateFunc9
                      ,updateFunc10Msg: updateFunc10Msg
                      ,updateFunc10: updateFunc10
                      ,updateFunc11Msg: updateFunc11Msg
                      ,updateFunc11: updateFunc11
                      ,updateFunc12Msg: updateFunc12Msg
                      ,updateFunc12: updateFunc12
                      ,displayUpdate4: displayUpdate4
                      ,updateContainer4: updateContainer4
                      ,updateFunc13Msg: updateFunc13Msg
                      ,updateFunc13: updateFunc13
                      ,updateFunc14Msg: updateFunc14Msg
                      ,updateFunc14: updateFunc14
                      ,updateFunc15Msg: updateFunc15Msg
                      ,updateFunc15: updateFunc15
                      ,updateFunc16Msg: updateFunc16Msg
                      ,updateFunc16: updateFunc16
                      ,updateFunc17Msg: updateFunc17Msg
                      ,updateFunc17: updateFunc17
                      ,updateFunc17a: updateFunc17a
                      ,updateFunc18Msg: updateFunc18Msg
                      ,updateFunc18: updateFunc18
                      ,displayUpdate5: displayUpdate5
                      ,updateContainer5: updateContainer5
                      ,updateBadGuy1Msg: updateBadGuy1Msg
                      ,updateBadGuy1: updateBadGuy1
                      ,updateBadGuy1a: updateBadGuy1a
                      ,updateBadGuy2Msg: updateBadGuy2Msg
                      ,updateBadGuy2: updateBadGuy2
                      ,updateBadGuy2a: updateBadGuy2a
                      ,displayUpdate6: displayUpdate6
                      ,updateContainer6: updateContainer6
                      ,updateBadGuy3Msg: updateBadGuy3Msg
                      ,updateBadGuy3: updateBadGuy3
                      ,updateBadGuy3a: updateBadGuy3a
                      ,updateBadGuy4Msg: updateBadGuy4Msg
                      ,updateBadGuy4: updateBadGuy4
                      ,updateBadGuy5Msg: updateBadGuy5Msg
                      ,updateBadGuy5: updateBadGuy5
                      ,updateBadGuy6Msg: updateBadGuy6Msg
                      ,updateBadGuy6: updateBadGuy6
                      ,updateBadGuy6a: updateBadGuy6a
                      ,updateBadGuy7Msg: updateBadGuy7Msg
                      ,updateBadGuy7: updateBadGuy7
                      ,updateBadGuy7a: updateBadGuy7a
                      ,updateBadGuy8Msg: updateBadGuy8Msg
                      ,updateBadGuy8: updateBadGuy8
                      ,displayUpdate7: displayUpdate7
                      ,updateContainer7: updateContainer7
                      ,updateBadGuy9Msg: updateBadGuy9Msg
                      ,updateBadGuy9: updateBadGuy9
                      ,updateBadGuy10Msg: updateBadGuy10Msg
                      ,updateBadGuy10: updateBadGuy10
                      ,updateBadGuy11Msg: updateBadGuy11Msg
                      ,updateBadGuy11: updateBadGuy11
                      ,updateBadGuy11a: updateBadGuy11a
                      ,updateBadGuy12Msg: updateBadGuy12Msg
                      ,updateBadGuy12: updateBadGuy12
                      ,updateBadGuy12a: updateBadGuy12a
                      ,updateBadGuy13Msg: updateBadGuy13Msg
                      ,updateBadGuy13: updateBadGuy13
                      ,displayUpdate8: displayUpdate8
                      ,updateContainer8: updateContainer8
                      ,updatePlayer1Msg: updatePlayer1Msg
                      ,updatePlayer1: updatePlayer1
                      ,updatePlayer1a: updatePlayer1a
                      ,updatePlayer2Msg: updatePlayer2Msg
                      ,updatePlayer2: updatePlayer2
                      ,displayUpdate9: displayUpdate9
                      ,updateContainer9: updateContainer9
                      ,updatePlayer3Msg: updatePlayer3Msg
                      ,updatePlayer3: updatePlayer3
                      ,updatePlayer3a: updatePlayer3a
                      ,updatePlayer4Msg: updatePlayer4Msg
                      ,updatePlayer4: updatePlayer4
                      ,updatePlayer5Msg: updatePlayer5Msg
                      ,updatePlayer5: updatePlayer5
                      ,updatePlayer6Msg: updatePlayer6Msg
                      ,updatePlayer6: updatePlayer6
                      ,updatePlayer7Msg: updatePlayer7Msg
                      ,updatePlayer7: updatePlayer7
                      ,displayUpdate10: displayUpdate10
                      ,updateContainer10: updateContainer10
                      ,updatePlayer8Msg: updatePlayer8Msg
                      ,updatePlayer8: updatePlayer8
                      ,updatePlayer9Msg: updatePlayer9Msg
                      ,updatePlayer9: updatePlayer9
                      ,updatePlayer10Msg: updatePlayer10Msg
                      ,updatePlayer10: updatePlayer10
                      ,updatePlayer10a: updatePlayer10a
                      ,updatePlayer11Msg: updatePlayer11Msg
                      ,updatePlayer11: updatePlayer11
                      ,updatePlayer11a: updatePlayer11a
                      ,updatePlayer12Msg: updatePlayer12Msg
                      ,updatePlayer12: updatePlayer12
                      ,updatePlayer13Msg: updatePlayer13Msg
                      ,updatePlayer13: updatePlayer13
                      ,displayUpdate11: displayUpdate11
                      ,updateContainer11: updateContainer11
                      ,updatePhysics1Msg: updatePhysics1Msg
                      ,updatePhysics1: updatePhysics1
                      ,updatePhysics2Msg: updatePhysics2Msg
                      ,updatePhysics2: updatePhysics2
                      ,updatePhysics3Msg: updatePhysics3Msg
                      ,updatePhysics3: updatePhysics3
                      ,updatePhysics4Msg: updatePhysics4Msg
                      ,updatePhysics4: updatePhysics4
                      ,updatePhysics5Msg: updatePhysics5Msg
                      ,updatePhysics5: updatePhysics5
                      ,displayUpdate12: displayUpdate12
                      ,updateContainer12: updateContainer12
                      ,updateNear1Msg: updateNear1Msg
                      ,updateNear1: updateNear1
                      ,updateNear2Msg: updateNear2Msg
                      ,updateNear2: updateNear2
                      ,displayUpdate13: displayUpdate13
                      ,updateContainer13: updateContainer13
                      ,updateWithin1Msg: updateWithin1Msg
                      ,updateWithin1: updateWithin1
                      ,updateWithin2Msg: updateWithin2Msg
                      ,updateWithin2: updateWithin2
                      ,updateWithin2a: updateWithin2a
                      ,displayUpdate14: displayUpdate14
                      ,updateContainer14: updateContainer14
                      ,updateStepV1Msg: updateStepV1Msg
                      ,updateStepV1: updateStepV1
                      ,updateStepV2Msg: updateStepV2Msg
                      ,updateStepV2: updateStepV2
                      ,updateStepV3Msg: updateStepV3Msg
                      ,updateStepV3: updateStepV3
                      ,updateStepV4Msg: updateStepV4Msg
                      ,updateStepV4: updateStepV4
                      ,viewWelcome: viewWelcome
                      ,wayfindingView: wayfindingView
                      ,viewWelcomeMsg1: viewWelcomeMsg1
                      ,viewWelcomeMsg2: viewWelcomeMsg2
                      ,displayView1: displayView1
                      ,viewContainer1: viewContainer1
                      ,viewFunc1Msg: viewFunc1Msg
                      ,viewFunc1: viewFunc1
                      ,viewFunc2Msg: viewFunc2Msg
                      ,viewFunc2: viewFunc2
                      ,displayView2: displayView2
                      ,viewContainer2: viewContainer2
                      ,viewFunc3Msg: viewFunc3Msg
                      ,viewFunc3: viewFunc3
                      ,viewFunc4Msg: viewFunc4Msg
                      ,viewFunc4: viewFunc4
                      ,displayView3: displayView3
                      ,viewContainer3: viewContainer3
                      ,viewFunc5Msg: viewFunc5Msg
                      ,viewFunc5: viewFunc5
                      ,viewFunc6Msg: viewFunc6Msg
                      ,viewFunc6: viewFunc6
                      ,viewFunc7Msg: viewFunc7Msg
                      ,viewFunc7: viewFunc7
                      ,displayView4: displayView4
                      ,viewContainer4: viewContainer4
                      ,viewFunc8Msg: viewFunc8Msg
                      ,viewFunc8: viewFunc8
                      ,viewFunc9Msg: viewFunc9Msg
                      ,viewFunc9: viewFunc9
                      ,displayView5: displayView5
                      ,viewContainer5: viewContainer5
                      ,viewFunc10Msg: viewFunc10Msg
                      ,viewFunc10: viewFunc10
                      ,viewFunc11Msg: viewFunc11Msg
                      ,viewFunc11: viewFunc11
                      ,viewFunc12Msg: viewFunc12Msg
                      ,viewFunc12: viewFunc12
                      ,displayView6: displayView6
                      ,viewContainer6: viewContainer6
                      ,viewFunc13Msg: viewFunc13Msg
                      ,viewFunc13: viewFunc13
                      ,viewFunc14Msg: viewFunc14Msg
                      ,viewFunc14: viewFunc14
                      ,viewFunc15Msg: viewFunc15Msg
                      ,viewFunc15: viewFunc15
                      ,displayView7: displayView7
                      ,viewContainer7: viewContainer7
                      ,viewFunc16Msg: viewFunc16Msg
                      ,viewFunc16: viewFunc16
                      ,viewFunc17Msg: viewFunc17Msg
                      ,viewFunc17: viewFunc17
                      ,displayView8: displayView8
                      ,viewContainer8: viewContainer8
                      ,viewFunc18Msg: viewFunc18Msg
                      ,viewFunc18: viewFunc18
                      ,viewFunc18a: viewFunc18a
                      ,viewFunc19Msg: viewFunc19Msg
                      ,viewFunc19: viewFunc19
                      ,viewFunc20Msg: viewFunc20Msg
                      ,viewFunc20: viewFunc20
                      ,displayView9: displayView9
                      ,viewContainer9: viewContainer9
                      ,elmGreyColorMsg: elmGreyColorMsg
                      ,elmGreyColor: elmGreyColor
                      ,elmBlueColorMsg: elmBlueColorMsg
                      ,elmBlueColor: elmBlueColor
                      ,elmGreenColorMsg: elmGreenColorMsg
                      ,elmGreenColor: elmGreenColor
                      ,textColorMsg: textColorMsg
                      ,textColor: textColor
                      ,displayView10: displayView10
                      ,viewContainer10: viewContainer10
                      ,txtFunc1Msg: txtFunc1Msg
                      ,txtFunc1: txtFunc1
                      ,txtFunc2Msg: txtFunc2Msg
                      ,txtFunc2: txtFunc2
                      ,displayView11: displayView11
                      ,viewContainer11: viewContainer11
                      ,msgFuncMsg: msgFuncMsg
                      ,msgFunc1: msgFunc1
                      ,msgFunc2: msgFunc2
                      ,congrats: congrats
                      ,wayfindingCongrats: wayfindingCongrats
                      ,viewCongratsMsg1: viewCongratsMsg1
                      ,viewCongratsMsg2: viewCongratsMsg2
                      ,idea1: idea1
                      ,viewIdea1Msg1: viewIdea1Msg1
                      ,viewIdea1Msg2: viewIdea1Msg2
                      ,idea2: idea2
                      ,viewIdea2Msg1: viewIdea2Msg1
                      ,viewIdea2Msg2: viewIdea2Msg2
                      ,idea3: idea3
                      ,viewIdea3Msg1: viewIdea3Msg1
                      ,viewIdea3Msg2: viewIdea3Msg2
                      ,elmResources: elmResources
                      ,packageLink: packageLink
                      ,exampleLink: exampleLink
                      ,syntaxLink: syntaxLink
                      ,mailingLink: mailingLink
                      ,twitterLink: twitterLink
                      ,ircLink: ircLink
                      ,videoLink1: videoLink1
                      ,videoLink2: videoLink2
                      ,videoLink3: videoLink3
                      ,resourcesTitle: resourcesTitle
                      ,resourcesMsg: resourcesMsg};
   return _elm.Main.values;
};
Elm.Maybe = Elm.Maybe || {};
Elm.Maybe.make = function (_elm) {
   "use strict";
   _elm.Maybe = _elm.Maybe || {};
   if (_elm.Maybe.values)
   return _elm.Maybe.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Maybe";
   var withDefault = F2(function ($default,
   maybe) {
      return function () {
         switch (maybe.ctor)
         {case "Just": return maybe._0;
            case "Nothing":
            return $default;}
         _U.badCase($moduleName,
         "between lines 45 and 56");
      }();
   });
   var Nothing = {ctor: "Nothing"};
   var oneOf = function (maybes) {
      return function () {
         switch (maybes.ctor)
         {case "::": return function () {
                 switch (maybes._0.ctor)
                 {case "Just": return maybes._0;
                    case "Nothing":
                    return oneOf(maybes._1);}
                 _U.badCase($moduleName,
                 "between lines 64 and 73");
              }();
            case "[]": return Nothing;}
         _U.badCase($moduleName,
         "between lines 59 and 73");
      }();
   };
   var andThen = F2(function (maybeValue,
   callback) {
      return function () {
         switch (maybeValue.ctor)
         {case "Just":
            return callback(maybeValue._0);
            case "Nothing": return Nothing;}
         _U.badCase($moduleName,
         "between lines 110 and 112");
      }();
   });
   var Just = function (a) {
      return {ctor: "Just",_0: a};
   };
   var map = F2(function (f,
   maybe) {
      return function () {
         switch (maybe.ctor)
         {case "Just":
            return Just(f(maybe._0));
            case "Nothing": return Nothing;}
         _U.badCase($moduleName,
         "between lines 76 and 107");
      }();
   });
   _elm.Maybe.values = {_op: _op
                       ,andThen: andThen
                       ,map: map
                       ,withDefault: withDefault
                       ,oneOf: oneOf
                       ,Just: Just
                       ,Nothing: Nothing};
   return _elm.Maybe.values;
};
Elm.Mouse = Elm.Mouse || {};
Elm.Mouse.make = function (_elm) {
   "use strict";
   _elm.Mouse = _elm.Mouse || {};
   if (_elm.Mouse.values)
   return _elm.Mouse.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Mouse",
   $Native$Mouse = Elm.Native.Mouse.make(_elm),
   $Signal = Elm.Signal.make(_elm);
   var clicks = $Native$Mouse.clicks;
   var isDown = $Native$Mouse.isDown;
   var y = $Native$Mouse.y;
   var x = $Native$Mouse.x;
   var position = $Native$Mouse.position;
   _elm.Mouse.values = {_op: _op
                       ,position: position
                       ,x: x
                       ,y: y
                       ,isDown: isDown
                       ,clicks: clicks};
   return _elm.Mouse.values;
};
Elm.Native.Array = {};
Elm.Native.Array.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.Array = elm.Native.Array || {};
    if (elm.Native.Array.values) return elm.Native.Array.values;
    if ('values' in Elm.Native.Array)
      return elm.Native.Array.values = Elm.Native.Array.values;

    var List = Elm.Native.List.make(elm);

    // A RRB-Tree has two distinct data types.
    // Leaf -> "height"  is always 0
    //         "table"   is an array of elements
    // Node -> "height"  is always greater than 0
    //         "table"   is an array of child nodes
    //         "lengths" is an array of accumulated lengths of the child nodes

    // M is the maximal table size. 32 seems fast. E is the allowed increase
    // of search steps when concatting to find an index. Lower values will 
    // decrease balancing, but will increase search steps.
    var M = 32;
    var E = 2;

    // An empty array.
    var empty = { ctor:"_Array", height:0, table:new Array() };

    function get(i, array) {
        if (i < 0 || i >= length(array)) {
            throw new Error("Index " + i + " is out of range. Check the length of " +
                            "your array first or use getMaybe or getWithDefault.");
        }
        return unsafeGet(i, array);
    }

    function unsafeGet(i, array) {
      for (var x = array.height; x > 0; x--) {
        var slot = i >> (x * 5);
        while (array.lengths[slot] <= i) {
          slot++;
        }
        if (slot > 0) {
          i -= array.lengths[slot - 1];
        }
        array = array.table[slot];
      }
      return array.table[i];
    }

    // Sets the value at the index i. Only the nodes leading to i will get
    // copied and updated.
    function set(i, item, array) {
      if (i < 0 || length(array) <= i) {
        return array;
      }
      return unsafeSet(i, item, array);
    }

    function unsafeSet(i, item, array) {
      array = nodeCopy(array);

      if (array.height == 0) {
        array.table[i] = item;
      } else {
        var slot = getSlot(i, array);
        if (slot > 0) {
          i -= array.lengths[slot - 1];
        }
        array.table[slot] = unsafeSet(i, item, array.table[slot]);
      }
      return array;
    }

    function initialize(len, f) {
      if (len == 0) { return empty; }
      var h = Math.floor(Math.log(len)/Math.log(M));
      return initialize_(f, h, 0, len);
    }

    function initialize_(f, h, from, to) {
      if (h == 0) {
        var table = new Array((to - from) % (M + 1));
        for (var i = 0; i < table.length; i++) {
          table[i] = f(from + i);
        }
        return { ctor:"_Array", height:0, table:table };
      }

      var step = Math.pow(M, h);
      var table = new Array(Math.ceil((to - from) / step));
      var lengths = new Array(table.length);
      for (var i = 0; i < table.length; i++) {
        table[i] = initialize_( f, h - 1, from + (i * step)
                              , Math.min(from + ((i + 1) * step), to));
        lengths[i] = length(table[i]) + (i > 0 ? lengths[i-1] : 0);
      }
      return { ctor:"_Array", height:h, table:table, lengths:lengths };
    }

    function fromList(list) {
      if (list == List.Nil) { return empty; }

      // Allocate M sized blocks (table) and write list elements to it.
      var table = new Array(M);
      var nodes = new Array();
      var i = 0;

      while (list.ctor !== '[]') {
        table[i] = list._0;
        list = list._1;
        i++;

        // table is full, so we can push a leaf containing it into the
        // next node.
        if (i == M) {
          fromListPush({ ctor:"_Array", height:0, table:table }
                      , nodes);
          table = new Array(M);
          i = 0;
        }
      }

      // Maybe there is something left on the table.
      if (i > 0) {
        fromListPush({ ctor:"_Array", height:0, table:table.splice(0,i) }
                    , nodes);
      }

      // Go through all of the nodes and eventually push them into higher nodes.
      for (var h = 0; h < nodes.length - 1; h++) {
        if (nodes[h].table.length > 0) {
          fromListPush(nodes[h], nodes);
        }
      }

      var head = nodes[nodes.length - 1];
      if (head.height > 0 && head.table.length == 1) {
        return head.table[0];
      } else {
        return head;
      }
    }

    // Push a node into a higher node as a child.
    function fromListPush(toPush, nodes) {
      var h = toPush.height;

      // Maybe the node on this height does not exist.
      if (nodes.length == h) {
        nodes.push({ ctor:"_Array", height:h + 1
                                  , table:new Array()
                                  , lengths:new Array() });
      }

      nodes[h].table.push(toPush);
      var len = length(toPush);
      if (nodes[h].lengths.length > 0) {
        len += nodes[h].lengths[nodes[h].lengths.length - 1];
      }
      nodes[h].lengths.push(len);

      if (nodes[h].table.length == M) {
        fromListPush(nodes[h], nodes);
        nodes[h] = { ctor:"_Array", height:h + 1
                                  , table:new Array()
                                  , lengths:new Array() };
      }
    }

    // Pushes an item via push_ to the bottom right of a tree.
    function push(item, a) {
      var pushed = push_(item, a);
      if (pushed !== null) {
        return pushed;
      }

      var newTree = create(item, a.height);
      return siblise(a, newTree);
    }

    // Recursively tries to push an item to the bottom-right most
    // tree possible. If there is no space left for the item,
    // null will be returned.
    function push_(item, a) {
      // Handle resursion stop at leaf level.
      if (a.height == 0) {
        if (a.table.length < M) {
          var newA = { ctor:"_Array", height:0, table:a.table.slice() };
          newA.table.push(item);
          return newA;
        } else {
          return null;
        }
      }

      // Recursively push
      var pushed = push_(item, botRight(a));

      // There was space in the bottom right tree, so the slot will
      // be updated.
      if (pushed != null) {
        var newA = nodeCopy(a);
        newA.table[newA.table.length - 1] = pushed;
        newA.lengths[newA.lengths.length - 1]++;
        return newA
      }

      // When there was no space left, check if there is space left
      // for a new slot with a tree which contains only the item
      // at the bottom.
      if (a.table.length < M) {
        var newSlot = create(item, a.height - 1);
        var newA = nodeCopy(a);
        newA.table.push(newSlot);
        newA.lengths.push(newA.lengths[newA.lengths.length - 1] + length(newSlot));
        return newA
      } else {
        return null;
      }
    }

    // Converts an array into a list of elements.
    function toList(a) {
      return toList_(List.Nil, a);
    }

    function toList_(list, a) {
      for (var i = a.table.length - 1; i >= 0; i--) {
        list = a.height == 0 ? List.Cons(a.table[i], list) : toList_(list, a.table[i]);
      }
      return list;
    }

    // Maps a function over the elements of an array.
    function map(f, a) {
      var newA = { ctor:"_Array", height:a.height, table:new Array(a.table) };
      if (a.height > 0) { newA.lengths = a.lengths; }
      for (var i = 0; i < a.table.length; i++) {
        newA.table[i] = a.height == 0 ? f(a.table[i]) : map(f, a.table[i]);
      }
      return newA;
    }

    // Maps a function over the elements with their index as first argument.
    function indexedMap(f, a) {
      return indexedMap_(f, a, 0);
    }

    function indexedMap_(f, a, from) {
      var newA = { ctor:"_Array", height:a.height, table:new Array(a.table) };
      if (a.height > 0) { newA.lengths = a.lengths; }
      for (var i = 0; i < a.table.length; i++) {
        newA.table[i] = a.height == 0 ? A2(f, from + i, a.table[i])
                                      : indexedMap_( f, a.table[i]
                                                   , i == 0 ? 0 : a.lengths[i - 1]);
      }
      return newA;
    }

    function foldl(f, b, a) {
      if (a.height == 0) {
        for (var i = 0; i < a.table.length; i++) {
          b = A2(f, a.table[i], b);
        }
      } else {
        for (var i = 0; i < a.table.length; i++) {
          b = foldl(f, b, a.table[i]);
        }
      }
      return b;
    }

    function foldr(f, b, a) {
      if (a.height == 0) {
        for (var i = a.table.length; i--; ) {
          b = A2(f, a.table[i], b);
        }
      } else {
        for (var i = a.table.length; i--; ) {
          b = foldr(f, b, a.table[i]);
        }
      }
      return b;
    }

    // TODO: currently, it slices the right, then the left. This can be
    // optimized.
    function slice(from, to, a) {
      if (from < 0) { from += length(a); }
      if (to < 0)   { to += length(a); }
      return sliceLeft(from, sliceRight(to, a));
    }

    function sliceRight(to, a) {
      if (to == length(a)) {
        return a;
      }

      // Handle leaf level.
      if (a.height == 0) {
        var newA = { ctor:"_Array", height:0 };
        newA.table = a.table.slice(0, to);
        return newA;
      }

      // Slice the right recursively.
      var right = getSlot(to, a);
      var sliced = sliceRight(to - (right > 0 ? a.lengths[right - 1] : 0), a.table[right]);

      // Maybe the a node is not even needed, as sliced contains the whole slice.
      if (right == 0) {
        return sliced;
      }

      // Create new node.
      var newA = { ctor:"_Array", height:a.height
                                , table:a.table.slice(0, right)
                                , lengths:a.lengths.slice(0, right) };
      if (sliced.table.length > 0) {
        newA.table[right] = sliced;
        newA.lengths[right] = length(sliced) + (right > 0 ? newA.lengths[right - 1] : 0);
      }
      return newA;
    }

    function sliceLeft(from, a) {
      if (from == 0) {
        return a;
      }

      // Handle leaf level.
      if (a.height == 0) {
        var newA = { ctor:"_Array", height:0 };
        newA.table = a.table.slice(from, a.table.length + 1);
        return newA;
      }

      // Slice the left recursively.
      var left = getSlot(from, a);
      var sliced = sliceLeft(from - (left > 0 ? a.lengths[left - 1] : 0), a.table[left]);

      // Maybe the a node is not even needed, as sliced contains the whole slice.
      if (left == a.table.length - 1) {
        return sliced;
      }

      // Create new node.
      var newA = { ctor:"_Array", height:a.height
                                , table:a.table.slice(left, a.table.length + 1)
                                , lengths:new Array(a.table.length - left) };
      newA.table[0] = sliced;
      var len = 0;
      for (var i = 0; i < newA.table.length; i++) {
        len += length(newA.table[i]);
        newA.lengths[i] = len;
      }

      return newA;
    }

    // Appends two trees.
    function append(a,b) {
      if (a.table.length === 0) {
        return b;
      }
      if (b.table.length === 0) {
        return a;
      }

      var c = append_(a, b);

      // Check if both nodes can be crunshed together.
      if (c[0].table.length + c[1].table.length <= M) {
        if (c[0].table.length === 0) {
          return c[1];
        }
        if (c[1].table.length === 0) {
          return c[0];
        }

        // Adjust .table and .lengths
        c[0].table = c[0].table.concat(c[1].table);
        if (c[0].height > 0) {
          var len = length(c[0]);
          for (var i = 0; i < c[1].lengths.length; i++) {
            c[1].lengths[i] += len;
          }
          c[0].lengths = c[0].lengths.concat(c[1].lengths);
        }

        return c[0];
      }

      if (c[0].height > 0) {
        var toRemove = calcToRemove(a, b);
        if (toRemove > E) {
          c = shuffle(c[0], c[1], toRemove);
        }
      }

      return siblise(c[0], c[1]);
    }

    // Returns an array of two nodes; right and left. One node _may_ be empty.
    function append_(a, b) {
      if (a.height === 0 && b.height === 0) {
        return [a, b];
      }

      if (a.height !== 1 || b.height !== 1) {
        if (a.height === b.height) {
          a = nodeCopy(a);
          b = nodeCopy(b);
          var appended = append_(botRight(a), botLeft(b));

          insertRight(a, appended[1]);
          insertLeft(b, appended[0]);
        } else if (a.height > b.height) {
          a = nodeCopy(a);
          var appended = append_(botRight(a), b);

          insertRight(a, appended[0]);
          b = parentise(appended[1], appended[1].height + 1);
        } else {
          b = nodeCopy(b);
          var appended = append_(a, botLeft(b));

          var left = appended[0].table.length === 0 ? 0 : 1;
          var right = left === 0 ? 1 : 0;
          insertLeft(b, appended[left]);
          a = parentise(appended[right], appended[right].height + 1);
        }
      }

      // Check if balancing is needed and return based on that.
      if (a.table.length === 0 || b.table.length === 0) {
        return [a,b];
      }

      var toRemove = calcToRemove(a, b);
      if (toRemove <= E) {
        return [a,b];
      }
      return shuffle(a, b, toRemove);
    }

    // Helperfunctions for append_. Replaces a child node at the side of the parent.
    function insertRight(parent, node) {
      var index = parent.table.length - 1;
      parent.table[index] = node;
      parent.lengths[index] = length(node)
      parent.lengths[index] += index > 0 ? parent.lengths[index - 1] : 0;
    }

    function insertLeft(parent, node) {
      if (node.table.length > 0) {
        parent.table[0] = node;
        parent.lengths[0] = length(node);

        var len = length(parent.table[0]);
        for (var i = 1; i < parent.lengths.length; i++) {
          len += length(parent.table[i]);
          parent.lengths[i] = len;
        }
      } else {
        parent.table.shift();
        for (var i = 1; i < parent.lengths.length; i++) {
          parent.lengths[i] = parent.lengths[i] - parent.lengths[0];
        }
        parent.lengths.shift();
      }
    }

    // Returns the extra search steps for E. Refer to the paper.
    function calcToRemove(a, b) {
      var subLengths = 0;
      for (var i = 0; i < a.table.length; i++) {
        subLengths += a.table[i].table.length;
      }
      for (var i = 0; i < b.table.length; i++) {
        subLengths += b.table[i].table.length;
      }

      var toRemove = a.table.length + b.table.length
      return toRemove - (Math.floor((subLengths - 1) / M) + 1);
    }

    // get2, set2 and saveSlot are helpers for accessing elements over two arrays.
    function get2(a, b, index) {
      return index < a.length ? a[index] : b[index - a.length];
    }

    function set2(a, b, index, value) {
      if (index < a.length) {
        a[index] = value;
      } else {
        b[index - a.length] = value;
      }
    }

    function saveSlot(a, b, index, slot) {
      set2(a.table, b.table, index, slot);

      var l = (index == 0 || index == a.lengths.length) ?
                0 : get2(a.lengths, a.lengths, index - 1);
      set2(a.lengths, b.lengths, index, l + length(slot));
    }

    // Creates a node or leaf with a given length at their arrays for perfomance.
    // Is only used by shuffle.
    function createNode(h, length) {
      if (length < 0) { length = 0; }
      var a = { ctor:"_Array", height:h, table:new Array(length) };
      if (h > 0) {
        a.lengths = new Array(length);
      }
      return a;
    }

    // Returns an array of two balanced nodes.
    function shuffle(a, b, toRemove) {
      var newA = createNode(a.height, Math.min(M, a.table.length + b.table.length - toRemove));
      var newB = createNode(a.height, newA.table.length - (a.table.length + b.table.length - toRemove));

      // Skip the slots with size M. More precise: copy the slot references
      // to the new node
      var read = 0;
      while (get2(a.table, b.table, read).table.length % M == 0) {
        set2(newA.table, newB.table, read, get2(a.table, b.table, read));
        set2(newA.lengths, newB.lengths, read, get2(a.lengths, b.lengths, read));
        read++;
      }

      // Pulling items from left to right, caching in a slot before writing
      // it into the new nodes.
      var write = read;
      var slot = new createNode(a.height - 1, 0);
      var from = 0;

      // If the current slot is still containing data, then there will be at
      // least one more write, so we do not break this loop yet.
      while (read - write - (slot.table.length > 0 ? 1 : 0) < toRemove) {
        // Find out the max possible items for copying.
        var source = get2(a.table, b.table, read);
        var to = Math.min(M - slot.table.length, source.table.length)

        // Copy and adjust size table.
        slot.table = slot.table.concat(source.table.slice(from, to));
        if (slot.height > 0) {
          var len = slot.lengths.length;
          for (var i = len; i < len + to - from; i++) {
            slot.lengths[i] = length(slot.table[i]);
            slot.lengths[i] += (i > 0 ? slot.lengths[i - 1] : 0);
          }
        }

        from += to;

        // Only proceed to next slots[i] if the current one was
        // fully copied.
        if (source.table.length <= to) {
          read++; from = 0;
        }

        // Only create a new slot if the current one is filled up.
        if (slot.table.length == M) {
          saveSlot(newA, newB, write, slot);
          slot = createNode(a.height - 1,0);
          write++;
        }
      }

      // Cleanup after the loop. Copy the last slot into the new nodes.
      if (slot.table.length > 0) {
        saveSlot(newA, newB, write, slot);
        write++;
      }

      // Shift the untouched slots to the left
      while (read < a.table.length + b.table.length ) {
        saveSlot(newA, newB, write, get2(a.table, b.table, read));
        read++; write++;
      }

      return [newA, newB];
    }

    // Navigation functions
    function botRight(a) { return a.table[a.table.length - 1]; }
    function botLeft(a)  { return a.table[0]; }

    // Copies a node for updating. Note that you should not use this if
    // only updating only one of "table" or "lengths" for performance reasons.
    function nodeCopy(a) {
      var newA = { ctor:"_Array", height:a.height
                                , table:a.table.slice() };
      if (a.height > 0) { newA.lengths = a.lengths.slice(); }
      return newA;
    }

    // Returns how many items are in the tree.
    function length(array) {
      if (array.height == 0) {
        return array.table.length;
      } else {
        return array.lengths[array.lengths.length - 1];
      }
    }

    // Calculates in which slot of "table" the item probably is, then
    // find the exact slot via forward searching in  "lengths". Returns the index.
    function getSlot(i, a) {
      var slot = i >> (5 * a.height);
      while (a.lengths[slot] <= i) {
        slot++;
      }
      return slot;
    }

    // Recursively creates a tree with a given height containing
    // only the given item.
    function create(item, h) {
      if (h == 0) {
        return { ctor:"_Array", height:0
                              , table:[item] };
      } else {
        return { ctor:"_Array", height:h
                              , table:[create(item, h - 1)]
                              , lengths:[1] };
      }
    }

    // Recursively creates a tree that contains the given tree.
    function parentise(tree, h) {
      if (h == tree.height) {
        return tree;
      } else {
        return { ctor:"_Array", height:h
                              , table:[parentise(tree, h - 1)]
                              , lengths:[length(tree)] };
      }
    }

    // Emphasizes blood brotherhood beneath two trees.
    function siblise(a, b) {
      return { ctor:"_Array", height:a.height + 1
                            , table:[a, b]
                            , lengths:[length(a), length(a) + length(b)] };
    }

    function toJSArray(a) {
      var jsArray = new Array(length(a));
      toJSArray_(jsArray, 0, a);
      return jsArray;
    }

    function toJSArray_(jsArray, i, a) {
      for (var t = 0; t < a.table.length; t++) {
        if (a.height == 0) {
          jsArray[i + t] = a.table[t];
        } else {
          var inc = t == 0 ? 0 : a.lengths[t - 1];
          toJSArray_(jsArray, i + inc, a.table[t]);
        }
      }
    }

    function fromJSArray(jsArray) {
      if (jsArray.length == 0) { return empty; }
      var h = Math.floor(Math.log(jsArray.length) / Math.log(M));
      return fromJSArray_(jsArray, h, 0, jsArray.length);
    }

    function fromJSArray_(jsArray, h, from, to) {
      if (h == 0) {
        return { ctor:"_Array", height:0
                              , table:jsArray.slice(from, to) };
      }

      var step = Math.pow(M, h);
      var table = new Array(Math.ceil((to - from) / step));
      var lengths = new Array(table.length);
      for (var i = 0; i < table.length; i++) {
        table[i] = fromJSArray_( jsArray, h - 1, from + (i * step)
                               , Math.min(from + ((i + 1) * step), to));
        lengths[i] = length(table[i]) + (i > 0 ? lengths[i-1] : 0);
      }
      return { ctor:"_Array", height:h, table:table, lengths:lengths };
    }

    Elm.Native.Array.values = {
      empty:empty,
      fromList:fromList,
      toList:toList,
      initialize:F2(initialize),
      append:F2(append),
      push:F2(push),
      slice:F3(slice),
      get:F2(get),
      set:F3(set),
      map:F2(map),
      indexedMap:F2(indexedMap),
      foldl:F3(foldl),
      foldr:F3(foldr),
      length:length,

      toJSArray:toJSArray,
      fromJSArray:fromJSArray
    };

    return elm.Native.Array.values = Elm.Native.Array.values;
}


Elm.Native.Basics = {};
Elm.Native.Basics.make = function(elm) {
  elm.Native = elm.Native || {};
  elm.Native.Basics = elm.Native.Basics || {};
  if (elm.Native.Basics.values) return elm.Native.Basics.values;

  var Utils = Elm.Native.Utils.make(elm);

  function div(a, b) {
      return (a/b)|0;
  }
  function rem(a, b) {
      return a % b;
  }
  function mod(a, b) {
        if (b === 0) {
            throw new Error("Cannot perform mod 0. Division by zero error.");
        }
        var r = a % b;
        var m = a === 0 ? 0 : (b > 0 ? (a >= 0 ? r : r+b) : -mod(-a,-b));

        return m === b ? 0 : m;
  }
  function logBase(base, n) {
      return Math.log(n) / Math.log(base);
  }
  function negate(n) {
      return -n;
  }
  function abs(n) {
      return n < 0 ? -n : n;
  }

  function min(a, b) {
      return Utils.cmp(a,b) < 0 ? a : b;
  }
  function max(a, b) {
      return Utils.cmp(a,b) > 0 ? a : b;
  }
  function clamp(lo, hi, n) {
      return Utils.cmp(n,lo) < 0 ? lo : Utils.cmp(n,hi) > 0 ? hi : n;
  }

  function xor(a, b) {
      return a !== b;
  }
  function not(b) {
      return !b;
  }
  function isInfinite(n) {
      return n === Infinity || n === -Infinity
  }

  function truncate(n) {
      return n|0;
  }

  function degrees(d) {
      return d * Math.PI / 180;
  }
  function turns(t) {
      return 2 * Math.PI * t;
  }
  function fromPolar(point) {
      var r = point._0;
      var t = point._1;
      return Utils.Tuple2(r * Math.cos(t), r * Math.sin(t));
  }
  function toPolar(point) {
      var x = point._0;
      var y = point._1;
      return Utils.Tuple2(Math.sqrt(x * x + y * y), Math.atan2(y,x));
  }

  var basics = {
      div: F2(div),
      rem: F2(rem),
      mod: F2(mod),

      pi: Math.PI,
      e: Math.E,
      cos: Math.cos,
      sin: Math.sin,
      tan: Math.tan,
      acos: Math.acos,
      asin: Math.asin,
      atan: Math.atan,
      atan2: F2(Math.atan2),

      degrees:  degrees,
      turns:  turns,
      fromPolar:  fromPolar,
      toPolar:  toPolar,

      sqrt: Math.sqrt,
      logBase: F2(logBase),
      negate: negate,
      abs: abs,
      min: F2(min),
      max: F2(max),
      clamp: F3(clamp),
      compare: Utils.compare,

      xor: F2(xor),
      not: not,

      truncate: truncate,
      ceiling: Math.ceil,
      floor: Math.floor,
      round: Math.round,
      toFloat: function(x) { return x; },
      isNaN: isNaN,
      isInfinite: isInfinite
  };

  return elm.Native.Basics.values = basics;
};

Elm.Native.Char = {};
Elm.Native.Char.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.Char = elm.Native.Char || {};
    if (elm.Native.Char.values) return elm.Native.Char.values;

    var Utils = Elm.Native.Utils.make(elm);

    function isBetween(lo,hi) { return function(chr) {
	var c = chr.charCodeAt(0);
	return lo <= c && c <= hi;
    };
                              }
    var isDigit = isBetween('0'.charCodeAt(0),'9'.charCodeAt(0));
    var chk1 = isBetween('a'.charCodeAt(0),'f'.charCodeAt(0));
    var chk2 = isBetween('A'.charCodeAt(0),'F'.charCodeAt(0));

    return elm.Native.Char.values = {
        fromCode : function(c) { return String.fromCharCode(c); },
        toCode   : function(c) { return c.charCodeAt(0); },
        toUpper  : function(c) { return Utils.chr(c.toUpperCase()); },
        toLower  : function(c) { return Utils.chr(c.toLowerCase()); },
        toLocaleUpper : function(c) { return Utils.chr(c.toLocaleUpperCase()); },
        toLocaleLower : function(c) { return Utils.chr(c.toLocaleLowerCase()); },
        isLower    : isBetween('a'.charCodeAt(0),'z'.charCodeAt(0)),
        isUpper    : isBetween('A'.charCodeAt(0),'Z'.charCodeAt(0)),
        isDigit    : isDigit,
        isOctDigit : isBetween('0'.charCodeAt(0),'7'.charCodeAt(0)),
        isHexDigit : function(c) { return isDigit(c) || chk1(c) || chk2(c); }
    };
};

Elm.Native.Color = {};
Elm.Native.Color.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.Color = elm.Native.Color || {};
    if (elm.Native.Color.values) return elm.Native.Color.values;

    function toCss(c) {
        var format = '';
        var colors = '';
        if (c.ctor === 'RGBA') {
            format = 'rgb';
            colors = c._0 + ', ' + c._1 + ', ' + c._2;
        } else {
            format = 'hsl';
            colors = (c._0 * 180 / Math.PI) + ', ' +
                     (c._1 * 100) + '%, ' +
                     (c._2 * 100) + '%';
        }
        if (c._3 === 1) {
            return format + '(' + colors + ')';
        } else {
            return format + 'a(' + colors + ', ' + c._3 + ')';
        }
    }

    return elm.Native.Color.values = {
        toCss:toCss
    };

};

Elm.Native.Debug = {};
Elm.Native.Debug.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.Debug = elm.Native.Debug || {};
    if (elm.Native.Debug.values)
    {
        return elm.Native.Debug.values;
    }

    var toString = Elm.Native.Show.make(elm).toString;

    function log(tag, value)
    {
        var msg = tag + ': ' + toString(value);
        var process = process || {};
        if (process.stdout) {
            process.stdout.write(msg);
        } else {
            console.log(msg);
        }
        return value;
    }

    function crash(message)
    {
        throw new Error(message);
    }

    function tracePath(tag, form)
    {
        if (elm.debug)
        {
            return elm.debug.trace(tag, form);
        }
        return form;
    }

    function watch(tag, value)
    {
        if (elm.debug)
        {
            elm.debug.watch(tag, value);
        }
        return value;
    }

    function watchSummary(tag, summarize, value)
    {
        if (elm.debug)
        {
            elm.debug.watch(tag, summarize(value));
        }
        return value;
    }

    return elm.Native.Debug.values = {
        crash: crash,
        tracePath: F2(tracePath),
        log: F2(log),
        watch: F2(watch),
        watchSummary:F3(watchSummary),
    };
};


// setup
Elm.Native = Elm.Native || {};
Elm.Native.Graphics = Elm.Native.Graphics || {};
Elm.Native.Graphics.Collage = Elm.Native.Graphics.Collage || {};

// definition
Elm.Native.Graphics.Collage.make = function(localRuntime) {
    'use strict';

    // attempt to short-circuit
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Graphics = localRuntime.Native.Graphics || {};
    localRuntime.Native.Graphics.Collage = localRuntime.Native.Graphics.Collage || {};
    if ('values' in localRuntime.Native.Graphics.Collage) {
        return localRuntime.Native.Graphics.Collage.values;
    }

    // okay, we cannot short-ciruit, so now we define everything
    var Color = Elm.Native.Color.make(localRuntime);
    var List = Elm.Native.List.make(localRuntime);
    var Transform = Elm.Transform2D.make(localRuntime);

    var Element = Elm.Graphics.Element.make(localRuntime);
    var NativeElement = Elm.Native.Graphics.Element.make(localRuntime);


    function trace(ctx, path) {
        var points = List.toArray(path);
        var i = points.length - 1;
        if (i <= 0) {
            return;
        }
        ctx.moveTo(points[i]._0, points[i]._1);
        while (i--) {
            ctx.lineTo(points[i]._0, points[i]._1);
        }
        if (path.closed) {
            i = points.length - 1;
            ctx.lineTo(points[i]._0, points[i]._1);
        }
    }

    function line(ctx,style,path) {
        (style.dashing.ctor === '[]')
            ? trace(ctx, path)
            : customLineHelp(ctx, style, path);
        ctx.scale(1,-1);
        ctx.stroke();
    }

    function customLineHelp(ctx, style, path) {
        var points = List.toArray(path);
        if (path.closed) {
            points.push(points[0]);
        }
        var pattern = List.toArray(style.dashing);
        var i = points.length - 1;
        if (i <= 0) {
            return;
        }
        var x0 = points[i]._0, y0 = points[i]._1;
        var x1=0, y1=0, dx=0, dy=0, remaining=0, nx=0, ny=0;
        var pindex = 0, plen = pattern.length;
        var draw = true, segmentLength = pattern[0];
        ctx.moveTo(x0,y0);
        while (i--) {
            x1 = points[i]._0; y1 = points[i]._1;
            dx = x1 - x0; dy = y1 - y0;
            remaining = Math.sqrt(dx * dx + dy * dy);
            while (segmentLength <= remaining) {
                x0 += dx * segmentLength / remaining;
                y0 += dy * segmentLength / remaining;
                ctx[draw ? 'lineTo' : 'moveTo'](x0, y0);
                // update starting position
                dx = x1 - x0; dy = y1 - y0;
                remaining = Math.sqrt(dx * dx + dy * dy);
                // update pattern
                draw = !draw;
                pindex = (pindex + 1) % plen;
                segmentLength = pattern[pindex];
            }
            if (remaining > 0) {
                ctx[draw ? 'lineTo' : 'moveTo'](x1, y1);
                segmentLength -= remaining;
            }
            x0 = x1; y0 = y1;
        }
    }

    function drawLine(ctx, style, path) {
        ctx.lineWidth = style.width;

        var cap = style.cap.ctor;
        ctx.lineCap = cap === 'Flat'
            ? 'butt'
            : cap === 'Round'
                ? 'round'
                : 'square';

        var join = style.join.ctor;
        ctx.lineJoin = join === 'Smooth'
            ? 'round'
            : join === 'Sharp'
                ? 'miter'
                : 'bevel';

        ctx.miterLimit = style.join._0 || 10;
        ctx.strokeStyle = Color.toCss(style.color);

        return line(ctx, style, path);
    }

    function texture(redo, ctx, src) {
        var img = new Image();
        img.src = src;
        img.onload = redo;
        return ctx.createPattern(img, 'repeat');
    }

    function gradient(ctx, grad) {
        var g;
        var stops = [];
        if (grad.ctor === 'Linear') {
            var p0 = grad._0, p1 = grad._1;
            g = ctx.createLinearGradient(p0._0, -p0._1, p1._0, -p1._1);
            stops = List.toArray(grad._2);
        } else {
            var p0 = grad._0, p2 = grad._2;
            g = ctx.createRadialGradient(p0._0, -p0._1, grad._1, p2._0, -p2._1, grad._3);
            stops = List.toArray(grad._4);
        }
        var len = stops.length;
        for (var i = 0; i < len; ++i) {
            var stop = stops[i];
            g.addColorStop(stop._0, Color.toCss(stop._1));
        }
        return g;
    }

    function drawShape(redo, ctx, style, path) {
        trace(ctx, path);
        var sty = style.ctor;
        ctx.fillStyle = sty === 'Solid'
            ? Color.toCss(style._0)
            : sty === 'Texture'
                ? texture(redo, ctx, style._0)
                : gradient(ctx, style._0);

        ctx.scale(1,-1);
        ctx.fill();
    }

    function drawImage(redo, ctx, form) {
        var img = new Image();
        img.onload = redo;
        img.src = form._3;
        var w = form._0,
            h = form._1,
            pos = form._2,
            srcX = pos._0,
            srcY = pos._1,
            srcW = w,
            srcH = h,
            destX = -w/2,
            destY = -h/2,
            destW = w,
            destH = h;

        ctx.scale(1,-1);
        ctx.drawImage(img, srcX, srcY, srcW, srcH, destX, destY, destW, destH);
    }

    function renderForm(redo, ctx, form) {
        ctx.save();
        var x = form.x, y = form.y, theta = form.theta, scale = form.scale;
        if (x !== 0 || y !== 0) ctx.translate(x, y);
        if (theta !== 0) ctx.rotate(theta);
        if (scale !== 1) ctx.scale(scale,scale);
        if (form.alpha !== 1) ctx.globalAlpha = ctx.globalAlpha * form.alpha;
        ctx.beginPath();
        var f = form.form;
        switch(f.ctor) {
        case 'FPath' : drawLine(ctx, f._0, f._1); break;
        case 'FImage': drawImage(redo, ctx, f); break;
        case 'FShape':
          if (f._0.ctor === 'Line') {
            f._1.closed = true;
            drawLine(ctx, f._0._0, f._1);
          } else {
            drawShape(redo, ctx, f._0._0, f._1);
          }
        break;
        }
        ctx.restore();
    }

    function formToMatrix(form) {
       var scale = form.scale;
       var matrix = A6( Transform.matrix, scale, 0, 0, scale, form.x, form.y );

       var theta = form.theta
       if (theta !== 0) {
           matrix = A2( Transform.multiply, matrix, Transform.rotation(theta) );
       }

       return matrix;
    }

    function str(n) {
        if (n < 0.00001 && n > -0.00001) return 0;
        return n;
    }

    function makeTransform(w, h, form, matrices) {
        var props = form.form._0.props;
        var m = A6( Transform.matrix, 1, 0, 0, -1,
                    (w - props.width ) / 2,
                    (h - props.height) / 2 );
        var len = matrices.length;
        for (var i = 0; i < len; ++i) {
            m = A2( Transform.multiply, m, matrices[i] );
        }
        m = A2( Transform.multiply, m, formToMatrix(form) );

        return 'matrix(' + str( m[0]) + ', ' + str( m[3]) + ', ' +
                           str(-m[1]) + ', ' + str(-m[4]) + ', ' +
                           str( m[2]) + ', ' + str( m[5]) + ')';
    }

    function stepperHelp(list) {
        var arr = List.toArray(list);
        var i = 0;
        function peekNext() {
            return i < arr.length ? arr[i].form.ctor : '';
        }
        // assumes that there is a next element
        function next() {
            var out = arr[i];
            ++i;
            return out;
        }
        return {
            peekNext:peekNext,
            next:next
        };
    }

    function formStepper(forms) {
        var ps = [stepperHelp(forms)];
        var matrices = [];
        var alphas = [];
        function peekNext() {
            var len = ps.length;
            var formType = '';
            for (var i = 0; i < len; ++i ) {
                if (formType = ps[i].peekNext()) return formType;
            }
            return '';
        }
        // assumes that there is a next element
        function next(ctx) {
            while (!ps[0].peekNext()) {
                ps.shift();
                matrices.pop();
                alphas.shift();
                if (ctx) { ctx.restore(); }
            }
            var out = ps[0].next();
            var f = out.form;
            if (f.ctor === 'FGroup') {
                ps.unshift(stepperHelp(f._1));
                var m = A2(Transform.multiply, f._0, formToMatrix(out));
                ctx.save();
                ctx.transform(m[0], m[3], m[1], m[4], m[2], m[5]);
                matrices.push(m);

                var alpha = (alphas[0] || 1) * out.alpha;
                alphas.unshift(alpha);
                ctx.globalAlpha = alpha;
            }
            return out;
        }
        function transforms() { return matrices; }
        function alpha() { return alphas[0] || 1; }
        return {
            peekNext:peekNext,
            next:next,
            transforms:transforms,
            alpha:alpha
        };
    }

    function makeCanvas(w,h) {
        var canvas = NativeElement.createNode('canvas');
        canvas.style.width  = w + 'px';
        canvas.style.height = h + 'px';
        canvas.style.display = "block";
        canvas.style.position = "absolute";
        canvas.width  = w;
        canvas.height = h;
        return canvas;
    }

    function render(model) {
        var div = NativeElement.createNode('div');
        div.style.overflow = 'hidden';
        div.style.position = 'relative';
        update(div, model, model);
        return div;
    }

    function nodeStepper(w,h,div) {
        var kids = div.childNodes;
        var i = 0;
        function transform(transforms, ctx) {
            ctx.translate(w/2, h/2);
            ctx.scale(1,-1);
            var len = transforms.length;
            for (var i = 0; i < len; ++i) {
                var m = transforms[i];
                ctx.save();
                ctx.transform(m[0], m[3], m[1], m[4], m[2], m[5]);
            }
            return ctx;
        }
        function nextContext(transforms) {
            while (i < kids.length) {
                var node = kids[i];
                if (node.getContext) {
                    node.width = w;
                    node.height = h;
                    node.style.width = w + 'px';
                    node.style.height = h + 'px';
                    ++i;
                    return transform(transforms, node.getContext('2d'));
                }
                div.removeChild(node);
            }
            var canvas = makeCanvas(w,h);
            div.appendChild(canvas);
            // we have added a new node, so we must step our position
            ++i;
            return transform(transforms, canvas.getContext('2d'));
        }
        function addElement(matrices, alpha, form) {
            var kid = kids[i];
            var elem = form.form._0;

            var node = (!kid || kid.getContext)
                ? NativeElement.render(elem)
                : NativeElement.update(kid, kid.oldElement, elem);

            node.style.position = 'absolute';
            node.style.opacity = alpha * form.alpha * elem.props.opacity;
            NativeElement.addTransform(node.style, makeTransform(w, h, form, matrices));
            node.oldElement = elem;
            ++i;
            if (!kid) {
                div.appendChild(node);
            } else {
                div.insertBefore(node, kid);
            }
        }
        function clearRest() {
            while (i < kids.length) {
                div.removeChild(kids[i]);
            }
        }
        return { nextContext:nextContext, addElement:addElement, clearRest:clearRest };
    }


    function update(div, _, model) {
        var w = model.w;
        var h = model.h;

        var forms = formStepper(model.forms);
        var nodes = nodeStepper(w,h,div);
        var ctx = null;
        var formType = '';

        while (formType = forms.peekNext()) {
            // make sure we have context if we need it
            if (ctx === null && formType !== 'FElement') {
                ctx = nodes.nextContext(forms.transforms());
                ctx.globalAlpha = forms.alpha();
            }

            var form = forms.next(ctx);
            // if it is FGroup, all updates are made within formStepper when next is called.
            if (formType === 'FElement') {
                // update or insert an element, get a new context
                nodes.addElement(forms.transforms(), forms.alpha(), form);
                ctx = null;
            } else if (formType !== 'FGroup') {
                renderForm(function() { update(div, model, model); }, ctx, form);
            }
        }
        nodes.clearRest();
        return div;
    }


    function collage(w,h,forms) {
        return A3(Element.newElement, w, h, {
            ctor: 'Custom',
            type: 'Collage',
            render: render,
            update: update,
            model: {w:w, h:h, forms:forms}
      	});
    }

    return localRuntime.Native.Graphics.Collage.values = {
        collage:F3(collage)
    };
};


// setup
Elm.Native = Elm.Native || {};
Elm.Native.Graphics = Elm.Native.Graphics || {};
Elm.Native.Graphics.Element = Elm.Native.Graphics.Element || {};

// definition
Elm.Native.Graphics.Element.make = function(localRuntime) {
    'use strict';

    // attempt to short-circuit
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Graphics = localRuntime.Native.Graphics || {};
    localRuntime.Native.Graphics.Element = localRuntime.Native.Graphics.Element || {};
    if ('values' in localRuntime.Native.Graphics.Element) {
        return localRuntime.Native.Graphics.Element.values;
    }

    var Color = Elm.Native.Color.make(localRuntime);
    var List = Elm.Native.List.make(localRuntime);
    var Utils = Elm.Native.Utils.make(localRuntime);


    function createNode(elementType) {
        var node = document.createElement(elementType);
        node.style.padding = "0";
        node.style.margin = "0";
        return node;
    }

    function setProps(elem, node) {
        var props = elem.props;

        var element = elem.element;
        var width = props.width - (element.adjustWidth || 0);
        var height = props.height - (element.adjustHeight || 0);
        node.style.width  = (width |0) + 'px';
        node.style.height = (height|0) + 'px';

        if (props.opacity !== 1) {
            node.style.opacity = props.opacity;
        }

        if (props.color.ctor === 'Just') {
            node.style.backgroundColor = Color.toCss(props.color._0);
        }

        if (props.tag !== '') {
            node.id = props.tag;
        }

        if (props.hover.ctor !== '_Tuple0') {
            addHover(node, props.hover);
        }

        if (props.click.ctor !== '_Tuple0') {
            addClick(node, props.click);
        }

        if (props.href !== '') {
            var anchor = createNode('a');
            anchor.href = props.href;
            anchor.style.display = 'block';
            anchor.style.pointerEvents = 'auto';
            anchor.appendChild(node);
            node = anchor;
        }

        return node;
    }

    function addClick(e, handler) {
        e.style.pointerEvents = 'auto';
        e.elm_click_handler = handler;
        function trigger(ev) {
            e.elm_click_handler(Utils.Tuple0);
            ev.stopPropagation();
        }
        e.elm_click_trigger = trigger;
        e.addEventListener('click', trigger);
    }

    function removeClick(e, handler) {
        if (e.elm_click_trigger) {
            e.removeEventListener('click', e.elm_click_trigger);
            e.elm_click_trigger = null;
            e.elm_click_handler = null;
        }
    }

    function addHover(e, handler) {
        e.style.pointerEvents = 'auto';
        e.elm_hover_handler = handler;
        e.elm_hover_count = 0;

        function over(evt) {
            if (e.elm_hover_count++ > 0) return;
            e.elm_hover_handler(true);
            evt.stopPropagation();
        }
        function out(evt) {
            if (e.contains(evt.toElement || evt.relatedTarget)) return;
            e.elm_hover_count = 0;
            e.elm_hover_handler(false);
            evt.stopPropagation();
        }
        e.elm_hover_over = over;
        e.elm_hover_out = out;
        e.addEventListener('mouseover', over);
        e.addEventListener('mouseout', out);
    }

    function removeHover(e) {
        e.elm_hover_handler = null;
        if (e.elm_hover_over) {
            e.removeEventListener('mouseover', e.elm_hover_over);
            e.elm_hover_over = null;
        }
        if (e.elm_hover_out) {
            e.removeEventListener('mouseout', e.elm_hover_out);
            e.elm_hover_out = null;
        }
    }

    function image(props, img) {
        switch (img._0.ctor) {
        case 'Plain':   return plainImage(img._3);
        case 'Fitted':  return fittedImage(props.width, props.height, img._3);
        case 'Cropped': return croppedImage(img,props.width,props.height,img._3);
        case 'Tiled':   return tiledImage(img._3);
        }
    }

    function plainImage(src) {
        var img = createNode('img');
        img.src = src;
        img.name = src;
        img.style.display = "block";
        return img;
    }

    function tiledImage(src) {
        var div = createNode('div');
        div.style.backgroundImage = 'url(' + src + ')';
        return div;
    }

    function fittedImage(w, h, src) {
        var div = createNode('div');
        div.style.background = 'url(' + src + ') no-repeat center';
        div.style.webkitBackgroundSize = 'cover';
        div.style.MozBackgroundSize = 'cover';
        div.style.OBackgroundSize = 'cover';
        div.style.backgroundSize = 'cover';
        return div;
    }

    function croppedImage(elem, w, h, src) {
        var pos = elem._0._0;
        var e = createNode('div');
        e.style.overflow = "hidden";

        var img = createNode('img');
        img.onload = function() {
            var sw = w / elem._1, sh = h / elem._2;
            img.style.width = ((this.width * sw)|0) + 'px';
            img.style.height = ((this.height * sh)|0) + 'px';
            img.style.marginLeft = ((- pos._0 * sw)|0) + 'px';
            img.style.marginTop = ((- pos._1 * sh)|0) + 'px';
        };
        img.src = src;
        img.name = src;
        e.appendChild(img);
        return e;
    }

    function goOut(node) {
        node.style.position = 'absolute';
        return node;
    }
    function goDown(node) {
        return node;
    }
    function goRight(node) {
        node.style.styleFloat = 'left';
        node.style.cssFloat = 'left';
        return node;
    }

    var directionTable = {
        DUp    : goDown,
        DDown  : goDown,
        DLeft  : goRight,
        DRight : goRight,
        DIn    : goOut,
        DOut   : goOut
    };
    function needsReversal(dir) {
        return dir == 'DUp' || dir == 'DLeft' || dir == 'DIn';
    }

    function flow(dir,elist) {
        var array = List.toArray(elist);
        var container = createNode('div');
        var goDir = directionTable[dir];
        if (goDir == goOut) {
            container.style.pointerEvents = 'none';
        }
        if (needsReversal(dir)) {
            array.reverse();
        }
        var len = array.length;
        for (var i = 0; i < len; ++i) {
            container.appendChild(goDir(render(array[i])));
        }
        return container;
    }

    function toPos(pos) {
        switch(pos.ctor) {
        case "Absolute": return  pos._0 + "px";
        case "Relative": return (pos._0 * 100) + "%";
        }
    }

    // must clear right, left, top, bottom, and transform
    // before calling this function
    function setPos(pos,elem,e) {
        var element = elem.element;
        var props = elem.props;
        var w = props.width + (element.adjustWidth ? element.adjustWidth : 0);
        var h = props.height + (element.adjustHeight ? element.adjustHeight : 0);

        e.style.position = 'absolute';
        e.style.margin = 'auto';
        var transform = '';
        switch(pos.horizontal.ctor) {
        case 'P': e.style.right = toPos(pos.x); e.style.removeProperty('left'); break;
        case 'Z': transform = 'translateX(' + ((-w/2)|0) + 'px) ';
        case 'N': e.style.left = toPos(pos.x); e.style.removeProperty('right'); break;
        }
        switch(pos.vertical.ctor) {
        case 'N': e.style.bottom = toPos(pos.y); e.style.removeProperty('top'); break;
        case 'Z': transform += 'translateY(' + ((-h/2)|0) + 'px)';
        case 'P': e.style.top = toPos(pos.y); e.style.removeProperty('bottom'); break;
        }
        if (transform !== '') {
            addTransform(e.style, transform);
        }
        return e;
    }

    function addTransform(style, transform) {
        style.transform       = transform;
        style.msTransform     = transform;
        style.MozTransform    = transform;
        style.webkitTransform = transform;
        style.OTransform      = transform;
    }

    function container(pos,elem) {
        var e = render(elem);
        setPos(pos, elem, e);
        var div = createNode('div');
        div.style.position = 'relative';
        div.style.overflow = 'hidden';
        div.appendChild(e);
        return div;
    }

    function rawHtml(elem) {
        var html = elem.html;
        var guid = elem.guid;
        var align = elem.align;

        var div = createNode('div');
        div.innerHTML = html;
        div.style.visibility = "hidden";
        if (align) {
            div.style.textAlign = align;
        }
        div.style.visibility = 'visible';
        div.style.pointerEvents = 'auto';
        return div;
    }

    function render(elem) {
        return setProps(elem, makeElement(elem));
    }
    function makeElement(e) {
        var elem = e.element;
        switch(elem.ctor) {
        case 'Image':     return image(e.props, elem);
        case 'Flow':      return flow(elem._0.ctor, elem._1);
        case 'Container': return container(elem._0, elem._1);
        case 'Spacer':    return createNode('div');
        case 'RawHtml':   return rawHtml(elem);
        case 'Custom':    return elem.render(elem.model);
        }
    }

    function updateAndReplace(node, curr, next) {
        var newNode = update(node, curr, next);
        if (newNode !== node) {
            node.parentNode.replaceChild(newNode, node);
        }
        return newNode;
    }

    function update(node, curr, next) {
        var rootNode = node;
        if (node.tagName === 'A') {
            node = node.firstChild;
        }
        if (curr.props.id === next.props.id) {
            updateProps(node, curr, next);
            return rootNode;
        }
        if (curr.element.ctor !== next.element.ctor) {
            return render(next);
        }
        var nextE = next.element;
        var currE = curr.element;
        switch(nextE.ctor) {
        case "Spacer":
            updateProps(node, curr, next);
            return rootNode;

        case "RawHtml":
            if(currE.html.valueOf() !== nextE.html.valueOf()) {
                node.innerHTML = nextE.html;
            }
            updateProps(node, curr, next);
            return rootNode;

        case "Image":
            if (nextE._0.ctor === 'Plain') {
                if (nextE._3 !== currE._3) {
                    node.src = nextE._3;
                }
            } else if (!Utils.eq(nextE,currE) ||
                       next.props.width !== curr.props.width ||
                       next.props.height !== curr.props.height) {
                return render(next);
            }
            updateProps(node, curr, next);
            return rootNode;

        case "Flow":
            var arr = List.toArray(nextE._1);
            for (var i = arr.length; i--; ) {
                arr[i] = arr[i].element.ctor;
            }
            if (nextE._0.ctor !== currE._0.ctor) {
                return render(next);
            }
            var nexts = List.toArray(nextE._1);
            var kids = node.childNodes;
            if (nexts.length !== kids.length) {
                return render(next);
            }
            var currs = List.toArray(currE._1);
            var dir = nextE._0.ctor;
            var goDir = directionTable[dir];
            var toReverse = needsReversal(dir);
            var len = kids.length;
            for (var i = len; i-- ;) {
                var subNode = kids[toReverse ? len - i - 1 : i];
                goDir(updateAndReplace(subNode, currs[i], nexts[i]));
            }
            updateProps(node, curr, next);
            return rootNode;

        case "Container":
            var subNode = node.firstChild;
            var newSubNode = updateAndReplace(subNode, currE._1, nextE._1);
            setPos(nextE._0, nextE._1, newSubNode);
            updateProps(node, curr, next);
            return rootNode;

        case "Custom":
            if (currE.type === nextE.type) {
                var updatedNode = nextE.update(node, currE.model, nextE.model);
                updateProps(updatedNode, curr, next);
                return updatedNode;
            } else {
                return render(next);
            }
        }
    }

    function updateProps(node, curr, next) {
        var nextProps = next.props;
        var currProps = curr.props;

        var element = next.element;
        var width = nextProps.width - (element.adjustWidth || 0);
        var height = nextProps.height - (element.adjustHeight || 0);
        if (width !== currProps.width) {
            node.style.width = (width|0) + 'px';
        }
        if (height !== currProps.height) {
            node.style.height = (height|0) + 'px';
        }

        if (nextProps.opacity !== currProps.opacity) {
            node.style.opacity = nextProps.opacity;
        }

        var nextColor = nextProps.color.ctor === 'Just'
            ? Color.toCss(nextProps.color._0)
            : '';
        if (node.style.backgroundColor !== nextColor) {
            node.style.backgroundColor = nextColor;
        }

        if (nextProps.tag !== currProps.tag) {
            node.id = nextProps.tag;
        }

        if (nextProps.href !== currProps.href) {
            if (currProps.href === '') {
                // add a surrounding href
                var anchor = createNode('a');
                anchor.href = nextProps.href;
                anchor.style.display = 'block';
                anchor.style.pointerEvents = 'auto';

                node.parentNode.replaceChild(anchor, node);
                anchor.appendChild(node);
            } else if (nextProps.href === '') {
                // remove the surrounding href
                var anchor = node.parentNode;
                anchor.parentNode.replaceChild(node, anchor);
            } else {
                // just update the link
                node.parentNode.href = nextProps.href;
            }
        }

        // update click and hover handlers
        var removed = false;

        // update hover handlers
        if (currProps.hover.ctor === '_Tuple0') {
            if (nextProps.hover.ctor !== '_Tuple0') {
                addHover(node, nextProps.hover);
            }
        }
        else {
            if (nextProps.hover.ctor === '_Tuple0') {
                removed = true;
                removeHover(node);
            }
            else {
                node.elm_hover_handler = nextProps.hover;
            }
        }

        // update click handlers
        if (currProps.click.ctor === '_Tuple0') {
            if (nextProps.click.ctor !== '_Tuple0') {
                addClick(node, nextProps.click);
            }
        }
        else {
            if (nextProps.click.ctor === '_Tuple0') {
                removed = true;
                removeClick(node);
            } else {
                node.elm_click_handler = nextProps.click;
            }
        }

        // stop capturing clicks if 
        if (removed
            && nextProps.hover.ctor === '_Tuple0'
            && nextProps.click.ctor === '_Tuple0')
        {
            node.style.pointerEvents = 'none';
        }
    }


    function htmlHeight(width, rawHtml) {
        // create dummy node
        var temp = document.createElement('div');
        temp.innerHTML = rawHtml.html;
        if (width > 0) {
            temp.style.width = width + "px";
        }
        temp.style.visibility = "hidden";
        temp.style.styleFloat = "left";
        temp.style.cssFloat   = "left";

        document.body.appendChild(temp);

        // get dimensions
        var style = window.getComputedStyle(temp, null);
        var w = Math.ceil(style.getPropertyValue("width").slice(0,-2) - 0);
        var h = Math.ceil(style.getPropertyValue("height").slice(0,-2) - 0);
        document.body.removeChild(temp);
        return Utils.Tuple2(w,h);
    }


    return localRuntime.Native.Graphics.Element.values = {
        render: render,
        update: update,
        updateAndReplace: updateAndReplace,

        createNode: createNode,
        addTransform: addTransform,
        htmlHeight: F2(htmlHeight),
        guid: Utils.guid
    };

};

// setup
Elm.Native = Elm.Native || {};
Elm.Native.Graphics = Elm.Native.Graphics || {};
Elm.Native.Graphics.Input = Elm.Native.Graphics.Input || {};

// definition
Elm.Native.Graphics.Input.make = function(localRuntime) {
    'use strict';

    // attempt to short-circuit
    if ('values' in Elm.Native.Graphics.Input) {
        return Elm.Native.Graphics.Input.values;
    }

    var Color = Elm.Native.Color.make(localRuntime);
    var List = Elm.Native.List.make(localRuntime);
    var Text = Elm.Native.Text.make(localRuntime);
    var Utils = Elm.Native.Utils.make(localRuntime);

    var Element = Elm.Graphics.Element.make(localRuntime);
    var NativeElement = Elm.Native.Graphics.Element.make(localRuntime);


    function renderDropDown(model) {
        var drop = NativeElement.createNode('select');
        drop.style.border = '0 solid';
        drop.style.pointerEvents = 'auto';
        drop.style.display = 'block';

        drop.elm_values = List.toArray(model.values);
        drop.elm_handler = model.handler;
        var values = drop.elm_values;

        for (var i = 0; i < values.length; ++i) {
            var option = NativeElement.createNode('option');
            var name = values[i]._0;
            option.value = name;
            option.innerHTML = name;
            drop.appendChild(option);
        }
        drop.addEventListener('change', function() {
            drop.elm_handler(drop.elm_values[drop.selectedIndex]._1)();
        });

        return drop;
    }

    function updateDropDown(node, oldModel, newModel) {
        node.elm_values = List.toArray(newModel.values);
        node.elm_handler = newModel.handler;

        var values = node.elm_values;
        var kids = node.childNodes;
        var kidsLength = kids.length;

        var i = 0;
        for (; i < kidsLength && i < values.length; ++i) {
            var option = kids[i];
            var name = values[i]._0;
            option.value = name;
            option.innerHTML = name;
        }
        for (; i < kidsLength; ++i) {
            node.removeChild(node.lastChild);
        }
        for (; i < values.length; ++i) {
            var option = NativeElement.createNode('option');
            var name = values[i]._0;
            option.value = name;
            option.innerHTML = name;
            node.appendChild(option);
        }
        return node;
    }

    function dropDown(handler, values) {
        return A3(Element.newElement, 100, 24, {
            ctor: 'Custom',
            type: 'DropDown',
            render: renderDropDown,
            update: updateDropDown,
            model: {
                values: values,
                handler: handler
            }
        });
    }

    function renderButton(model) {
        var node = NativeElement.createNode('button');
        node.style.display = 'block';
        node.style.pointerEvents = 'auto';
        node.elm_message = model.message;
        function click() {
            node.elm_message();
        }
        node.addEventListener('click', click);
        node.innerHTML = model.text;
        return node;
    }

    function updateButton(node, oldModel, newModel) {
        node.elm_message = newModel.message;
        var txt = newModel.text;
        if (oldModel.text !== txt) {
            node.innerHTML = txt;
        }
        return node;
    }

    function button(message, text) {
        return A3(Element.newElement, 100, 40, {
            ctor: 'Custom',
            type: 'Button',
            render: renderButton,
            update: updateButton,
            model: {
                message: message,
                text:text
            }
        });
    }

    function renderCustomButton(model) {
        var btn = NativeElement.createNode('div');
        btn.style.pointerEvents = 'auto';
        btn.elm_message = model.message;

        btn.elm_up    = NativeElement.render(model.up);
        btn.elm_hover = NativeElement.render(model.hover);
        btn.elm_down  = NativeElement.render(model.down);

        btn.elm_up.style.display = 'block';
        btn.elm_hover.style.display = 'none';
        btn.elm_down.style.display = 'none';
  
        btn.appendChild(btn.elm_up);
        btn.appendChild(btn.elm_hover);
        btn.appendChild(btn.elm_down);

        function swap(visibleNode, hiddenNode1, hiddenNode2) {
            visibleNode.style.display = 'block';
            hiddenNode1.style.display = 'none';
            hiddenNode2.style.display = 'none';
        }

        var overCount = 0;
        function over(e) {
            if (overCount++ > 0) return;
            swap(btn.elm_hover, btn.elm_down, btn.elm_up);
        }
        function out(e) {
            if (btn.contains(e.toElement || e.relatedTarget)) return;
            overCount = 0;
            swap(btn.elm_up, btn.elm_down, btn.elm_hover);
        }
        function up() {
            swap(btn.elm_hover, btn.elm_down, btn.elm_up);
            btn.elm_message();
        }
        function down() {
            swap(btn.elm_down, btn.elm_hover, btn.elm_up);
        }

        btn.addEventListener('mouseover', over);
        btn.addEventListener('mouseout' , out);
        btn.addEventListener('mousedown', down);
        btn.addEventListener('mouseup'  , up);

        return btn;
    }

    function updateCustomButton(node, oldModel, newModel) {
        node.elm_message = newModel.message;

        var kids = node.childNodes;
        var styleUp    = kids[0].style.display;
        var styleHover = kids[1].style.display;
        var styleDown  = kids[2].style.display;

        NativeElement.updateAndReplace(kids[0], oldModel.up, newModel.up);
        NativeElement.updateAndReplace(kids[1], oldModel.hover, newModel.hover);
        NativeElement.updateAndReplace(kids[2], oldModel.down, newModel.down);

        var kids = node.childNodes;
        kids[0].style.display = styleUp;
        kids[1].style.display = styleHover;
        kids[2].style.display = styleDown;

        return node;
    }

    function max3(a,b,c) {
        var ab = a > b ? a : b;
        return ab > c ? ab : c;
    }

    function customButton(message, up, hover, down) {
        return A3(Element.newElement,
                  max3(up.props.width, hover.props.width, down.props.width),
                  max3(up.props.height, hover.props.height, down.props.height),
                  { ctor: 'Custom',
                    type: 'CustomButton',
                    render: renderCustomButton,
                    update: updateCustomButton,
                    model: {
                        message: message,
                        up: up,
                        hover: hover,
                        down: down
                    }
                  });
    }

    function renderCheckbox(model) {
        var node = NativeElement.createNode('input');
        node.type = 'checkbox';
        node.checked = model.checked;
        node.style.display = 'block';
        node.style.pointerEvents = 'auto';
        node.elm_handler = model.handler;
        function change() {
            node.elm_handler(node.checked)();
        }
        node.addEventListener('change', change);
        return node;
    }

    function updateCheckbox(node, oldModel, newModel) {
        node.elm_handler = newModel.handler;
        node.checked = newModel.checked;
        return node;
    }

    function checkbox(handler, checked) {
        return A3(Element.newElement, 13, 13, {
            ctor: 'Custom',
            type: 'CheckBox',
            render: renderCheckbox,
            update: updateCheckbox,
            model: { handler:handler, checked:checked }
        });
    }

    function setRange(node, start, end, dir) {
        if (node.parentNode) {
            node.setSelectionRange(start, end, dir);
        } else {
            setTimeout(function(){node.setSelectionRange(start, end, dir);}, 0);
        }
    }

    function updateIfNeeded(css, attribute, latestAttribute) {
        if (css[attribute] !== latestAttribute) {
            css[attribute] = latestAttribute;
        }
    }
    function cssDimensions(dimensions) {
        return dimensions.top    + 'px ' +
               dimensions.right  + 'px ' +
               dimensions.bottom + 'px ' +
               dimensions.left   + 'px';
    }
    function updateFieldStyle(css, style) {
        updateIfNeeded(css, 'padding', cssDimensions(style.padding));

        var outline = style.outline;
        updateIfNeeded(css, 'border-width', cssDimensions(outline.width));
        updateIfNeeded(css, 'border-color', Color.toCss(outline.color));
        updateIfNeeded(css, 'border-radius', outline.radius + 'px');

        var highlight = style.highlight;
        if (highlight.width === 0) {
            css.outline = 'none';
        } else {
            updateIfNeeded(css, 'outline-width', highlight.width + 'px');
            updateIfNeeded(css, 'outline-color', Color.toCss(highlight.color));
        }

        var textStyle = style.style;
        updateIfNeeded(css, 'color', Color.toCss(textStyle.color));
        if (textStyle.typeface.ctor !== '[]') {
            updateIfNeeded(css, 'font-family', Text.toTypefaces(textStyle.typeface));
        }
        if (textStyle.height.ctor !== "Nothing") {
            updateIfNeeded(css, 'font-size', textStyle.height._0 + 'px');
        }
        updateIfNeeded(css, 'font-weight', textStyle.bold ? 'bold' : 'normal');
        updateIfNeeded(css, 'font-style', textStyle.italic ? 'italic' : 'normal');
        if (textStyle.line.ctor !== 'Nothing') {
            updateIfNeeded(css, 'text-decoration', Text.toLine(textStyle.line._0));
        }
    }

    function renderField(model) {
        var field = NativeElement.createNode('input');
        updateFieldStyle(field.style, model.style);
        field.style.borderStyle = 'solid';
        field.style.pointerEvents = 'auto';

        field.type = model.type;
        field.placeholder = model.placeHolder;
        field.value = model.content.string;

        field.elm_handler = model.handler;
        field.elm_old_value = field.value;

        function inputUpdate(event) {
            var curr = field.elm_old_value;
            var next = field.value;
            if (curr === next) {
                return;
            }

            var direction = field.selectionDirection === 'forward' ? 'Forward' : 'Backward';
            var start = field.selectionStart;
            var end = field.selectionEnd;
            field.value = field.elm_old_value;

            field.elm_handler({
                _:{},
                string: next,
                selection: {
                    _:{},
                    start: start,
                    end: end,
                    direction: { ctor: direction }
                }
            })();
        }

        field.addEventListener('input', inputUpdate);
        field.addEventListener('focus', function() {
            field.elm_hasFocus = true;
        });
        field.addEventListener('blur', function() {
            field.elm_hasFocus = false;
        });

        return field;
    }

    function updateField(field, oldModel, newModel) {
        if (oldModel.style !== newModel.style) {
            updateFieldStyle(field.style, newModel.style);
        }
        field.elm_handler = newModel.handler;

        field.type = newModel.type;
        field.placeholder = newModel.placeHolder;
        var value = newModel.content.string;
        field.value = value;
        field.elm_old_value = value;
        if (field.elm_hasFocus) {
            var selection = newModel.content.selection;
            var direction = selection.direction.ctor === 'Forward' ? 'forward' : 'backward';
            setRange(field, selection.start, selection.end, direction);
        }
        return field;
    }

    function mkField(type) {
        function field(style, handler, placeHolder, content) {
            var padding = style.padding;
            var outline = style.outline.width;
            var adjustWidth = padding.left + padding.right + outline.left + outline.right;
            var adjustHeight = padding.top + padding.bottom + outline.top + outline.bottom;
            return A3(Element.newElement, 200, 30, {
                ctor: 'Custom',
                type: type + 'Field',
                adjustWidth: adjustWidth,
                adjustHeight: adjustHeight,
                render: renderField,
                update: updateField,
                model: {
                    handler:handler,
                    placeHolder:placeHolder,
                    content:content,
                    style:style,
                    type:type
                }
            });
        }
        return F4(field);
    }

    function hoverable(handler, elem) {
        function onHover(bool) {
            handler(bool)();
        }
        var props = Utils.replace([['hover',onHover]], elem.props);
        return { props:props, element:elem.element };
    }

    function clickable(message, elem) {
        function onClick() {
            message();
        }
        var props = Utils.replace([['click',onClick]], elem.props);
        return { props:props, element:elem.element };
    }

    return Elm.Native.Graphics.Input.values = {
        button: F2(button),
        customButton: F4(customButton),
        checkbox: F2(checkbox),
        dropDown: F2(dropDown),
        field: mkField('text'),
        email: mkField('email'),
        password: mkField('password'),
        hoverable: F2(hoverable),
        clickable: F2(clickable)
    };

};

Elm.Native.Json = {};
Elm.Native.Json.make = function(localRuntime) {
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Json = localRuntime.Native.Json || {};
    if (localRuntime.Native.Json.values) {
        return localRuntime.Native.Json.values;
    }

    var ElmArray = Elm.Native.Array.make(localRuntime);
    var List = Elm.Native.List.make(localRuntime);
    var Maybe = Elm.Maybe.make(localRuntime);
    var Result = Elm.Result.make(localRuntime);
    var Utils = Elm.Native.Utils.make(localRuntime);


    function crash(expected, actual) {
        throw new Error(
            'expecting ' + expected + ' but got ' + JSON.stringify(actual)
        );
    }


    // PRIMITIVE VALUES

    function decodeNull(successValue) {
        return function(value) {
            if (value === null) {
                return successValue;
            }
            crash('null', value);
        };
    }


    function decodeString(value) {
        if (typeof value === 'string' || value instanceof String) {
            return value;
        }
        crash('a String', value);
    }


    function decodeFloat(value) {
        if (typeof value === 'number') {
            return value;
        }
        crash('a Float', value);
    }


    function decodeInt(value) {
        if (typeof value === 'number' && (value|0) === value) {
            return value;
        }
        crash('an Int', value);
    }


    function decodeBool(value) {
        if (typeof value === 'boolean') {
            return value;
        }
        crash('a Bool', value);
    }


    // ARRAY

    function decodeArray(decoder) {
        return function(value) {
            if (value instanceof Array) {
                var len = value.length;
                var array = new Array(len);
                for (var i = len; i-- ; ) {
                    array[i] = decoder(value[i]);
                }
                return ElmArray.fromJSArray(array);
            }
            crash('an Array', value);
        };
    }


    // LIST

    function decodeList(decoder) {
        return function(value) {
            if (value instanceof Array) {
                var len = value.length;
                var list = List.Nil;
                for (var i = len; i-- ; ) {
                    list = List.Cons( decoder(value[i]), list );
                }
                return list;
            }
            crash('a List', value);
        };
    }


    // MAYBE

    function decodeMaybe(decoder) {
        return function(value) {
            try {
                return Maybe.Just(decoder(value));
            } catch(e) {
                return Maybe.Nothing;
            }
        };
    }


    // FIELDS

    function decodeField(field, decoder) {
        return function(value) {
            var subValue = value[field];
            if (subValue !== undefined) {
                return decoder(subValue);
            }
            crash("an object with field '" + field + "'", value);
        };
    }


    // OBJECTS

    function decodeKeyValuePairs(decoder) {
        return function(value) {
            var isObject =
                typeof value === 'object'
                    && value !== null
                    && !(value instanceof Array);

            if (isObject) {
                var keyValuePairs = List.Nil;
                for (var key in value) {
                    var elmValue = decoder(value[key]);
                    var pair = Utils.Tuple2(key, elmValue);
                    keyValuePairs = List.Cons(pair, keyValuePairs);
                }
                return keyValuePairs;
            }

            crash("an object", value);
        };
    }

    function decodeObject1(f, d1) {
        return function(value) {
            return f(d1(value));
        };
    }

    function decodeObject2(f, d1, d2) {
        return function(value) {
            return A2( f, d1(value), d2(value) );
        };
    }

    function decodeObject3(f, d1, d2, d3) {
        return function(value) {
            return A3( f, d1(value), d2(value), d3(value) );
        };
    }

    function decodeObject4(f, d1, d2, d3, d4) {
        return function(value) {
            return A4( f, d1(value), d2(value), d3(value), d4(value) );
        };
    }

    function decodeObject5(f, d1, d2, d3, d4, d5) {
        return function(value) {
            return A5( f, d1(value), d2(value), d3(value), d4(value), d5(value) );
        };
    }

    function decodeObject6(f, d1, d2, d3, d4, d5, d6) {
        return function(value) {
            return A6( f,
                d1(value),
                d2(value),
                d3(value),
                d4(value),
                d5(value),
                d6(value)
            );
        };
    }

    function decodeObject7(f, d1, d2, d3, d4, d5, d6, d7) {
        return function(value) {
            return A7( f,
                d1(value),
                d2(value),
                d3(value),
                d4(value),
                d5(value),
                d6(value),
                d7(value)
            );
        };
    }

    function decodeObject8(f, d1, d2, d3, d4, d5, d6, d7, d8) {
        return function(value) {
            return A8( f,
                d1(value),
                d2(value),
                d3(value),
                d4(value),
                d5(value),
                d6(value),
                d7(value),
                d8(value)
            );
        };
    }


    // TUPLES

    function decodeTuple1(f, d1) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 1 ) {
                crash('a Tuple of length 1', value);
            }
            return f( d1(value[0]) );
        };
    }

    function decodeTuple2(f, d1, d2) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 2 ) {
                crash('a Tuple of length 2', value);
            }
            return A2( f, d1(value[0]), d2(value[1]) );
        };
    }

    function decodeTuple3(f, d1, d2, d3) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 3 ) {
                crash('a Tuple of length 3', value);
            }
            return A3( f, d1(value[0]), d2(value[1]), d3(value[2]) );
        };
    }


    function decodeTuple4(f, d1, d2, d3, d4) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 4 ) {
                crash('a Tuple of length 4', value);
            }
            return A4( f, d1(value[0]), d2(value[1]), d3(value[2]), d4(value[3]) );
        };
    }


    function decodeTuple5(f, d1, d2, d3, d4, d5) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 5 ) {
                crash('a Tuple of length 5', value);
            }
            return A5( f,
                d1(value[0]),
                d2(value[1]),
                d3(value[2]),
                d4(value[3]),
                d5(value[4])
            );
        };
    }


    function decodeTuple6(f, d1, d2, d3, d4, d5, d6) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 6 ) {
                crash('a Tuple of length 6', value);
            }
            return A6( f,
                d1(value[0]),
                d2(value[1]),
                d3(value[2]),
                d4(value[3]),
                d5(value[4]),
                d6(value[5])
            );
        };
    }

    function decodeTuple7(f, d1, d2, d3, d4, d5, d6, d7) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 7 ) {
                crash('a Tuple of length 7', value);
            }
            return A7( f,
                d1(value[0]),
                d2(value[1]),
                d3(value[2]),
                d4(value[3]),
                d5(value[4]),
                d6(value[5]),
                d7(value[6])
            );
        };
    }


    function decodeTuple8(f, d1, d2, d3, d4, d5, d6, d7, d8) {
        return function(value) {
            if ( !(value instanceof Array) || value.length !== 8 ) {
                crash('a Tuple of length 8', value);
            }
            return A8( f,
                d1(value[0]),
                d2(value[1]),
                d3(value[2]),
                d4(value[3]),
                d5(value[4]),
                d6(value[5]),
                d7(value[6]),
                d8(value[7])
            );
        };
    }


    // CUSTOM DECODERS

    function decodeValue(value) {
        return value;
    }

    function runDecoderValue(decoder, value) {
        try {
            return Result.Ok(decoder(value));
        } catch(e) {
            return Result.Err(e.message);
        }
    }

    function customDecoder(decoder, callback) {
        return function(value) {
            var result = callback(decoder(value));
            if (result.ctor === 'Err') {
                throw new Error('custom decoder failed: ' + result._0);
            }
            return result._0;
        }
    }

    function andThen(decode, callback) {
        return function(value) {
            var result = decode(value);
            return callback(result)(value);
        }
    }

    function fail(msg) {
        return function(value) {
            throw new Error(msg);
        }
    }

    function succeed(successValue) {
        return function(value) {
            return successValue;
        }
    }


    // ONE OF MANY

    function oneOf(decoders) {
        return function(value) {
            var errors = [];
            var temp = decoders;
            while (temp.ctor !== '[]') {
                try {
                    return temp._0(value);
                } catch(e) {
                    errors.push(e.message);
                }
                temp = temp._1;
            }
            throw new Error('expecting one of the following:\n    ' + errors.join('\n    '));
        }
    }

    function get(decoder, value) {
        try {
            return Result.Ok(decoder(value));
        } catch(e) {
            return Result.Err(e.message);
        }
    }


    // ENCODE / DECODE

    function runDecoderString(decoder, string) {
        try {
            return Result.Ok(decoder(JSON.parse(string)));
        } catch(e) {
            return Result.Err(e.message);
        }
    }

    function encode(indentLevel, value) {
        return JSON.stringify(value, null, indentLevel);
    }

    function identity(value) {
        return value;
    }

    function encodeObject(keyValuePairs) {
        var obj = {};
        while (keyValuePairs.ctor !== '[]') {
            var pair = keyValuePairs._0;
            obj[pair._0] = pair._1;
            keyValuePairs = keyValuePairs._1;
        }
        return obj;
    }

    return localRuntime.Native.Json.values = {
        encode: F2(encode),
        runDecoderString: F2(runDecoderString),
        runDecoderValue: F2(runDecoderValue),

        get: F2(get),
        oneOf: oneOf,

        decodeNull: decodeNull,
        decodeInt: decodeInt,
        decodeFloat: decodeFloat,
        decodeString: decodeString,
        decodeBool: decodeBool,

        decodeMaybe: decodeMaybe,

        decodeList: decodeList,
        decodeArray: decodeArray,

        decodeField: F2(decodeField),

        decodeObject1: F2(decodeObject1),
        decodeObject2: F3(decodeObject2),
        decodeObject3: F4(decodeObject3),
        decodeObject4: F5(decodeObject4),
        decodeObject5: F6(decodeObject5),
        decodeObject6: F7(decodeObject6),
        decodeObject7: F8(decodeObject7),
        decodeObject8: F9(decodeObject8),
        decodeKeyValuePairs: decodeKeyValuePairs,

        decodeTuple1: F2(decodeTuple1),
        decodeTuple2: F3(decodeTuple2),
        decodeTuple3: F4(decodeTuple3),
        decodeTuple4: F5(decodeTuple4),
        decodeTuple5: F6(decodeTuple5),
        decodeTuple6: F7(decodeTuple6),
        decodeTuple7: F8(decodeTuple7),
        decodeTuple8: F9(decodeTuple8),

        andThen: F2(andThen),
        decodeValue: decodeValue,
        customDecoder: F2(customDecoder),
        fail: fail,
        succeed: succeed,

        identity: identity,
        encodeNull: null,
        encodeArray: ElmArray.toJSArray,
        encodeList: List.toArray,
        encodeObject: encodeObject

    };

};

Elm.Native.List = {};
Elm.Native.List.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.List = elm.Native.List || {};
    if (elm.Native.List.values) return elm.Native.List.values;
    if ('values' in Elm.Native.List)
        return elm.Native.List.values = Elm.Native.List.values;

    var Utils = Elm.Native.Utils.make(elm);

    var Nil = Utils.Nil;
    var Cons = Utils.Cons;

    function throwError(f) {
        throw new Error("Function '" + f + "' expects a non-empty list!");
    }

    function toArray(xs) {
        var out = [];
        while (xs.ctor !== '[]') {
            out.push(xs._0);
            xs = xs._1;
        }
        return out;
    }

    function fromArray(arr) {
        var out = Nil;
        for (var i = arr.length; i--; ) {
            out = Cons(arr[i], out);
        }
        return out;
    }

    function range(lo,hi) {
        var lst = Nil;
        if (lo <= hi) {
            do { lst = Cons(hi,lst) } while (hi-->lo);
        }
        return lst
    }

    function head(v) {
        return v.ctor === '[]' ? throwError('head') : v._0;
    }
    function tail(v) {
        return v.ctor === '[]' ? throwError('tail') : v._1;
    }

    function map(f, xs) {
        var arr = [];
        while (xs.ctor !== '[]') {
            arr.push(f(xs._0));
            xs = xs._1;
        }
        return fromArray(arr);
    }

    // f defined similarly for both foldl and foldr (NB: different from Haskell)
    // ie, foldl : (a -> b -> b) -> b -> [a] -> b
    function foldl(f, b, xs) {
        var acc = b;
        while (xs.ctor !== '[]') {
            acc = A2(f, xs._0, acc);
            xs = xs._1;
        }
        return acc;
    }

    function foldr(f, b, xs) {
        var arr = toArray(xs);
        var acc = b;
        for (var i = arr.length; i--; ) {
            acc = A2(f, arr[i], acc);
        }
        return acc;
    }

    function foldl1(f, xs) {
        return xs.ctor === '[]' ? throwError('foldl1') : foldl(f, xs._0, xs._1);
    }

    function foldr1(f, xs) {
        if (xs.ctor === '[]') { throwError('foldr1'); }
        var arr = toArray(xs);
        var acc = arr.pop();
        for (var i = arr.length; i--; ) {
            acc = A2(f, arr[i], acc);
        }
        return acc;
    }

    function scanl(f, b, xs) {
        var arr = toArray(xs);
        arr.unshift(b);
        var len = arr.length;
        for (var i = 1; i < len; ++i) {
            arr[i] = A2(f, arr[i], arr[i-1]);
        }
        return fromArray(arr);
    }

    function scanl1(f, xs) {
        return xs.ctor === '[]' ? throwError('scanl1') : scanl(f, xs._0, xs._1);
    }

    function filter(pred, xs) {
        var arr = [];
        while (xs.ctor !== '[]') {
            if (pred(xs._0)) { arr.push(xs._0); }
            xs = xs._1;
        }
        return fromArray(arr);
    }

    function length(xs) {
        var out = 0;
        while (xs.ctor !== '[]') {
            out += 1;
            xs = xs._1;
        }
        return out;
    }

    function member(x, xs) {
        while (xs.ctor !== '[]') {
            if (Utils.eq(x,xs._0)) return true;
            xs = xs._1;
        }
        return false;
    }

    function append(xs, ys) {
        if (xs.ctor === '[]') {
            return ys;
        }
        var root = Cons(xs._0, Nil);
        var curr = root;
        xs = xs._1;
        while (xs.ctor !== '[]') {
            curr._1 = Cons(xs._0, Nil);
            xs = xs._1;
            curr = curr._1;
        }
        curr._1 = ys;
        return root;
    }

    function all(pred, xs) {
        while (xs.ctor !== '[]') {
            if (!pred(xs._0)) return false;
            xs = xs._1;
        }
        return true;
    }

    function any(pred, xs) {
        while (xs.ctor !== '[]') {
            if (pred(xs._0)) return true;
            xs = xs._1;
        }
        return false;
    }

    function map2(f, xs, ys) {
        var arr = [];
        while (xs.ctor !== '[]' && ys.ctor !== '[]') {
            arr.push(A2(f, xs._0, ys._0));
            xs = xs._1;
            ys = ys._1;
        }
        return fromArray(arr);
    }

    function map3(f, xs, ys, zs) {
        var arr = [];
        while (xs.ctor !== '[]' && ys.ctor !== '[]' && zs.ctor !== '[]') {
            arr.push(A3(f, xs._0, ys._0, zs._0));
            xs = xs._1;
            ys = ys._1;
            zs = zs._1;
        }
        return fromArray(arr);
    }

    function map4(f, ws, xs, ys, zs) {
        var arr = [];
        while (   ws.ctor !== '[]'
               && xs.ctor !== '[]'
               && ys.ctor !== '[]'
               && zs.ctor !== '[]')
        {
            arr.push(A4(f, ws._0, xs._0, ys._0, zs._0));
            ws = ws._1;
            xs = xs._1;
            ys = ys._1;
            zs = zs._1;
        }
        return fromArray(arr);
    }

    function map5(f, vs, ws, xs, ys, zs) {
        var arr = [];
        while (   vs.ctor !== '[]'
               && ws.ctor !== '[]'
               && xs.ctor !== '[]'
               && ys.ctor !== '[]'
               && zs.ctor !== '[]')
        {
            arr.push(A5(f, vs._0, ws._0, xs._0, ys._0, zs._0));
            vs = vs._1;
            ws = ws._1;
            xs = xs._1;
            ys = ys._1;
            zs = zs._1;
        }
        return fromArray(arr);
    }

    function sort(xs) {
        return fromArray(toArray(xs).sort(Utils.cmp));
    }

    function sortBy(f, xs) {
        return fromArray(toArray(xs).sort(function(a,b){
            return Utils.cmp(f(a), f(b));
        }));
    }

    function sortWith(f, xs) {
        return fromArray(toArray(xs).sort(function(a,b){
            var ord = f(a)(b).ctor;
            return ord === 'EQ' ? 0 : ord === 'LT' ? -1 : 1;
        }));
    }

    function take(n, xs) {
        var arr = [];
        while (xs.ctor !== '[]' && n > 0) {
            arr.push(xs._0);
            xs = xs._1;
            --n;
        }
        return fromArray(arr);
    }

    function drop(n, xs) {
        while (xs.ctor !== '[]' && n > 0) {
            xs = xs._1;
            --n;
        }
        return xs;
    }

    function repeat(n, x) {
        var arr = [];
        var pattern = [x];
        while (n > 0) {
            if (n & 1) arr = arr.concat(pattern);
            n >>= 1, pattern = pattern.concat(pattern);
        }
        return fromArray(arr);
    }


    Elm.Native.List.values = {
        Nil:Nil,
        Cons:Cons,
        cons:F2(Cons),
        toArray:toArray,
        fromArray:fromArray,
        range:range,
        append: F2(append),

        head:head,
        tail:tail,

        map:F2(map),
        foldl:F3(foldl),
        foldr:F3(foldr),

        foldl1:F2(foldl1),
        foldr1:F2(foldr1),
        scanl:F3(scanl),
        scanl1:F2(scanl1),
        filter:F2(filter),
        length:length,
        member:F2(member),

        all:F2(all),
        any:F2(any),
        map2:F3(map2),
        map3:F4(map3),
        map4:F5(map4),
        map5:F6(map5),
        sort:sort,
        sortBy:F2(sortBy),
        sortWith:F2(sortWith),
        take:F2(take),
        drop:F2(drop),
        repeat:F2(repeat)
    };
    return elm.Native.List.values = Elm.Native.List.values;

};

Elm.Native = Elm.Native || {};
Elm.Native.Mouse = {};
Elm.Native.Mouse.make = function(localRuntime) {

    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Mouse = localRuntime.Native.Mouse || {};
    if (localRuntime.Native.Mouse.values) {
        return localRuntime.Native.Mouse.values;
    }

    var Signal = Elm.Signal.make(localRuntime);
    var Utils = Elm.Native.Utils.make(localRuntime);

    var position = Signal.constant(Utils.Tuple2(0,0));
    position.defaultNumberOfKids = 2;

    // do not move x and y into Elm. By setting their default number
    // of kids, it is possible to detatch the mouse listeners if
    // they are not needed.
    function fst(pair) {
        return pair._0;
    }
    function snd(pair) {
        return pair._1;
    }

    var x = A2( Signal.map, fst, position );
    x.defaultNumberOfKids = 0;

    var y = A2( Signal.map, snd, position );
    y.defaultNumberOfKids = 0;

    var isDown = Signal.constant(false);
    var clicks = Signal.constant(Utils.Tuple0);

    var node = localRuntime.isFullscreen()
        ? document
        : localRuntime.node;

    localRuntime.addListener([clicks.id], node, 'click', function click() {
        localRuntime.notify(clicks.id, Utils.Tuple0);
    });
    localRuntime.addListener([isDown.id], node, 'mousedown', function down() {
        localRuntime.notify(isDown.id, true);
    });
    localRuntime.addListener([isDown.id], node, 'mouseup', function up() {
        localRuntime.notify(isDown.id, false);
    });
    localRuntime.addListener([position.id], node, 'mousemove', function move(e) {
        localRuntime.notify(position.id, Utils.getXY(e));
    });

    return localRuntime.Native.Mouse.values = {
        position: position,
        x: x,
        y: y,
        isDown: isDown,
        clicks: clicks
    };
};

Elm.Native.Ports = {};
Elm.Native.Ports.make = function(localRuntime) {
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Ports = localRuntime.Native.Ports || {};
    if (localRuntime.Native.Ports.values) {
        return localRuntime.Native.Ports.values;
    }

    var Signal;

    function incomingSignal(converter) {
        converter.isSignal = true;
        return converter;
    }

    function outgoingSignal(converter) {
        if (!Signal) {
            Signal = Elm.Signal.make(localRuntime);
        }
        return function(signal) {
            var subscribers = []
            function subscribe(handler) {
                subscribers.push(handler);
            }
            function unsubscribe(handler) {
                subscribers.pop(subscribers.indexOf(handler));
            }
            A2( Signal.map, function(value) {
                var val = converter(value);
                var len = subscribers.length;
                for (var i = 0; i < len; ++i) {
                    subscribers[i](val);
                }
            }, signal);
            return { subscribe:subscribe, unsubscribe:unsubscribe };
        }
    }

    function portIn(name, converter) {
        var jsValue = localRuntime.ports.incoming[name];
        if (jsValue === undefined) {
            throw new Error("Initialization Error: port '" + name +
                            "' was not given an input!");
        }
        localRuntime.ports.uses[name] += 1;
        try {
            var elmValue = converter(jsValue);
        } catch(e) {
            throw new Error("Initialization Error on port '" + name + "': \n" + e.message);
        }

        // just return a static value if it is not a signal
        if (!converter.isSignal) {
            return elmValue;
        }

        // create a signal if necessary
        if (!Signal) {
            Signal = Elm.Signal.make(localRuntime);
        }
        var signal = Signal.constant(elmValue);
        function send(jsValue) {
            try {
                var elmValue = converter(jsValue);
            } catch(e) {
                throw new Error("Error sending to port '" + name + "': \n" + e.message);
            }
            setTimeout(function() {
                localRuntime.notify(signal.id, elmValue);
            }, 0);
        }
        localRuntime.ports.outgoing[name] = { send:send };
        return signal;
    }

    function portOut(name, converter, value) {
        try {
            localRuntime.ports.outgoing[name] = converter(value);
        } catch(e) {
            throw new Error("Initialization Error on port '" + name + "': \n" + e.message);
        }
        return value;
    }

    return localRuntime.Native.Ports.values = {
        incomingSignal: incomingSignal,
        outgoingSignal: outgoingSignal,
        portOut: portOut,
        portIn: portIn
    };
};



if (!Elm.fullscreen) {

    (function() {
        'use strict';

        var Display = { FULLSCREEN: 0, COMPONENT: 1, NONE: 2 };

        Elm.fullscreen = function(module, ports) {
            var container = document.createElement('div');
            document.body.appendChild(container);
            return init(Display.FULLSCREEN, container, module, ports || {});
        };

        Elm.embed = function(module, container, ports) {
            var tag = container.tagName;
            if (tag !== 'DIV') {
                throw new Error('Elm.node must be given a DIV, not a ' + tag + '.');
            }
            return init(Display.COMPONENT, container, module, ports || {});
        };

        Elm.worker = function(module, ports) {
            return init(Display.NONE, {}, module, ports || {});
        };

        function init(display, container, module, ports, moduleToReplace) {
            // defining state needed for an instance of the Elm RTS
            var inputs = [];

            /* OFFSET
             * Elm's time traveling debugger lets you pause time. This means
             * "now" may be shifted a bit into the past. By wrapping Date.now()
             * we can manage this.
             */
            var timer = {
                now: function() {
                    return Date.now();
                }
            };

            var updateInProgress = false;
            function notify(id, v) {
                if (updateInProgress) {
                    throw new Error(
                        'The notify function has been called synchronously!\n' +
                        'This can lead to frames being dropped.\n' +
                        'Definitely report this to <https://github.com/elm-lang/Elm/issues>\n');
                }
                updateInProgress = true;
                var timestep = timer.now();
                for (var i = inputs.length; i--; ) {
                    inputs[i].recv(timestep, id, v);
                }
                updateInProgress = false;
            }
            function setTimeout(func, delay) {
                window.setTimeout(func, delay);
            }

            var listeners = [];
            function addListener(relevantInputs, domNode, eventName, func) {
                domNode.addEventListener(eventName, func);
                var listener = {
                    relevantInputs: relevantInputs,
                    domNode: domNode,
                    eventName: eventName,
                    func: func
                };
                listeners.push(listener);
            }

            var portUses = {}
            for (var key in ports) {
                portUses[key] = 0;
            }
            // create the actual RTS. Any impure modules will attach themselves to this
            // object. This permits many Elm programs to be embedded per document.
            var elm = {
                notify: notify,
                setTimeout: setTimeout,
                node: container,
                addListener: addListener,
                inputs: inputs,
                timer: timer,
                ports: { incoming:ports, outgoing:{}, uses:portUses },

                isFullscreen: function() { return display === Display.FULLSCREEN; },
                isEmbed: function() { return display === Display.COMPONENT; },
                isWorker: function() { return display === Display.NONE; }
            };

            function swap(newModule) {
                removeListeners(listeners);
                var div = document.createElement('div');
                var newElm = init(display, div, newModule, ports, elm);
                inputs = [];
                // elm.swap = newElm.swap;
                return newElm;
            }

            function dispose() {
                removeListeners(listeners);
                inputs = [];
            }

            var Module = {};
            try {
                Module = module.make(elm);
                checkPorts(elm);
            }
            catch (error) {
                if (typeof container.appendChild == 'undefined') {
                    console.log(error.message);
                } else {
                    container.appendChild(errorNode(error.message));
                }
                throw error;
            }
            inputs = filterDeadInputs(inputs);
            filterListeners(inputs, listeners);
            addReceivers(elm.ports.outgoing);
            if (display !== Display.NONE) {
                var graphicsNode = initGraphics(elm, Module);
            }
            if (typeof moduleToReplace !== 'undefined') {
                hotSwap(moduleToReplace, elm);

                // rerender scene if graphics are enabled.
                if (typeof graphicsNode !== 'undefined') {
                    graphicsNode.recv(0, true, 0);
                }
            }

            return {
                swap:swap,
                ports:elm.ports.outgoing,
                dispose:dispose
            };
        };

        function checkPorts(elm) {
            var portUses = elm.ports.uses;
            for (var key in portUses) {
                var uses = portUses[key]
                if (uses === 0) {
                    throw new Error(
                        "Initialization Error: provided port '" + key +
                        "' to a module that does not take it as in input.\n" +
                        "Remove '" + key + "' from the module initialization code.");
                } else if (uses > 1) {
                    throw new Error(
                        "Initialization Error: port '" + key +
                        "' has been declared multiple times in the Elm code.\n" +
                        "Remove declarations until there is exactly one.");
                }
            }
        }

        function errorNode(message) {
            var code = document.createElement('code');

            var lines = message.split('\n');
            code.appendChild(document.createTextNode(lines[0]));
            code.appendChild(document.createElement('br'));
            code.appendChild(document.createElement('br'));
            for (var i = 1; i < lines.length; ++i) {
                code.appendChild(document.createTextNode('\u00A0 \u00A0 ' + lines[i]));
                code.appendChild(document.createElement('br'));
            }
            code.appendChild(document.createElement('br'));
            code.appendChild(document.createTextNode("Open the developer console for more details."));
            return code;
        }


        //// FILTER SIGNALS ////

        // TODO: move this code into the signal module and create a function
        // Signal.initializeGraph that actually instantiates everything.

        function filterListeners(inputs, listeners) {
            loop:
            for (var i = listeners.length; i--; ) {
                var listener = listeners[i];
                for (var j = inputs.length; j--; ) {
                    if (listener.relevantInputs.indexOf(inputs[j].id) >= 0) {
                        continue loop;
                    }
                }
                listener.domNode.removeEventListener(listener.eventName, listener.func);
            }
        }

        function removeListeners(listeners) {
            for (var i = listeners.length; i--; ) {
                var listener = listeners[i];
                listener.domNode.removeEventListener(listener.eventName, listener.func);
            }
        }

        // add receivers for built-in ports if they are defined
        function addReceivers(ports) {
            if ('log' in ports) {
                ports.log.subscribe(function(v) { console.log(v) });
            }
            if ('stdout' in ports) {
                var process = process || {};
                var handler = process.stdout
                    ? function(v) { process.stdout.write(v); }
                    : function(v) { console.log(v); };
                ports.stdout.subscribe(handler);
            }
            if ('stderr' in ports) {
                var process = process || {};
                var handler = process.stderr
                    ? function(v) { process.stderr.write(v); }
                    : function(v) { console.log('Error:' + v); };
                ports.stderr.subscribe(handler);
            }
            if ('title' in ports) {
                if (typeof ports.title === 'string') {
                    document.title = ports.title;
                } else {
                    ports.title.subscribe(function(v) { document.title = v; });
                }
            }
            if ('redirect' in ports) {
                ports.redirect.subscribe(function(v) {
                    if (v.length > 0) window.location = v;
                });
            }
            if ('favicon' in ports) {
                if (typeof ports.favicon === 'string') {
                    changeFavicon(ports.favicon);
                } else {
                    ports.favicon.subscribe(changeFavicon);
                }
            }
            function changeFavicon(src) {
                var link = document.createElement('link');
                var oldLink = document.getElementById('elm-favicon');
                link.id = 'elm-favicon';
                link.rel = 'shortcut icon';
                link.href = src;
                if (oldLink) {
                    document.head.removeChild(oldLink);
                }
                document.head.appendChild(link);
            }
        }


        function filterDeadInputs(inputs) {
            var temp = [];
            for (var i = inputs.length; i--; ) {
                if (isAlive(inputs[i])) temp.push(inputs[i]);
            }
            return temp;
        }


        function isAlive(input) {
            if (!('defaultNumberOfKids' in input)) return true;
            var len = input.kids.length;
            if (len === 0) return false;
            if (len > input.defaultNumberOfKids) return true;
            var alive = false;
            for (var i = len; i--; ) {
                alive = alive || isAlive(input.kids[i]);
            }
            return alive;
        }


        ////  RENDERING  ////

        function initGraphics(elm, Module) {
            if (!('main' in Module)) {
                throw new Error("'main' is missing! What do I display?!");
            }

            var signalGraph = Module.main;

            // make sure the signal graph is actually a signal & extract the visual model
            var Signal = Elm.Signal.make(elm);
            if (!('recv' in signalGraph)) {
                signalGraph = Signal.constant(signalGraph);
            }
            var initialScene = signalGraph.value;

            // Figure out what the render functions should be
            var render;
            var update;
            if (initialScene.props) {
                var Element = Elm.Native.Graphics.Element.make(elm);
                render = Element.render;
                update = Element.updateAndReplace;
            } else {
                var VirtualDom = Elm.Native.VirtualDom.make(elm);
                render = VirtualDom.render;
                update = VirtualDom.updateAndReplace;
            }

            // Add the initialScene to the DOM
            var container = elm.node;
            var node = render(initialScene);
            while (container.firstChild) {
                container.removeChild(container.firstChild);
            }
            container.appendChild(node);

            var _requestAnimationFrame =
                typeof requestAnimationFrame !== 'undefined'
                    ? requestAnimationFrame
                    : function(cb) { setTimeout(cb, 1000/60); }
                    ;

            // domUpdate is called whenever the main Signal changes.
            //
            // domUpdate and drawCallback implement a small state machine in order
            // to schedule only 1 draw per animation frame. This enforces that
            // once draw has been called, it will not be called again until the
            // next frame.
            //
            // drawCallback is scheduled whenever
            // 1. The state transitions from PENDING_REQUEST to EXTRA_REQUEST, or
            // 2. The state transitions from NO_REQUEST to PENDING_REQUEST
            //
            // Invariants:
            // 1. In the NO_REQUEST state, there is never a scheduled drawCallback.
            // 2. In the PENDING_REQUEST and EXTRA_REQUEST states, there is always exactly 1
            //    scheduled drawCallback.
            var NO_REQUEST = 0;
            var PENDING_REQUEST = 1;
            var EXTRA_REQUEST = 2;
            var state = NO_REQUEST;
            var savedScene = initialScene;
            var scheduledScene = initialScene;

            function domUpdate(newScene) {
                scheduledScene = newScene;

                switch (state) {
                    case NO_REQUEST:
                        _requestAnimationFrame(drawCallback);
                        state = PENDING_REQUEST;
                        return;
                    case PENDING_REQUEST:
                        state = PENDING_REQUEST;
                        return;
                    case EXTRA_REQUEST:
                        state = PENDING_REQUEST;
                        return;
                }
            }

            function drawCallback() {
                switch (state) {
                    case NO_REQUEST:
                        // This state should not be possible. How can there be no
                        // request, yet somehow we are actively fulfilling a
                        // request?
                        throw new Error(
                            "Unexpected draw callback.\n" +
                            "Please report this to <https://github.com/elm-lang/core/issues>."
                        );

                    case PENDING_REQUEST:
                        // At this point, we do not *know* that another frame is
                        // needed, but we make an extra request to rAF just in
                        // case. It's possible to drop a frame if rAF is called
                        // too late, so we just do it preemptively.
                        _requestAnimationFrame(drawCallback);
                        state = EXTRA_REQUEST;

                        // There's also stuff we definitely need to draw.
                        draw();
                        return;

                    case EXTRA_REQUEST:
                        // Turns out the extra request was not needed, so we will
                        // stop calling rAF. No reason to call it all the time if
                        // no one needs it.
                        state = NO_REQUEST;
                        return;
                }
            }

            function draw() {
                update(elm.node.firstChild, savedScene, scheduledScene);
                if (elm.Native.Window) {
                    elm.Native.Window.values.resizeIfNeeded();
                }
                savedScene = scheduledScene;
            }

            var renderer = A2(Signal.map, domUpdate, signalGraph);

            // must check for resize after 'renderer' is created so
            // that changes show up.
            if (elm.Native.Window) {
                elm.Native.Window.values.resizeIfNeeded();
            }

            return renderer;
        }

        //// HOT SWAPPING ////

        // Returns boolean indicating if the swap was successful.
        // Requires that the two signal graphs have exactly the same
        // structure.
        function hotSwap(from, to) {
            function similar(nodeOld,nodeNew) {
                var idOkay = nodeOld.id === nodeNew.id;
                var lengthOkay = nodeOld.kids.length === nodeNew.kids.length;
                return idOkay && lengthOkay;
            }
            function swap(nodeOld,nodeNew) {
                nodeNew.value = nodeOld.value;
                return true;
            }
            var canSwap = depthFirstTraversals(similar, from.inputs, to.inputs);
            if (canSwap) {
                depthFirstTraversals(swap, from.inputs, to.inputs);
            }
            from.node.parentNode.replaceChild(to.node, from.node);

            return canSwap;
        }

        // Returns false if the node operation f ever fails.
        function depthFirstTraversals(f, queueOld, queueNew) {
            if (queueOld.length !== queueNew.length) return false;
            queueOld = queueOld.slice(0);
            queueNew = queueNew.slice(0);

            var seen = [];
            while (queueOld.length > 0 && queueNew.length > 0) {
                var nodeOld = queueOld.pop();
                var nodeNew = queueNew.pop();
                if (seen.indexOf(nodeOld.id) < 0) {
                    if (!f(nodeOld, nodeNew)) return false;
                    queueOld = queueOld.concat(nodeOld.kids);
                    queueNew = queueNew.concat(nodeNew.kids);
                    seen.push(nodeOld.id);
                }
            }
            return true;
        }
    }());

    function F2(fun) {
        function wrapper(a) { return function(b) { return fun(a,b) } }
        wrapper.arity = 2;
        wrapper.func = fun;
        return wrapper;
    }

    function F3(fun) {
        function wrapper(a) {
            return function(b) { return function(c) { return fun(a,b,c) }}
        }
        wrapper.arity = 3;
        wrapper.func = fun;
        return wrapper;
    }

    function F4(fun) {
        function wrapper(a) { return function(b) { return function(c) {
            return function(d) { return fun(a,b,c,d) }}}
        }
        wrapper.arity = 4;
        wrapper.func = fun;
        return wrapper;
    }

    function F5(fun) {
        function wrapper(a) { return function(b) { return function(c) {
            return function(d) { return function(e) { return fun(a,b,c,d,e) }}}}
        }
        wrapper.arity = 5;
        wrapper.func = fun;
        return wrapper;
    }

    function F6(fun) {
        function wrapper(a) { return function(b) { return function(c) {
            return function(d) { return function(e) { return function(f) {
            return fun(a,b,c,d,e,f) }}}}}
        }
        wrapper.arity = 6;
        wrapper.func = fun;
        return wrapper;
    }

    function F7(fun) {
        function wrapper(a) { return function(b) { return function(c) {
            return function(d) { return function(e) { return function(f) {
            return function(g) { return fun(a,b,c,d,e,f,g) }}}}}}
        }
        wrapper.arity = 7;
        wrapper.func = fun;
        return wrapper;
    }

    function F8(fun) {
        function wrapper(a) { return function(b) { return function(c) {
            return function(d) { return function(e) { return function(f) {
            return function(g) { return function(h) {
            return fun(a,b,c,d,e,f,g,h)}}}}}}}
        }
        wrapper.arity = 8;
        wrapper.func = fun;
        return wrapper;
    }

    function F9(fun) {
        function wrapper(a) { return function(b) { return function(c) {
            return function(d) { return function(e) { return function(f) {
            return function(g) { return function(h) { return function(i) {
            return fun(a,b,c,d,e,f,g,h,i) }}}}}}}}
        }
        wrapper.arity = 9;
        wrapper.func = fun;
        return wrapper;
    }

    function A2(fun,a,b) {
        return fun.arity === 2
            ? fun.func(a,b)
            : fun(a)(b);
    }
    function A3(fun,a,b,c) {
        return fun.arity === 3
            ? fun.func(a,b,c)
            : fun(a)(b)(c);
    }
    function A4(fun,a,b,c,d) {
        return fun.arity === 4
            ? fun.func(a,b,c,d)
            : fun(a)(b)(c)(d);
    }
    function A5(fun,a,b,c,d,e) {
        return fun.arity === 5
            ? fun.func(a,b,c,d,e)
            : fun(a)(b)(c)(d)(e);
    }
    function A6(fun,a,b,c,d,e,f) {
        return fun.arity === 6
            ? fun.func(a,b,c,d,e,f)
            : fun(a)(b)(c)(d)(e)(f);
    }
    function A7(fun,a,b,c,d,e,f,g) {
        return fun.arity === 7
            ? fun.func(a,b,c,d,e,f,g)
            : fun(a)(b)(c)(d)(e)(f)(g);
    }
    function A8(fun,a,b,c,d,e,f,g,h) {
        return fun.arity === 8
            ? fun.func(a,b,c,d,e,f,g,h)
            : fun(a)(b)(c)(d)(e)(f)(g)(h);
    }
    function A9(fun,a,b,c,d,e,f,g,h,i) {
        return fun.arity === 9
            ? fun.func(a,b,c,d,e,f,g,h,i)
            : fun(a)(b)(c)(d)(e)(f)(g)(h)(i);
    }
}
Elm.Native.Show = {};
Elm.Native.Show.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.Show = elm.Native.Show || {};
    if (elm.Native.Show.values)
    {
        return elm.Native.Show.values;
    }

    var _Array;
    var Dict;
    var List;
    var Utils = Elm.Native.Utils.make(elm);

    var toString = function(v) {
        var type = typeof v;
        if (type === "function") {
            var name = v.func ? v.func.name : v.name;
            return '<function' + (name === '' ? '' : ': ') + name + '>';
        }
        else if (type === "boolean") {
            return v ? "True" : "False";
        }
        else if (type === "number") {
            return v + "";
        }
        else if ((v instanceof String) && v.isChar) {
            return "'" + addSlashes(v, true) + "'";
        }
        else if (type === "string") {
            return '"' + addSlashes(v, false) + '"';
        }
        else if (type === "object" && '_' in v && probablyPublic(v)) {
            var output = [];
            for (var k in v._) {
                for (var i = v._[k].length; i--; ) {
                    output.push(k + " = " + toString(v._[k][i]));
                }
            }
            for (var k in v) {
                if (k === '_') continue;
                output.push(k + " = " + toString(v[k]));
            }
            if (output.length === 0) {
                return "{}";
            }
            return "{ " + output.join(", ") + " }";
        }
        else if (type === "object" && 'ctor' in v) {
            if (v.ctor.substring(0,6) === "_Tuple") {
                var output = [];
                for (var k in v) {
                    if (k === 'ctor') continue;
                    output.push(toString(v[k]));
                }
                return "(" + output.join(",") + ")";
            }
            else if (v.ctor === "_Array") {
                if (!_Array) {
                    _Array = Elm.Array.make(elm);
                }
                var list = _Array.toList(v);
                return "Array.fromList " + toString(list);
            }
            else if (v.ctor === "::") {
                var output = '[' + toString(v._0);
                v = v._1;
                while (v.ctor === "::") {
                    output += "," + toString(v._0);
                    v = v._1;
                }
                return output + ']';
            }
            else if (v.ctor === "[]") {
                return "[]";
            }
            else if (v.ctor === "RBNode" || v.ctor === "RBEmpty") {
                if (!Dict) {
                    Dict = Elm.Dict.make(elm);
                }
                if (!List) {
                    List = Elm.List.make(elm);
                }
                var list = Dict.toList(v);
                var name = "Dict";
                if (list.ctor === "::" && list._0._1.ctor === "_Tuple0") {
                    name = "Set";
                    list = A2(List.map, function(x){return x._0}, list);
                }
                return name + ".fromList " + toString(list);
            }
            else {
                var output = "";
                for (var i in v) {
                    if (i === 'ctor') continue;
                    var str = toString(v[i]);
                    var parenless = str[0] === '{' || str[0] === '<' || str.indexOf(' ') < 0;
                    output += ' ' + (parenless ? str : '(' + str + ')');
                }
                return v.ctor + output;
            }
        }
        if (type === 'object' && 'recv' in v) {
            return '<signal>';
        }
        return "<internal structure>";
    };

    function addSlashes(str, isChar) {
        var s = str.replace(/\\/g, '\\\\')
                  .replace(/\n/g, '\\n')
                  .replace(/\t/g, '\\t')
                  .replace(/\r/g, '\\r')
                  .replace(/\v/g, '\\v')
                  .replace(/\0/g, '\\0');
        if (isChar) {
            return s.replace(/\'/g, "\\'")
        } else {
            return s.replace(/\"/g, '\\"');
        }
    }

    function probablyPublic(v) {
        var keys = Object.keys(v);
        var len = keys.length;
        if (len === 3
            && 'props' in v
            && 'element' in v)
        {
            return false;
        }
        else if (len === 5
            && 'horizontal' in v
            && 'vertical' in v
            && 'x' in v
            && 'y' in v)
        {
            return false;
        }
        else if (len === 7
            && 'theta' in v
            && 'scale' in v
            && 'x' in v
            && 'y' in v
            && 'alpha' in v
            && 'form' in v)
        {
            return false;
        }
        return true;
    }

    return elm.Native.Show.values = {
        toString: toString
    };
};


Elm.Native.Signal = {};
Elm.Native.Signal.make = function(localRuntime) {

  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.Signal = localRuntime.Native.Signal || {};
  if (localRuntime.Native.Signal.values) {
      return localRuntime.Native.Signal.values;
  }

  var Utils = Elm.Native.Utils.make(localRuntime);

  function broadcastToKids(node, timestep, changed) {
    var kids = node.kids;
    for (var i = kids.length; i--; ) {
      kids[i].recv(timestep, changed, node.id);
    }
  }

  function Input(base) {
    this.id = Utils.guid();
    this.value = base;
    this.kids = [];
    this.defaultNumberOfKids = 0;
    this.recv = function(timestep, eid, v) {
      var changed = eid === this.id;
      if (changed) {
        this.value = v;
      }
      broadcastToKids(this, timestep, changed);
      return changed;
    };
    localRuntime.inputs.push(this);
  }

  function LiftN(update, args) {
    this.id = Utils.guid();
    this.value = update();
    this.kids = [];

    var n = args.length;
    var count = 0;
    var isChanged = false;

    this.recv = function(timestep, changed, parentID) {
      ++count;
      if (changed) { isChanged = true; }
      if (count == n) {
        if (isChanged) { this.value = update(); }
        broadcastToKids(this, timestep, isChanged);
        isChanged = false;
        count = 0;
      }
    };
    for (var i = n; i--; ) { args[i].kids.push(this); }
  }

  function map(func, a) {
    function update() { return func(a.value); }
    return new LiftN(update, [a]);
  }
  function map2(func, a, b) {
    function update() { return A2( func, a.value, b.value ); }
    return new LiftN(update, [a,b]);
  }
  function map3(func, a, b, c) {
    function update() { return A3( func, a.value, b.value, c.value ); }
    return new LiftN(update, [a,b,c]);
  }
  function map4(func, a, b, c, d) {
    function update() { return A4( func, a.value, b.value, c.value, d.value ); }
    return new LiftN(update, [a,b,c,d]);
  }
  function map5(func, a, b, c, d, e) {
    function update() { return A5( func, a.value, b.value, c.value, d.value, e.value ); }
    return new LiftN(update, [a,b,c,d,e]);
  }

  function Foldp(step, state, input) {
    this.id = Utils.guid();
    this.value = state;
    this.kids = [];

    this.recv = function(timestep, changed, parentID) {
      if (changed) {
          this.value = A2( step, input.value, this.value );
      }
      broadcastToKids(this, timestep, changed);
    };
    input.kids.push(this);
  }

  function foldp(step, state, input) {
      return new Foldp(step, state, input);
  }

  function DropIf(pred,base,input) {
    this.id = Utils.guid();
    this.value = pred(input.value) ? base : input.value;
    this.kids = [];
    this.recv = function(timestep, changed, parentID) {
      var chng = changed && !pred(input.value);
      if (chng) { this.value = input.value; }
      broadcastToKids(this, timestep, chng);
    };
    input.kids.push(this);
  }

  function DropRepeats(input) {
    this.id = Utils.guid();
    this.value = input.value;
    this.kids = [];
    this.recv = function(timestep, changed, parentID) {
      var chng = changed && !Utils.eq(this.value,input.value);
      if (chng) { this.value = input.value; }
      broadcastToKids(this, timestep, chng);
    };
    input.kids.push(this);
  }

  function timestamp(a) {
    function update() { return Utils.Tuple2(localRuntime.timer.now(), a.value); }
    return new LiftN(update, [a]);
  }

  function SampleOn(s1,s2) {
    this.id = Utils.guid();
    this.value = s2.value;
    this.kids = [];

    var count = 0;
    var isChanged = false;

    this.recv = function(timestep, changed, parentID) {
      if (parentID === s1.id) isChanged = changed;
      ++count;
      if (count == 2) {
        if (isChanged) { this.value = s2.value; }
        broadcastToKids(this, timestep, isChanged);
        count = 0;
        isChanged = false;
      }
    };
    s1.kids.push(this);
    s2.kids.push(this);
  }

  function sampleOn(s1,s2) { return new SampleOn(s1,s2); }

  function delay(t,s) {
      var delayed = new Input(s.value);
      var firstEvent = true;
      function update(v) {
        if (firstEvent) {
            firstEvent = false; return;
        }
        setTimeout(function() {
            localRuntime.notify(delayed.id, v);
        }, t);
      }
      function first(a,b) { return a; }
      return new SampleOn(delayed, map2(F2(first), delayed, map(update,s)));
  }

  function Merge(s1,s2) {
      this.id = Utils.guid();
      this.value = s1.value;
      this.kids = [];

      var next = null;
      var count = 0;
      var isChanged = false;

      this.recv = function(timestep, changed, parentID) {
        ++count;
        if (changed) {
            isChanged = true;
            if (parentID == s2.id && next === null) { next = s2.value; }
            if (parentID == s1.id) { next = s1.value; }
        }

        if (count == 2) {
            if (isChanged) { this.value = next; next = null; }
            broadcastToKids(this, timestep, isChanged);
            isChanged = false;
            count = 0;
        }
      };
      s1.kids.push(this);
      s2.kids.push(this);
  }

  function merge(s1,s2) {
      return new Merge(s1,s2);
  }


    // SIGNAL INPUTS

    function input(initialValue) {
        return new Input(initialValue);
    }

    function send(input, value) {
        return function() {
            localRuntime.notify(input.id, value);
        };
    }

    function subscribe(input) {
        return input;
    }


  return localRuntime.Native.Signal.values = {
    constant : function(v) { return new Input(v); },
    map  : F2(map ),
    map2 : F3(map2),
    map3 : F4(map3),
    map4 : F5(map4),
    map5 : F6(map5),
    foldp : F3(foldp),
    delay : F2(delay),
    merge : F2(merge),
    keepIf : F3(function(pred,base,sig) {
      return new DropIf(function(x) {return !pred(x);},base,sig); }),
    dropIf : F3(function(pred,base,sig) { return new DropIf(pred,base,sig); }),
    dropRepeats : function(s) { return new DropRepeats(s);},
    sampleOn : F2(sampleOn),
    timestamp : timestamp,
    input: input,
    send: F2(send),
    subscribe: subscribe
  };
};

Elm.Native.String = {};
Elm.Native.String.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.String = elm.Native.String || {};
    if (elm.Native.String.values) return elm.Native.String.values;
    if ('values' in Elm.Native.String) {
        return elm.Native.String.values = Elm.Native.String.values;
    }

    var Char = Elm.Char.make(elm);
    var List = Elm.Native.List.make(elm);
    var Maybe = Elm.Maybe.make(elm);
    var Result = Elm.Result.make(elm);
    var Utils = Elm.Native.Utils.make(elm);

    function isEmpty(str) {
        return str.length === 0;
    }
    function cons(chr,str) {
        return chr + str;
    }
    function uncons(str) {
        var hd;
        return (hd = str[0])
            ? Maybe.Just(Utils.Tuple2(Utils.chr(hd), str.slice(1)))
            : Maybe.Nothing;
    }
    function append(a,b) {
        return a + b;
    }
    function concat(strs) {
        return List.toArray(strs).join('');
    }
    function length(str) {
        return str.length;
    }
    function map(f,str) {
        var out = str.split('');
        for (var i = out.length; i--; ) {
            out[i] = f(Utils.chr(out[i]));
        }
        return out.join('');
    }
    function filter(pred,str) {
        return str.split('').map(Utils.chr).filter(pred).join('');
    }
    function reverse(str) {
        return str.split('').reverse().join('');
    }
    function foldl(f,b,str) {
        var len = str.length;
        for (var i = 0; i < len; ++i) {
            b = A2(f, Utils.chr(str[i]), b);
        }
        return b;
    }
    function foldr(f,b,str) {
        for (var i = str.length; i--; ) {
            b = A2(f, Utils.chr(str[i]), b);
        }
        return b;
    }

    function split(sep, str) {
        return List.fromArray(str.split(sep));
    }
    function join(sep, strs) {
        return List.toArray(strs).join(sep);
    }
    function repeat(n, str) {
        var result = '';
        while (n > 0) {
            if (n & 1) result += str;
            n >>= 1, str += str;
        }
        return result;
    }

    function slice(start, end, str) {
        return str.slice(start,end);
    }
    function left(n, str) {
        return n < 1 ? "" : str.slice(0,n);
    }
    function right(n, str) {
        return n < 1 ? "" : str.slice(-n);
    }
    function dropLeft(n, str) {
        return n < 1 ? str : str.slice(n);
    }
    function dropRight(n, str) {
        return n < 1 ? str : str.slice(0,-n);
    }

    function pad(n,chr,str) {
        var half = (n - str.length) / 2;
        return repeat(Math.ceil(half),chr) + str + repeat(half|0,chr);
    }
    function padRight(n,chr,str) {
        return str + repeat(n - str.length, chr);
    }
    function padLeft(n,chr,str) {
        return repeat(n - str.length, chr) + str;
    }

    function trim(str) {
        return str.trim();
    }
    function trimLeft(str) {
        return str.trimLeft();
    }
    function trimRight(str) {
        return str.trimRight();
    }

    function words(str) {
        return List.fromArray(str.trim().split(/\s+/g));
    }
    function lines(str) {
        return List.fromArray(str.split(/\r\n|\r|\n/g));
    }

    function toUpper(str) {
        return str.toUpperCase();
    }
    function toLower(str) {
        return str.toLowerCase();
    }

    function any(pred, str) {
        for (var i = str.length; i--; ) {
            if (pred(Utils.chr(str[i]))) return true;
        }
        return false;
    }
    function all(pred, str) {
        for (var i = str.length; i--; ) {
            if (!pred(Utils.chr(str[i]))) return false;
        }
        return true;
    }

    function contains(sub, str) {
        return str.indexOf(sub) > -1;
    }
    function startsWith(sub, str) {
        return str.indexOf(sub) === 0;
    }
    function endsWith(sub, str) {
        return str.length >= sub.length &&
               str.lastIndexOf(sub) === str.length - sub.length;
    }
    function indexes(sub, str) {
        var subLen = sub.length;
        var i = 0;
        var is = [];
        while ((i = str.indexOf(sub, i)) > -1) {
            is.push(i);
            i = i + subLen;
        }
        return List.fromArray(is);
    }

    function toInt(s) {
        var len = s.length;
        if (len === 0) {
            return Result.Err("could not convert string '" + s + "' to an Int" );
        }
        var start = 0;
        if (s[0] == '-') {
            if (len === 1) {
                return Result.Err("could not convert string '" + s + "' to an Int" );
            }
            start = 1;
        }
        for (var i = start; i < len; ++i) {
            if (!Char.isDigit(s[i])) {
                return Result.Err("could not convert string '" + s + "' to an Int" );
            }
        }
        return Result.Ok(parseInt(s, 10));
    }

    function toFloat(s) {
        var len = s.length;
        if (len === 0) {
            return Result.Err("could not convert string '" + s + "' to a Float" );
        }
        var start = 0;
        if (s[0] == '-') {
            if (len === 1) {
                return Result.Err("could not convert string '" + s + "' to a Float" );
            }
            start = 1;
        }
        var dotCount = 0;
        for (var i = start; i < len; ++i) {
            if (Char.isDigit(s[i])) {
                continue;
            }
            if (s[i] === '.') {
                dotCount += 1;
                if (dotCount <= 1) {
                    continue;
                }
            }
            return Result.Err("could not convert string '" + s + "' to a Float" );
        }
        return Result.Ok(parseFloat(s));
    }

    function toList(str) {
        return List.fromArray(str.split('').map(Utils.chr));
    }
    function fromList(chars) {
        return List.toArray(chars).join('');
    }

    return Elm.Native.String.values = {
        isEmpty: isEmpty,
        cons: F2(cons),
        uncons: uncons,
        append: F2(append),
        concat: concat,
        length: length,
        map: F2(map),
        filter: F2(filter),
        reverse: reverse,
        foldl: F3(foldl),
        foldr: F3(foldr),

        split: F2(split),
        join: F2(join),
        repeat: F2(repeat),

        slice: F3(slice),
        left: F2(left),
        right: F2(right),
        dropLeft: F2(dropLeft),
        dropRight: F2(dropRight),

        pad: F3(pad),
        padLeft: F3(padLeft),
        padRight: F3(padRight),

        trim: trim,
        trimLeft: trimLeft,
        trimRight: trimRight,

        words: words,
        lines: lines,

        toUpper: toUpper,
        toLower: toLower,

        any: F2(any),
        all: F2(all),

        contains: F2(contains),
        startsWith: F2(startsWith),
        endsWith: F2(endsWith),
        indexes: F2(indexes),

        toInt: toInt,
        toFloat: toFloat,
        toList: toList,
        fromList: fromList
    };
};

Elm.Native.Text = {};
Elm.Native.Text.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.Text = elm.Native.Text || {};
    if (elm.Native.Text.values) return elm.Native.Text.values;

    var toCss = Elm.Native.Color.make(elm).toCss;
    var Element = Elm.Graphics.Element.make(elm);
    var NativeElement = Elm.Native.Graphics.Element.make(elm);
    var List = Elm.Native.List.make(elm);
    var Utils = Elm.Native.Utils.make(elm);

    function makeSpaces(s) {
        if (s.length == 0) { return s; }
        var arr = s.split('');
        if (arr[0] == ' ') { arr[0] = "&nbsp;" }      
        for (var i = arr.length; --i; ) {
            if (arr[i][0] == ' ' && arr[i-1] == ' ') {
                arr[i-1] = arr[i-1] + arr[i];
                arr[i] = '';
            }
        }
        for (var i = arr.length; i--; ) {
            if (arr[i].length > 1 && arr[i][0] == ' ') {
                var spaces = arr[i].split('');
                for (var j = spaces.length - 2; j >= 0; j -= 2) {
                    spaces[j] = '&nbsp;';
                }
                arr[i] = spaces.join('');
            }
        }
        arr = arr.join('');
        if (arr[arr.length-1] === " ") {
            return arr.slice(0,-1) + '&nbsp;';
        }
        return arr;
    }

    function properEscape(str) {
        if (str.length == 0) return str;
        str = str //.replace(/&/g,  "&#38;")
            .replace(/"/g,  '&#34;')
            .replace(/'/g,  "&#39;")
            .replace(/</g,  "&#60;")
            .replace(/>/g,  "&#62;")
            .replace(/\n/g, "<br/>");
        var arr = str.split('<br/>');
        for (var i = arr.length; i--; ) {
            arr[i] = makeSpaces(arr[i]);
        }
        return arr.join('<br/>');
    }

    function fromString(str) {
        return Utils.txt(properEscape(str));
    }

    function append(xs, ys) {
        return Utils.txt(Utils.makeText(xs) + Utils.makeText(ys));
    }

    // conversions from Elm values to CSS
    function toTypefaces(list) {
        var typefaces = List.toArray(list);
        for (var i = typefaces.length; i--; ) {
            var typeface = typefaces[i];
            if (typeface.indexOf(' ') > -1) {
                typefaces[i] = "'" + typeface + "'";
            }
        }
        return typefaces.join(',');
    }
    function toLine(line) {
        var ctor = line.ctor;
        return ctor === 'Under' ? 'underline' :
               ctor === 'Over'  ? 'overline'  : 'line-through';
    }

    // setting styles of Text
    function style(style, text) {
        var newText = '<span style="color:' + toCss(style.color) + ';'
        if (style.typeface.ctor !== '[]') {
            newText += 'font-family:' + toTypefaces(style.typeface) + ';'
        }
        if (style.height.ctor !== "Nothing") {
            newText += 'font-size:' + style.height._0 + 'px;';
        }
        if (style.bold) {
            newText += 'font-weight:bold;';
        }
        if (style.italic) {
            newText += 'font-style:italic;';
        }
        if (style.line.ctor !== 'Nothing') {
            newText += 'text-decoration:' + toLine(style.line._0) + ';';
        }
        newText += '">' + Utils.makeText(text) + '</span>'
        return Utils.txt(newText);
    }
    function height(px, text) {
        return { style: 'font-size:' + px + 'px;', text:text }
    }
    function typeface(names, text) {
        return { style: 'font-family:' + toTypefaces(names) + ';', text:text }
    }
    function monospace(text) {
        return { style: 'font-family:monospace;', text:text }
    }
    function italic(text) {
        return { style: 'font-style:italic;', text:text }
    }
    function bold(text) {
        return { style: 'font-weight:bold;', text:text }
    }
    function link(href, text) {
        return { href: fromString(href), text:text };
    }
    function line(line, text) {
        return { style: 'text-decoration:' + toLine(line) + ';', text:text };
    }

    function color(color, text) {
        return { style: 'color:' + toCss(color) + ';', text:text };
    }

    function block(align) {
        return function(text) {
            var raw = {
                ctor :'RawHtml',
                html : Utils.makeText(text),
                align: align
            };
            var pos = A2(NativeElement.htmlHeight, 0, raw);
            return A3(Element.newElement, pos._0, pos._1, raw);
        }
    }

    function markdown(text) {
        var raw = {
            ctor:'RawHtml',
            html: text,
            align: null
        };
        var pos = A2(NativeElement.htmlHeight, 0, raw);
        return A3(Element.newElement, pos._0, pos._1, raw);
    }

    return elm.Native.Text.values = {
        fromString: fromString,
        append: F2(append),

        height : F2(height),
        italic : italic,
        bold : bold,
        line : F2(line),
        monospace : monospace,
        typeface : F2(typeface),
        color : F2(color),
        link : F2(link),
        style : F2(style),

        leftAligned  : block('left'),
        rightAligned : block('right'),
        centered     : block('center'),
        justified    : block('justify'),
        markdown     : markdown,

        toTypefaces:toTypefaces,
        toLine:toLine
    };
};

Elm.Native.Transform2D = {};
Elm.Native.Transform2D.make = function(elm) {

 elm.Native = elm.Native || {};
 elm.Native.Transform2D = elm.Native.Transform2D || {};
 if (elm.Native.Transform2D.values) return elm.Native.Transform2D.values;

 var A;
 if (typeof Float32Array === 'undefined') {
     A = function(arr) {
         this.length = arr.length;
         this[0] = arr[0];
         this[1] = arr[1];
         this[2] = arr[2];
         this[3] = arr[3];
         this[4] = arr[4];
         this[5] = arr[5];
     };
 } else {
     A = Float32Array;
 }

 // layout of matrix in an array is
 //
 //   | m11 m12 dx |
 //   | m21 m22 dy |
 //   |  0   0   1 |
 //
 //  new A([ m11, m12, dx, m21, m22, dy ])

 var identity = new A([1,0,0,0,1,0]);
 function matrix(m11, m12, m21, m22, dx, dy) {
     return new A([m11, m12, dx, m21, m22, dy]);
 }
 function rotation(t) {
     var c = Math.cos(t);
     var s = Math.sin(t);
     return new A([c, -s, 0, s, c, 0]);
 }
 function rotate(t,m) {
     var c = Math.cos(t);
     var s = Math.sin(t);
     var m11 = m[0], m12 = m[1], m21 = m[3], m22 = m[4];
     return new A([m11*c + m12*s, -m11*s + m12*c, m[2],
                   m21*c + m22*s, -m21*s + m22*c, m[5]]);
 }
 /*
 function move(xy,m) {
     var x = xy._0;
     var y = xy._1;
     var m11 = m[0], m12 = m[1], m21 = m[3], m22 = m[4];
     return new A([m11, m12, m11*x + m12*y + m[2],
                   m21, m22, m21*x + m22*y + m[5]]);
 }
 function scale(s,m) { return new A([m[0]*s, m[1]*s, m[2], m[3]*s, m[4]*s, m[5]]); }
 function scaleX(x,m) { return new A([m[0]*x, m[1], m[2], m[3]*x, m[4], m[5]]); }
 function scaleY(y,m) { return new A([m[0], m[1]*y, m[2], m[3], m[4]*y, m[5]]); }
 function reflectX(m) { return new A([-m[0], m[1], m[2], -m[3], m[4], m[5]]); }
 function reflectY(m) { return new A([m[0], -m[1], m[2], m[3], -m[4], m[5]]); }

 function transform(m11, m21, m12, m22, mdx, mdy, n) {
     var n11 = n[0], n12 = n[1], n21 = n[3], n22 = n[4], ndx = n[2], ndy = n[5];
     return new A([m11*n11 + m12*n21,
                   m11*n12 + m12*n22,
                   m11*ndx + m12*ndy + mdx,
                   m21*n11 + m22*n21,
                   m21*n12 + m22*n22,
                   m21*ndx + m22*ndy + mdy]);
 }
 */
 function multiply(m, n) {
     var m11 = m[0], m12 = m[1], m21 = m[3], m22 = m[4], mdx = m[2], mdy = m[5];
     var n11 = n[0], n12 = n[1], n21 = n[3], n22 = n[4], ndx = n[2], ndy = n[5];
     return new A([m11*n11 + m12*n21,
                   m11*n12 + m12*n22,
                   m11*ndx + m12*ndy + mdx,
                   m21*n11 + m22*n21,
                   m21*n12 + m22*n22,
                   m21*ndx + m22*ndy + mdy]);
 }

 return elm.Native.Transform2D.values = {
     identity:identity,
     matrix:F6(matrix),
     rotation:rotation,
     multiply:F2(multiply)
     /*
     transform:F7(transform),
     rotate:F2(rotate),
     move:F2(move),
     scale:F2(scale),
     scaleX:F2(scaleX),
     scaleY:F2(scaleY),
     reflectX:reflectX,
     reflectY:reflectY
     */
 };

};

Elm.Native = Elm.Native || {};
Elm.Native.Utils = {};
Elm.Native.Utils.make = function(localRuntime) {

    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Utils = localRuntime.Native.Utils || {};
    if (localRuntime.Native.Utils.values) {
        return localRuntime.Native.Utils.values;
    }

    function eq(l,r) {
        var stack = [{'x': l, 'y': r}]
        while (stack.length > 0) {
            var front = stack.pop();
            var x = front.x;
            var y = front.y;
            if (x === y) continue;
            if (typeof x === "object") {
                var c = 0;
                for (var i in x) {
                    ++c;
                    if (i in y) {
                        if (i !== 'ctor') {
                            stack.push({ 'x': x[i], 'y': y[i] });
                        }
                    } else {
                        return false;
                    }
                }
                if ('ctor' in x) {
                    stack.push({'x': x.ctor, 'y': y.ctor});
                }
                if (c !== Object.keys(y).length) {
                    return false;
                };
            } else if (typeof x === 'function') {
                throw new Error('Equality error: general function equality is ' +
                                'undecidable, and therefore, unsupported');
            } else {
                return false;
            }
        }
        return true;
    }

    // code in Generate/JavaScript.hs depends on the particular
    // integer values assigned to LT, EQ, and GT
    var LT = -1, EQ = 0, GT = 1, ord = ['LT','EQ','GT'];
    function compare(x,y) { return { ctor: ord[cmp(x,y)+1] } }
    function cmp(x,y) {
        var ord;
        if (typeof x !== 'object'){
            return x === y ? EQ : x < y ? LT : GT;
        }
        else if (x.isChar){
            var a = x.toString();
            var b = y.toString();
            return a === b ? EQ : a < b ? LT : GT;
        }
        else if (x.ctor === "::" || x.ctor === "[]") {
            while (true) {
                if (x.ctor === "[]" && y.ctor === "[]") return EQ;
                if (x.ctor !== y.ctor) return x.ctor === '[]' ? LT : GT;
                ord = cmp(x._0, y._0);
                if (ord !== EQ) return ord;
                x = x._1;
                y = y._1;
            }
        }
        else if (x.ctor.slice(0,6) === '_Tuple') {
            var n = x.ctor.slice(6) - 0;
            var err = 'cannot compare tuples with more than 6 elements.';
            if (n === 0) return EQ;
            if (n >= 1) { ord = cmp(x._0, y._0); if (ord !== EQ) return ord;
            if (n >= 2) { ord = cmp(x._1, y._1); if (ord !== EQ) return ord;
            if (n >= 3) { ord = cmp(x._2, y._2); if (ord !== EQ) return ord;
            if (n >= 4) { ord = cmp(x._3, y._3); if (ord !== EQ) return ord;
            if (n >= 5) { ord = cmp(x._4, y._4); if (ord !== EQ) return ord;
            if (n >= 6) { ord = cmp(x._5, y._5); if (ord !== EQ) return ord;
            if (n >= 7) throw new Error('Comparison error: ' + err); } } } } } }
            return EQ;
        }
        else {
            throw new Error('Comparison error: comparison is only defined on ints, ' +
                            'floats, times, chars, strings, lists of comparable values, ' +
                            'and tuples of comparable values.');
        }
    }


    var Tuple0 = { ctor: "_Tuple0" };
    function Tuple2(x,y) {
        return {
            ctor: "_Tuple2",
            _0: x,
            _1: y
        };
    }

    function chr(c) {
        var x = new String(c);
        x.isChar = true;
        return x;
    }

    function txt(str) {
        var t = new String(str);
        t.text = true;
        return t;
    }

    function makeText(text) {
        var style = '';
        var href = '';
        while (true) {
            if (text.style) {
                style += text.style;
                text = text.text;
                continue;
            }
            if (text.href) {
                href = text.href;
                text = text.text;
                continue;
            }
            if (href) {
                text = '<a href="' + href + '">' + text + '</a>';
            }
            if (style) {
                text = '<span style="' + style + '">' + text + '</span>';
            }
            return text;
        }
    }

    var count = 0;
    function guid(_) {
        return count++
    }

    function copy(oldRecord) {
        var newRecord = {};
        for (var key in oldRecord) {
            var value = key === '_'
                ? copy(oldRecord._)
                : oldRecord[key]
                ;
            newRecord[key] = value;
        }
        return newRecord;
    }

    function remove(key, oldRecord) {
        var record = copy(oldRecord);
        if (key in record._) {
            record[key] = record._[key][0];
            record._[key] = record._[key].slice(1);
            if (record._[key].length === 0) {
                delete record._[key];
            }
        } else {
            delete record[key];
        }
        return record;
    }

    function replace(keyValuePairs, oldRecord) {
        var record = copy(oldRecord);
        for (var i = keyValuePairs.length; i--; ) {
            var pair = keyValuePairs[i];
            record[pair[0]] = pair[1];
        }
        return record;
    }

    function insert(key, value, oldRecord) {
        var newRecord = copy(oldRecord);
        if (key in newRecord) {
            var values = newRecord._[key];
            var copiedValues = values ? values.slice(0) : [];
            newRecord._[key] = [newRecord[key]].concat(copiedValues);
        }
        newRecord[key] = value;
        return newRecord;
    }

    function getXY(e) {
        var posx = 0;
        var posy = 0;
        if (e.pageX || e.pageY) {
            posx = e.pageX;
            posy = e.pageY;
        } else if (e.clientX || e.clientY) {
            posx = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
            posy = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
        }

        if (localRuntime.isEmbed()) {
            var rect = localRuntime.node.getBoundingClientRect();
            var relx = rect.left + document.body.scrollLeft + document.documentElement.scrollLeft;
            var rely = rect.top + document.body.scrollTop + document.documentElement.scrollTop;
            // TODO: figure out if there is a way to avoid rounding here
            posx = posx - Math.round(relx) - localRuntime.node.clientLeft;
            posy = posy - Math.round(rely) - localRuntime.node.clientTop;
        }
        return Tuple2(posx, posy);
    }


    //// LIST STUFF ////

    var Nil = { ctor:'[]' };

    function Cons(hd,tl) {
        return {
            ctor: "::",
            _0: hd,
            _1: tl
        };
    }

    function append(xs,ys) {
        // append Text
        if (xs.text || ys.text) {
            return txt(makeText(xs) + makeText(ys));
        }

        // append Strings
        if (typeof xs === "string") {
            return xs + ys;
        }

        // append Lists
        if (xs.ctor === '[]') {
            return ys;
        }
        var root = Cons(xs._0, Nil);
        var curr = root;
        xs = xs._1;
        while (xs.ctor !== '[]') {
            curr._1 = Cons(xs._0, Nil);
            xs = xs._1;
            curr = curr._1;
        }
        curr._1 = ys;
        return root;
    }

    //// RUNTIME ERRORS ////

    function indent(lines) {
        return '\n' + lines.join('\n');
    }

    function badCase(moduleName, span) { 
        var msg = indent([
            'Non-exhaustive pattern match in case-expression.',
            'Make sure your patterns cover every case!'
        ]);
        throw new Error('Runtime error in module ' + moduleName + ' (' + span + ')' + msg);
    }

    function badIf(moduleName, span) { 
        var msg = indent([
            'Non-exhaustive pattern match in multi-way-if expression.',
            'It is best to use \'otherwise\' as the last branch of multi-way-if.'
        ]);
        throw new Error('Runtime error in module ' + moduleName + ' (' + span + ')' + msg);
    }


    function badPort(expected, received) { 
        var msg = indent([
            'Expecting ' + expected + ' but was given ',
            JSON.stringify(received)
        ]);
        throw new Error('Runtime error when sending values through a port.' + msg);
    }


    return localRuntime.Native.Utils.values = {
        eq:eq,
        cmp:cmp,
        compare:F2(compare),
        Tuple0:Tuple0,
        Tuple2:Tuple2,
        chr:chr,
        txt:txt,
        makeText:makeText,
        copy: copy,
        remove: remove,
        replace: replace,
        insert: insert,
        guid: guid,
        getXY: getXY,

        Nil: Nil,
        Cons: Cons,
        append: F2(append),

        badCase: badCase,
        badIf: badIf,
        badPort: badPort
    };
};

(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
module.exports = createHash

function createHash(elem) {
    var attributes = elem.attributes
    var hash = {}

    if (attributes === null || attributes === undefined) {
        return hash
    }

    for (var i = 0; i < attributes.length; i++) {
        var attr = attributes[i]

        if (attr.name.substr(0,5) !== "data-") {
            continue
        }

        hash[attr.name.substr(5)] = attr.value
    }

    return hash
}

},{}],2:[function(require,module,exports){
var createStore = require("weakmap-shim/create-store")
var Individual = require("individual")

var createHash = require("./create-hash.js")

var hashStore = Individual("__DATA_SET_WEAKMAP@3", createStore())

module.exports = DataSet

function DataSet(elem) {
    var store = hashStore(elem)

    if (!store.hash) {
        store.hash = createHash(elem)
    }

    return store.hash
}

},{"./create-hash.js":1,"individual":3,"weakmap-shim/create-store":4}],3:[function(require,module,exports){
(function (global){
var root = typeof window !== 'undefined' ?
    window : typeof global !== 'undefined' ?
    global : {};

module.exports = Individual

function Individual(key, value) {
    if (root[key]) {
        return root[key]
    }

    Object.defineProperty(root, key, {
        value: value
        , configurable: true
    })

    return value
}

}).call(this,typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
},{}],4:[function(require,module,exports){
var hiddenStore = require('./hidden-store.js');

module.exports = createStore;

function createStore() {
    var key = {};

    return function (obj) {
        if (typeof obj !== 'object' || obj === null) {
            throw new Error('Weakmap-shim: Key must be object')
        }

        var store = obj.valueOf(key);
        return store && store.identity === key ?
            store : hiddenStore(obj, key);
    };
}

},{"./hidden-store.js":5}],5:[function(require,module,exports){
module.exports = hiddenStore;

function hiddenStore(obj, key) {
    var store = { identity: key };
    var valueOf = obj.valueOf;

    Object.defineProperty(obj, "valueOf", {
        value: function (value) {
            return value !== key ?
                valueOf.apply(this, arguments) : store;
        },
        writable: true
    });

    return store;
}

},{}],6:[function(require,module,exports){
var DataSet = require("data-set")

module.exports = addEvent

function addEvent(target, type, handler) {
    var ds = DataSet(target)
    var events = ds[type]

    if (!events) {
        ds[type] = handler
    } else if (Array.isArray(events)) {
        if (events.indexOf(handler) === -1) {
            events.push(handler)
        }
    } else if (events !== handler) {
        ds[type] = [events, handler]
    }
}

},{"data-set":2}],7:[function(require,module,exports){
var globalDocument = require("global/document")
var DataSet = require("data-set")
var createStore = require("weakmap-shim/create-store")

var addEvent = require("./add-event.js")
var removeEvent = require("./remove-event.js")
var ProxyEvent = require("./proxy-event.js")

var HANDLER_STORE = createStore()

module.exports = DOMDelegator

function DOMDelegator(document) {
    document = document || globalDocument

    this.target = document.documentElement
    this.events = {}
    this.rawEventListeners = {}
    this.globalListeners = {}
}

DOMDelegator.prototype.addEventListener = addEvent
DOMDelegator.prototype.removeEventListener = removeEvent

DOMDelegator.prototype.allocateHandle =
    function allocateHandle(func) {
        var handle = new Handle()

        HANDLER_STORE(handle).func = func;

        return handle
    }

DOMDelegator.prototype.transformHandle =
    function transformHandle(handle, lambda) {
        var func = HANDLER_STORE(handle).func

        return this.allocateHandle(function (ev) {
            var result = lambda(ev)
            if (result) {
                func(result)
            }
        })
    }

DOMDelegator.prototype.addGlobalEventListener =
    function addGlobalEventListener(eventName, fn) {
        var listeners = this.globalListeners[eventName] || [];
        if (listeners.indexOf(fn) === -1) {
            listeners.push(fn)
        }

        this.globalListeners[eventName] = listeners;
    }

DOMDelegator.prototype.removeGlobalEventListener =
    function removeGlobalEventListener(eventName, fn) {
        var listeners = this.globalListeners[eventName] || [];

        var index = listeners.indexOf(fn)
        if (index !== -1) {
            listeners.splice(index, 1)
        }
    }

DOMDelegator.prototype.listenTo = function listenTo(eventName) {
    if (this.events[eventName]) {
        return
    }

    this.events[eventName] = true

    var listener = this.rawEventListeners[eventName]
    if (!listener) {
        listener = this.rawEventListeners[eventName] =
            createHandler(eventName, this)
    }

    this.target.addEventListener(eventName, listener, true)
}

DOMDelegator.prototype.unlistenTo = function unlistenTo(eventName) {
    if (!this.events[eventName]) {
        return
    }

    this.events[eventName] = false
    var listener = this.rawEventListeners[eventName]

    if (!listener) {
        throw new Error("dom-delegator#unlistenTo: cannot " +
            "unlisten to " + eventName)
    }

    this.target.removeEventListener(eventName, listener, true)
}

function createHandler(eventName, delegator) {
    var globalListeners = delegator.globalListeners;
    var delegatorTarget = delegator.target;

    return handler

    function handler(ev) {
        var globalHandlers = globalListeners[eventName] || []

        if (globalHandlers.length > 0) {
            var globalEvent = new ProxyEvent(ev);
            globalEvent.currentTarget = delegatorTarget;
            callListeners(globalHandlers, globalEvent)
        }

        findAndInvokeListeners(ev.target, ev, eventName)
    }
}

function findAndInvokeListeners(elem, ev, eventName) {
    var listener = getListener(elem, eventName)

    if (listener && listener.handlers.length > 0) {
        var listenerEvent = new ProxyEvent(ev);
        listenerEvent.currentTarget = listener.currentTarget
        callListeners(listener.handlers, listenerEvent)

        if (listenerEvent._bubbles) {
            var nextTarget = listener.currentTarget.parentNode
            findAndInvokeListeners(nextTarget, ev, eventName)
        }
    }
}

function getListener(target, type) {
    // terminate recursion if parent is `null`
    if (target === null) {
        return null
    }

    var ds = DataSet(target)
    // fetch list of handler fns for this event
    var handler = ds[type]
    var allHandler = ds.event

    if (!handler && !allHandler) {
        return getListener(target.parentNode, type)
    }

    var handlers = [].concat(handler || [], allHandler || [])
    return new Listener(target, handlers)
}

function callListeners(handlers, ev) {
    handlers.forEach(function (handler) {
        if (typeof handler === "function") {
            handler(ev)
        } else if (typeof handler.handleEvent === "function") {
            handler.handleEvent(ev)
        } else if (handler.type === "dom-delegator-handle") {
            HANDLER_STORE(handler).func(ev)
        } else {
            throw new Error("dom-delegator: unknown handler " +
                "found: " + JSON.stringify(handlers));
        }
    })
}

function Listener(target, handlers) {
    this.currentTarget = target
    this.handlers = handlers
}

function Handle() {
    this.type = "dom-delegator-handle"
}

},{"./add-event.js":6,"./proxy-event.js":15,"./remove-event.js":16,"data-set":2,"global/document":10,"weakmap-shim/create-store":13}],8:[function(require,module,exports){
var Individual = require("individual")
var cuid = require("cuid")
var globalDocument = require("global/document")

var DOMDelegator = require("./dom-delegator.js")

var delegatorCache = Individual("__DOM_DELEGATOR_CACHE@9", {
    delegators: {}
})
var commonEvents = [
    "blur", "change", "click",  "contextmenu", "dblclick",
    "error","focus", "focusin", "focusout", "input", "keydown",
    "keypress", "keyup", "load", "mousedown", "mouseup",
    "resize", "scroll", "select", "submit", "touchcancel",
    "touchend", "touchstart", "unload"
]

/*  Delegator is a thin wrapper around a singleton `DOMDelegator`
        instance.

    Only one DOMDelegator should exist because we do not want
        duplicate event listeners bound to the DOM.

    `Delegator` will also `listenTo()` all events unless 
        every caller opts out of it
*/
module.exports = Delegator

function Delegator(opts) {
    opts = opts || {}
    var document = opts.document || globalDocument

    var cacheKey = document["__DOM_DELEGATOR_CACHE_TOKEN@9"]

    if (!cacheKey) {
        cacheKey =
            document["__DOM_DELEGATOR_CACHE_TOKEN@9"] = cuid()
    }

    var delegator = delegatorCache.delegators[cacheKey]

    if (!delegator) {
        delegator = delegatorCache.delegators[cacheKey] =
            new DOMDelegator(document)
    }

    if (opts.defaultEvents !== false) {
        for (var i = 0; i < commonEvents.length; i++) {
            delegator.listenTo(commonEvents[i])
        }
    }

    return delegator
}



},{"./dom-delegator.js":7,"cuid":9,"global/document":10,"individual":11}],9:[function(require,module,exports){
/**
 * cuid.js
 * Collision-resistant UID generator for browsers and node.
 * Sequential for fast db lookups and recency sorting.
 * Safe for element IDs and server-side lookups.
 *
 * Extracted from CLCTR
 * 
 * Copyright (c) Eric Elliott 2012
 * MIT License
 */

/*global window, navigator, document, require, process, module */
(function (app) {
  'use strict';
  var namespace = 'cuid',
    c = 0,
    blockSize = 4,
    base = 36,
    discreteValues = Math.pow(base, blockSize),

    pad = function pad(num, size) {
      var s = "000000000" + num;
      return s.substr(s.length-size);
    },

    randomBlock = function randomBlock() {
      return pad((Math.random() *
            discreteValues << 0)
            .toString(base), blockSize);
    },

    safeCounter = function () {
      c = (c < discreteValues) ? c : 0;
      c++; // this is not subliminal
      return c - 1;
    },

    api = function cuid() {
      // Starting with a lowercase letter makes
      // it HTML element ID friendly.
      var letter = 'c', // hard-coded allows for sequential access

        // timestamp
        // warning: this exposes the exact date and time
        // that the uid was created.
        timestamp = (new Date().getTime()).toString(base),

        // Prevent same-machine collisions.
        counter,

        // A few chars to generate distinct ids for different
        // clients (so different computers are far less
        // likely to generate the same id)
        fingerprint = api.fingerprint(),

        // Grab some more chars from Math.random()
        random = randomBlock() + randomBlock();

        counter = pad(safeCounter().toString(base), blockSize);

      return  (letter + timestamp + counter + fingerprint + random);
    };

  api.slug = function slug() {
    var date = new Date().getTime().toString(36),
      counter,
      print = api.fingerprint().slice(0,1) +
        api.fingerprint().slice(-1),
      random = randomBlock().slice(-2);

      counter = safeCounter().toString(36).slice(-4);

    return date.slice(-2) + 
      counter + print + random;
  };

  api.globalCount = function globalCount() {
    // We want to cache the results of this
    var cache = (function calc() {
        var i,
          count = 0;

        for (i in window) {
          count++;
        }

        return count;
      }());

    api.globalCount = function () { return cache; };
    return cache;
  };

  api.fingerprint = function browserPrint() {
    return pad((navigator.mimeTypes.length +
      navigator.userAgent.length).toString(36) +
      api.globalCount().toString(36), 4);
  };

  // don't change anything from here down.
  if (app.register) {
    app.register(namespace, api);
  } else if (typeof module !== 'undefined') {
    module.exports = api;
  } else {
    app[namespace] = api;
  }

}(this.applitude || this));

},{}],10:[function(require,module,exports){
(function (global){
var topLevel = typeof global !== 'undefined' ? global :
    typeof window !== 'undefined' ? window : {}
var minDoc = require('min-document');

if (typeof document !== 'undefined') {
    module.exports = document;
} else {
    var doccy = topLevel['__GLOBAL_DOCUMENT_CACHE@4'];

    if (!doccy) {
        doccy = topLevel['__GLOBAL_DOCUMENT_CACHE@4'] = minDoc;
    }

    module.exports = doccy;
}

}).call(this,typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
},{"min-document":40}],11:[function(require,module,exports){
module.exports=require(3)
},{}],12:[function(require,module,exports){
if (typeof Object.create === 'function') {
  // implementation from standard node.js 'util' module
  module.exports = function inherits(ctor, superCtor) {
    ctor.super_ = superCtor
    ctor.prototype = Object.create(superCtor.prototype, {
      constructor: {
        value: ctor,
        enumerable: false,
        writable: true,
        configurable: true
      }
    });
  };
} else {
  // old school shim for old browsers
  module.exports = function inherits(ctor, superCtor) {
    ctor.super_ = superCtor
    var TempCtor = function () {}
    TempCtor.prototype = superCtor.prototype
    ctor.prototype = new TempCtor()
    ctor.prototype.constructor = ctor
  }
}

},{}],13:[function(require,module,exports){
module.exports=require(4)
},{"./hidden-store.js":14}],14:[function(require,module,exports){
module.exports=require(5)
},{}],15:[function(require,module,exports){
var inherits = require("inherits")

var ALL_PROPS = [
    "altKey", "bubbles", "cancelable", "ctrlKey",
    "eventPhase", "metaKey", "relatedTarget", "shiftKey",
    "target", "timeStamp", "type", "view", "which"
]
var KEY_PROPS = ["char", "charCode", "key", "keyCode"]
var MOUSE_PROPS = [
    "button", "buttons", "clientX", "clientY", "layerX",
    "layerY", "offsetX", "offsetY", "pageX", "pageY",
    "screenX", "screenY", "toElement"
]

var rkeyEvent = /^key|input/
var rmouseEvent = /^(?:mouse|pointer|contextmenu)|click/

module.exports = ProxyEvent

function ProxyEvent(ev) {
    if (!(this instanceof ProxyEvent)) {
        return new ProxyEvent(ev)
    }

    if (rkeyEvent.test(ev.type)) {
        return new KeyEvent(ev)
    } else if (rmouseEvent.test(ev.type)) {
        return new MouseEvent(ev)
    }

    for (var i = 0; i < ALL_PROPS.length; i++) {
        var propKey = ALL_PROPS[i]
        this[propKey] = ev[propKey]
    }

    this._rawEvent = ev
    this._bubbles = false;
}

ProxyEvent.prototype.preventDefault = function () {
    this._rawEvent.preventDefault()
}

ProxyEvent.prototype.startPropagation = function () {
    this._bubbles = true;
}

function MouseEvent(ev) {
    for (var i = 0; i < ALL_PROPS.length; i++) {
        var propKey = ALL_PROPS[i]
        this[propKey] = ev[propKey]
    }

    for (var j = 0; j < MOUSE_PROPS.length; j++) {
        var mousePropKey = MOUSE_PROPS[j]
        this[mousePropKey] = ev[mousePropKey]
    }

    this._rawEvent = ev
}

inherits(MouseEvent, ProxyEvent)

function KeyEvent(ev) {
    for (var i = 0; i < ALL_PROPS.length; i++) {
        var propKey = ALL_PROPS[i]
        this[propKey] = ev[propKey]
    }

    for (var j = 0; j < KEY_PROPS.length; j++) {
        var keyPropKey = KEY_PROPS[j]
        this[keyPropKey] = ev[keyPropKey]
    }

    this._rawEvent = ev
}

inherits(KeyEvent, ProxyEvent)

},{"inherits":12}],16:[function(require,module,exports){
var DataSet = require("data-set")

module.exports = removeEvent

function removeEvent(target, type, handler) {
    var ds = DataSet(target)
    var events = ds[type]

    if (!events) {
        return
    } else if (Array.isArray(events)) {
        var index = events.indexOf(handler)
        if (index !== -1) {
            events.splice(index, 1)
        }
    } else if (events === handler) {
        ds[type] = null
    }
}

},{"data-set":2}],17:[function(require,module,exports){
var isObject = require("is-object")
var isHook = require("vtree/is-vhook")

module.exports = applyProperties

function applyProperties(node, props, previous) {
    for (var propName in props) {
        var propValue = props[propName]

        if (propValue === undefined) {
            removeProperty(node, props, previous, propName);
        } else if (isHook(propValue)) {
            propValue.hook(node,
                propName,
                previous ? previous[propName] : undefined)
        } else {
            if (isObject(propValue)) {
                patchObject(node, props, previous, propName, propValue);
            } else if (propValue !== undefined) {
                node[propName] = propValue
            }
        }
    }
}

function removeProperty(node, props, previous, propName) {
    if (previous) {
        var previousValue = previous[propName]

        if (!isHook(previousValue)) {
            if (propName === "attributes") {
                for (var attrName in previousValue) {
                    node.removeAttribute(attrName)
                }
            } else if (propName === "style") {
                for (var i in previousValue) {
                    node.style[i] = ""
                }
            } else if (typeof previousValue === "string") {
                node[propName] = ""
            } else {
                node[propName] = null
            }
        }
    }
}

function patchObject(node, props, previous, propName, propValue) {
    var previousValue = previous ? previous[propName] : undefined

    // Set attributes
    if (propName === "attributes") {
        for (var attrName in propValue) {
            var attrValue = propValue[attrName]

            if (attrValue === undefined) {
                node.removeAttribute(attrName)
            } else {
                node.setAttribute(attrName, attrValue)
            }
        }

        return
    }

    if(previousValue && isObject(previousValue) &&
        getPrototype(previousValue) !== getPrototype(propValue)) {
        node[propName] = propValue
        return
    }

    if (!isObject(node[propName])) {
        node[propName] = {}
    }

    var replacer = propName === "style" ? "" : undefined

    for (var k in propValue) {
        var value = propValue[k]
        node[propName][k] = (value === undefined) ? replacer : value
    }
}

function getPrototype(value) {
    if (Object.getPrototypeOf) {
        return Object.getPrototypeOf(value)
    } else if (value.__proto__) {
        return value.__proto__
    } else if (value.constructor) {
        return value.constructor.prototype
    }
}

},{"is-object":21,"vtree/is-vhook":29}],18:[function(require,module,exports){
var document = require("global/document")

var applyProperties = require("./apply-properties")

var isVNode = require("vtree/is-vnode")
var isVText = require("vtree/is-vtext")
var isWidget = require("vtree/is-widget")
var handleThunk = require("vtree/handle-thunk")

module.exports = createElement

function createElement(vnode, opts) {
    var doc = opts ? opts.document || document : document
    var warn = opts ? opts.warn : null

    vnode = handleThunk(vnode).a

    if (isWidget(vnode)) {
        return vnode.init()
    } else if (isVText(vnode)) {
        return doc.createTextNode(vnode.text)
    } else if (!isVNode(vnode)) {
        if (warn) {
            warn("Item is not a valid virtual dom node", vnode)
        }
        return null
    }

    var node = (vnode.namespace === null) ?
        doc.createElement(vnode.tagName) :
        doc.createElementNS(vnode.namespace, vnode.tagName)

    var props = vnode.properties
    applyProperties(node, props)

    var children = vnode.children

    for (var i = 0; i < children.length; i++) {
        var childNode = createElement(children[i], opts)
        if (childNode) {
            node.appendChild(childNode)
        }
    }

    return node
}

},{"./apply-properties":17,"global/document":20,"vtree/handle-thunk":27,"vtree/is-vnode":30,"vtree/is-vtext":31,"vtree/is-widget":32}],19:[function(require,module,exports){
// Maps a virtual DOM tree onto a real DOM tree in an efficient manner.
// We don't want to read all of the DOM nodes in the tree so we use
// the in-order tree indexing to eliminate recursion down certain branches.
// We only recurse into a DOM node if we know that it contains a child of
// interest.

var noChild = {}

module.exports = domIndex

function domIndex(rootNode, tree, indices, nodes) {
    if (!indices || indices.length === 0) {
        return {}
    } else {
        indices.sort(ascending)
        return recurse(rootNode, tree, indices, nodes, 0)
    }
}

function recurse(rootNode, tree, indices, nodes, rootIndex) {
    nodes = nodes || {}


    if (rootNode) {
        if (indexInRange(indices, rootIndex, rootIndex)) {
            nodes[rootIndex] = rootNode
        }

        var vChildren = tree.children

        if (vChildren) {

            var childNodes = rootNode.childNodes

            for (var i = 0; i < tree.children.length; i++) {
                rootIndex += 1

                var vChild = vChildren[i] || noChild
                var nextIndex = rootIndex + (vChild.count || 0)

                // skip recursion down the tree if there are no nodes down here
                if (indexInRange(indices, rootIndex, nextIndex)) {
                    recurse(childNodes[i], vChild, indices, nodes, rootIndex)
                }

                rootIndex = nextIndex
            }
        }
    }

    return nodes
}

// Binary search for an index in the interval [left, right]
function indexInRange(indices, left, right) {
    if (indices.length === 0) {
        return false
    }

    var minIndex = 0
    var maxIndex = indices.length - 1
    var currentIndex
    var currentItem

    while (minIndex <= maxIndex) {
        currentIndex = ((maxIndex + minIndex) / 2) >> 0
        currentItem = indices[currentIndex]

        if (minIndex === maxIndex) {
            return currentItem >= left && currentItem <= right
        } else if (currentItem < left) {
            minIndex = currentIndex + 1
        } else  if (currentItem > right) {
            maxIndex = currentIndex - 1
        } else {
            return true
        }
    }

    return false;
}

function ascending(a, b) {
    return a > b ? 1 : -1
}

},{}],20:[function(require,module,exports){
module.exports=require(10)
},{"min-document":40}],21:[function(require,module,exports){
module.exports = isObject

function isObject(x) {
    return typeof x === "object" && x !== null
}

},{}],22:[function(require,module,exports){
var nativeIsArray = Array.isArray
var toString = Object.prototype.toString

module.exports = nativeIsArray || isArray

function isArray(obj) {
    return toString.call(obj) === "[object Array]"
}

},{}],23:[function(require,module,exports){
var applyProperties = require("./apply-properties")

var isWidget = require("vtree/is-widget")
var VPatch = require("vtree/vpatch")

var render = require("./create-element")
var updateWidget = require("./update-widget")

module.exports = applyPatch

function applyPatch(vpatch, domNode, renderOptions) {
    var type = vpatch.type
    var vNode = vpatch.vNode
    var patch = vpatch.patch

    switch (type) {
        case VPatch.REMOVE:
            return removeNode(domNode, vNode)
        case VPatch.INSERT:
            return insertNode(domNode, patch, renderOptions)
        case VPatch.VTEXT:
            return stringPatch(domNode, vNode, patch, renderOptions)
        case VPatch.WIDGET:
            return widgetPatch(domNode, vNode, patch, renderOptions)
        case VPatch.VNODE:
            return vNodePatch(domNode, vNode, patch, renderOptions)
        case VPatch.ORDER:
            reorderChildren(domNode, patch)
            return domNode
        case VPatch.PROPS:
            applyProperties(domNode, patch, vNode.properties)
            return domNode
        case VPatch.THUNK:
            return replaceRoot(domNode,
                renderOptions.patch(domNode, patch, renderOptions))
        default:
            return domNode
    }
}

function removeNode(domNode, vNode) {
    var parentNode = domNode.parentNode

    if (parentNode) {
        parentNode.removeChild(domNode)
    }

    destroyWidget(domNode, vNode);

    return null
}

function insertNode(parentNode, vNode, renderOptions) {
    var newNode = render(vNode, renderOptions)

    if (parentNode) {
        parentNode.appendChild(newNode)
    }

    return parentNode
}

function stringPatch(domNode, leftVNode, vText, renderOptions) {
    var newNode

    if (domNode.nodeType === 3) {
        domNode.replaceData(0, domNode.length, vText.text)
        newNode = domNode
    } else {
        var parentNode = domNode.parentNode
        newNode = render(vText, renderOptions)

        if (parentNode) {
            parentNode.replaceChild(newNode, domNode)
        }
    }

    destroyWidget(domNode, leftVNode)

    return newNode
}

function widgetPatch(domNode, leftVNode, widget, renderOptions) {
    if (updateWidget(leftVNode, widget)) {
        return widget.update(leftVNode, domNode) || domNode
    }

    var parentNode = domNode.parentNode
    var newWidget = render(widget, renderOptions)

    if (parentNode) {
        parentNode.replaceChild(newWidget, domNode)
    }

    destroyWidget(domNode, leftVNode)

    return newWidget
}

function vNodePatch(domNode, leftVNode, vNode, renderOptions) {
    var parentNode = domNode.parentNode
    var newNode = render(vNode, renderOptions)

    if (parentNode) {
        parentNode.replaceChild(newNode, domNode)
    }

    destroyWidget(domNode, leftVNode)

    return newNode
}

function destroyWidget(domNode, w) {
    if (typeof w.destroy === "function" && isWidget(w)) {
        w.destroy(domNode)
    }
}

function reorderChildren(domNode, bIndex) {
    var children = []
    var childNodes = domNode.childNodes
    var len = childNodes.length
    var i
    var reverseIndex = bIndex.reverse

    for (i = 0; i < len; i++) {
        children.push(domNode.childNodes[i])
    }

    var insertOffset = 0
    var move
    var node
    var insertNode
    for (i = 0; i < len; i++) {
        move = bIndex[i]
        if (move !== undefined && move !== i) {
            // the element currently at this index will be moved later so increase the insert offset
            if (reverseIndex[i] > i) {
                insertOffset++
            }

            node = children[move]
            insertNode = childNodes[i + insertOffset] || null
            if (node !== insertNode) {
                domNode.insertBefore(node, insertNode)
            }

            // the moved element came from the front of the array so reduce the insert offset
            if (move < i) {
                insertOffset--
            }
        }

        // element at this index is scheduled to be removed so increase insert offset
        if (i in bIndex.removes) {
            insertOffset++
        }
    }
}

function replaceRoot(oldRoot, newRoot) {
    if (oldRoot && newRoot && oldRoot !== newRoot && oldRoot.parentNode) {
        console.log(oldRoot)
        oldRoot.parentNode.replaceChild(newRoot, oldRoot)
    }

    return newRoot;
}

},{"./apply-properties":17,"./create-element":18,"./update-widget":25,"vtree/is-widget":32,"vtree/vpatch":37}],24:[function(require,module,exports){
var document = require("global/document")
var isArray = require("x-is-array")

var domIndex = require("./dom-index")
var patchOp = require("./patch-op")
module.exports = patch

function patch(rootNode, patches) {
    return patchRecursive(rootNode, patches)
}

function patchRecursive(rootNode, patches, renderOptions) {
    var indices = patchIndices(patches)

    if (indices.length === 0) {
        return rootNode
    }

    var index = domIndex(rootNode, patches.a, indices)
    var ownerDocument = rootNode.ownerDocument

    if (!renderOptions) {
        renderOptions = { patch: patchRecursive }
        if (ownerDocument !== document) {
            renderOptions.document = ownerDocument
        }
    }

    for (var i = 0; i < indices.length; i++) {
        var nodeIndex = indices[i]
        rootNode = applyPatch(rootNode,
            index[nodeIndex],
            patches[nodeIndex],
            renderOptions)
    }

    return rootNode
}

function applyPatch(rootNode, domNode, patchList, renderOptions) {
    if (!domNode) {
        return rootNode
    }

    var newNode

    if (isArray(patchList)) {
        for (var i = 0; i < patchList.length; i++) {
            newNode = patchOp(patchList[i], domNode, renderOptions)

            if (domNode === rootNode) {
                rootNode = newNode
            }
        }
    } else {
        newNode = patchOp(patchList, domNode, renderOptions)

        if (domNode === rootNode) {
            rootNode = newNode
        }
    }

    return rootNode
}

function patchIndices(patches) {
    var indices = []

    for (var key in patches) {
        if (key !== "a") {
            indices.push(Number(key))
        }
    }

    return indices
}

},{"./dom-index":19,"./patch-op":23,"global/document":20,"x-is-array":22}],25:[function(require,module,exports){
var isWidget = require("vtree/is-widget")

module.exports = updateWidget

function updateWidget(a, b) {
    if (isWidget(a) && isWidget(b)) {
        if ("name" in a && "name" in b) {
            return a.id === b.id
        } else {
            return a.init === b.init
        }
    }

    return false
}

},{"vtree/is-widget":32}],26:[function(require,module,exports){
var isArray = require("x-is-array")
var isObject = require("is-object")

var VPatch = require("./vpatch")
var isVNode = require("./is-vnode")
var isVText = require("./is-vtext")
var isWidget = require("./is-widget")
var isThunk = require("./is-thunk")
var handleThunk = require("./handle-thunk")

module.exports = diff

function diff(a, b) {
    var patch = { a: a }
    walk(a, b, patch, 0)
    return patch
}

function walk(a, b, patch, index) {
    if (a === b) {
        if (isThunk(a) || isThunk(b)) {
            thunks(a, b, patch, index)
        } else {
            hooks(b, patch, index)
        }
        return
    }

    var apply = patch[index]

    if (b == null) {
        apply = appendPatch(apply, new VPatch(VPatch.REMOVE, a, b))
        destroyWidgets(a, patch, index)
    } else if (isThunk(a) || isThunk(b)) {
        thunks(a, b, patch, index)
    } else if (isVNode(b)) {
        if (isVNode(a)) {
            if (a.tagName === b.tagName &&
                a.namespace === b.namespace &&
                a.key === b.key) {
                var propsPatch = diffProps(a.properties, b.properties, b.hooks)
                if (propsPatch) {
                    apply = appendPatch(apply,
                        new VPatch(VPatch.PROPS, a, propsPatch))
                }
                apply = diffChildren(a, b, patch, apply, index)
            } else {
                apply = appendPatch(apply, new VPatch(VPatch.VNODE, a, b))
                destroyWidgets(a, patch, index)
            }
        } else {
            apply = appendPatch(apply, new VPatch(VPatch.VNODE, a, b))
            destroyWidgets(a, patch, index)
        }
    } else if (isVText(b)) {
        if (!isVText(a)) {
            apply = appendPatch(apply, new VPatch(VPatch.VTEXT, a, b))
            destroyWidgets(a, patch, index)
        } else if (a.text !== b.text) {
            apply = appendPatch(apply, new VPatch(VPatch.VTEXT, a, b))
        }
    } else if (isWidget(b)) {
        apply = appendPatch(apply, new VPatch(VPatch.WIDGET, a, b))

        if (!isWidget(a)) {
            destroyWidgets(a, patch, index)
        }
    }

    if (apply) {
        patch[index] = apply
    }
}

function diffProps(a, b, hooks) {
    var diff

    for (var aKey in a) {
        if (!(aKey in b)) {
            diff = diff || {}
            diff[aKey] = undefined
        }

        var aValue = a[aKey]
        var bValue = b[aKey]

        if (hooks && aKey in hooks) {
            diff = diff || {}
            diff[aKey] = bValue
        } else {
            if (isObject(aValue) && isObject(bValue)) {
                if (getPrototype(bValue) !== getPrototype(aValue)) {
                    diff = diff || {}
                    diff[aKey] = bValue
                } else {
                    var objectDiff = diffProps(aValue, bValue)
                    if (objectDiff) {
                        diff = diff || {}
                        diff[aKey] = objectDiff
                    }
                }
            } else if (aValue !== bValue) {
                diff = diff || {}
                diff[aKey] = bValue
            }
        }
    }

    for (var bKey in b) {
        if (!(bKey in a)) {
            diff = diff || {}
            diff[bKey] = b[bKey]
        }
    }

    return diff
}

function getPrototype(value) {
    if (Object.getPrototypeOf) {
        return Object.getPrototypeOf(value)
    } else if (value.__proto__) {
        return value.__proto__
    } else if (value.constructor) {
        return value.constructor.prototype
    }
}

function diffChildren(a, b, patch, apply, index) {
    var aChildren = a.children
    var bChildren = reorder(aChildren, b.children)

    var aLen = aChildren.length
    var bLen = bChildren.length
    var len = aLen > bLen ? aLen : bLen

    for (var i = 0; i < len; i++) {
        var leftNode = aChildren[i]
        var rightNode = bChildren[i]
        index += 1

        if (!leftNode) {
            if (rightNode) {
                // Excess nodes in b need to be added
                apply = appendPatch(apply,
                    new VPatch(VPatch.INSERT, null, rightNode))
            }
        } else if (!rightNode) {
            if (leftNode) {
                // Excess nodes in a need to be removed
                patch[index] = new VPatch(VPatch.REMOVE, leftNode, null)
                destroyWidgets(leftNode, patch, index)
            }
        } else {
            walk(leftNode, rightNode, patch, index)
        }

        if (isVNode(leftNode) && leftNode.count) {
            index += leftNode.count
        }
    }

    if (bChildren.moves) {
        // Reorder nodes last
        apply = appendPatch(apply, new VPatch(VPatch.ORDER, a, bChildren.moves))
    }

    return apply
}

// Patch records for all destroyed widgets must be added because we need
// a DOM node reference for the destroy function
function destroyWidgets(vNode, patch, index) {
    if (isWidget(vNode)) {
        if (typeof vNode.destroy === "function") {
            patch[index] = new VPatch(VPatch.REMOVE, vNode, null)
        }
    } else if (isVNode(vNode) && vNode.hasWidgets) {
        var children = vNode.children
        var len = children.length
        for (var i = 0; i < len; i++) {
            var child = children[i]
            index += 1

            destroyWidgets(child, patch, index)

            if (isVNode(child) && child.count) {
                index += child.count
            }
        }
    }
}

// Create a sub-patch for thunks
function thunks(a, b, patch, index) {
    var nodes = handleThunk(a, b);
    var thunkPatch = diff(nodes.a, nodes.b)
    if (hasPatches(thunkPatch)) {
        patch[index] = new VPatch(VPatch.THUNK, null, thunkPatch)
    }
}

function hasPatches(patch) {
    for (var index in patch) {
        if (index !== "a") {
            return true;
        }
    }

    return false;
}

// Execute hooks when two nodes are identical
function hooks(vNode, patch, index) {
    if (isVNode(vNode)) {
        if (vNode.hooks) {
            patch[index] = new VPatch(VPatch.PROPS, vNode.hooks, vNode.hooks)
        }

        if (vNode.descendantHooks) {
            var children = vNode.children
            var len = children.length
            for (var i = 0; i < len; i++) {
                var child = children[i]
                index += 1

                hooks(child, patch, index)

                if (isVNode(child) && child.count) {
                    index += child.count
                }
            }
        }
    }
}

// List diff, naive left to right reordering
function reorder(aChildren, bChildren) {

    var bKeys = keyIndex(bChildren)

    if (!bKeys) {
        return bChildren
    }

    var aKeys = keyIndex(aChildren)

    if (!aKeys) {
        return bChildren
    }

    var bMatch = {}, aMatch = {}

    for (var key in bKeys) {
        bMatch[bKeys[key]] = aKeys[key]
    }

    for (var key in aKeys) {
        aMatch[aKeys[key]] = bKeys[key]
    }

    var aLen = aChildren.length
    var bLen = bChildren.length
    var len = aLen > bLen ? aLen : bLen
    var shuffle = []
    var freeIndex = 0
    var i = 0
    var moveIndex = 0
    var moves = {}
    var removes = moves.removes = {}
    var reverse = moves.reverse = {}
    var hasMoves = false

    while (freeIndex < len) {
        var move = aMatch[i]
        if (move !== undefined) {
            shuffle[i] = bChildren[move]
            if (move !== moveIndex) {
                moves[move] = moveIndex
                reverse[moveIndex] = move
                hasMoves = true
            }
            moveIndex++
        } else if (i in aMatch) {
            shuffle[i] = undefined
            removes[i] = moveIndex++
            hasMoves = true
        } else {
            while (bMatch[freeIndex] !== undefined) {
                freeIndex++
            }

            if (freeIndex < len) {
                var freeChild = bChildren[freeIndex]
                if (freeChild) {
                    shuffle[i] = freeChild
                    if (freeIndex !== moveIndex) {
                        hasMoves = true
                        moves[freeIndex] = moveIndex
                        reverse[moveIndex] = freeIndex
                    }
                    moveIndex++
                }
                freeIndex++
            }
        }
        i++
    }

    if (hasMoves) {
        shuffle.moves = moves
    }

    return shuffle
}

function keyIndex(children) {
    var i, keys

    for (i = 0; i < children.length; i++) {
        var child = children[i]

        if (child.key !== undefined) {
            keys = keys || {}
            keys[child.key] = i
        }
    }

    return keys
}

function appendPatch(apply, patch) {
    if (apply) {
        if (isArray(apply)) {
            apply.push(patch)
        } else {
            apply = [apply, patch]
        }

        return apply
    } else {
        return patch
    }
}

},{"./handle-thunk":27,"./is-thunk":28,"./is-vnode":30,"./is-vtext":31,"./is-widget":32,"./vpatch":37,"is-object":33,"x-is-array":34}],27:[function(require,module,exports){
var isVNode = require("./is-vnode")
var isVText = require("./is-vtext")
var isWidget = require("./is-widget")
var isThunk = require("./is-thunk")

module.exports = handleThunk

function handleThunk(a, b) {
    var renderedA = a
    var renderedB = b

    if (isThunk(b)) {
        renderedB = renderThunk(b, a)
    }

    if (isThunk(a)) {
        renderedA = renderThunk(a, null)
    }

    return {
        a: renderedA,
        b: renderedB
    }
}

function renderThunk(thunk, previous) {
    var renderedThunk = thunk.vnode

    if (!renderedThunk) {
        renderedThunk = thunk.vnode = thunk.render(previous)
    }

    if (!(isVNode(renderedThunk) ||
            isVText(renderedThunk) ||
            isWidget(renderedThunk))) {
        throw new Error("thunk did not return a valid node");
    }

    return renderedThunk
}

},{"./is-thunk":28,"./is-vnode":30,"./is-vtext":31,"./is-widget":32}],28:[function(require,module,exports){
module.exports = isThunk

function isThunk(t) {
    return t && t.type === "Thunk"
}

},{}],29:[function(require,module,exports){
module.exports = isHook

function isHook(hook) {
    return hook && typeof hook.hook === "function" &&
        !hook.hasOwnProperty("hook")
}

},{}],30:[function(require,module,exports){
var version = require("./version")

module.exports = isVirtualNode

function isVirtualNode(x) {
    return x && x.type === "VirtualNode" && x.version === version
}

},{"./version":35}],31:[function(require,module,exports){
var version = require("./version")

module.exports = isVirtualText

function isVirtualText(x) {
    return x && x.type === "VirtualText" && x.version === version
}

},{"./version":35}],32:[function(require,module,exports){
module.exports = isWidget

function isWidget(w) {
    return w && w.type === "Widget"
}

},{}],33:[function(require,module,exports){
module.exports=require(21)
},{}],34:[function(require,module,exports){
module.exports=require(22)
},{}],35:[function(require,module,exports){
module.exports = "1"

},{}],36:[function(require,module,exports){
var version = require("./version")
var isVNode = require("./is-vnode")
var isWidget = require("./is-widget")
var isVHook = require("./is-vhook")

module.exports = VirtualNode

var noProperties = {}
var noChildren = []

function VirtualNode(tagName, properties, children, key, namespace) {
    this.tagName = tagName
    this.properties = properties || noProperties
    this.children = children || noChildren
    this.key = key != null ? String(key) : undefined
    this.namespace = (typeof namespace === "string") ? namespace : null

    var count = (children && children.length) || 0
    var descendants = 0
    var hasWidgets = false
    var descendantHooks = false
    var hooks

    for (var propName in properties) {
        if (properties.hasOwnProperty(propName)) {
            var property = properties[propName]
            if (isVHook(property)) {
                if (!hooks) {
                    hooks = {}
                }

                hooks[propName] = property
            }
        }
    }

    for (var i = 0; i < count; i++) {
        var child = children[i]
        if (isVNode(child)) {
            descendants += child.count || 0

            if (!hasWidgets && child.hasWidgets) {
                hasWidgets = true
            }

            if (!descendantHooks && (child.hooks || child.descendantHooks)) {
                descendantHooks = true
            }
        } else if (!hasWidgets && isWidget(child)) {
            if (typeof child.destroy === "function") {
                hasWidgets = true
            }
        }
    }

    this.count = count + descendants
    this.hasWidgets = hasWidgets
    this.hooks = hooks
    this.descendantHooks = descendantHooks
}

VirtualNode.prototype.version = version
VirtualNode.prototype.type = "VirtualNode"

},{"./is-vhook":29,"./is-vnode":30,"./is-widget":32,"./version":35}],37:[function(require,module,exports){
var version = require("./version")

VirtualPatch.NONE = 0
VirtualPatch.VTEXT = 1
VirtualPatch.VNODE = 2
VirtualPatch.WIDGET = 3
VirtualPatch.PROPS = 4
VirtualPatch.ORDER = 5
VirtualPatch.INSERT = 6
VirtualPatch.REMOVE = 7
VirtualPatch.THUNK = 8

module.exports = VirtualPatch

function VirtualPatch(type, vNode, patch) {
    this.type = Number(type)
    this.vNode = vNode
    this.patch = patch
}

VirtualPatch.prototype.version = version
VirtualPatch.prototype.type = "VirtualPatch"

},{"./version":35}],38:[function(require,module,exports){
var version = require("./version")

module.exports = VirtualText

function VirtualText(text) {
    this.text = String(text)
}

VirtualText.prototype.version = version
VirtualText.prototype.type = "VirtualText"

},{"./version":35}],39:[function(require,module,exports){

var VNode = require('vtree/vnode');
var VText = require('vtree/vtext');
var diff = require('vtree/diff');
var patch = require('vdom/patch');
var createElement = require('vdom/create-element');
var DataSet = require("data-set");
var Delegator = require("dom-delegator");
var isHook = require("vtree/is-vhook");

Elm.Native.VirtualDom = {};
Elm.Native.VirtualDom.make = function(elm) {
    elm.Native = elm.Native || {};
    elm.Native.VirtualDom = elm.Native.VirtualDom || {};
    if (elm.Native.VirtualDom.values) {
        return elm.Native.VirtualDom.values;
    }

    // This manages event listeners. Somehow...
    // Save a reference for use in on(...)
    var delegator = Delegator();

    var NativeElement = Elm.Native.Graphics.Element.make(elm);
    var Element = Elm.Graphics.Element.make(elm);
    var Json = Elm.Native.Json.make(elm);
    var List = Elm.Native.List.make(elm);
    var Utils = Elm.Native.Utils.make(elm);

    var ATTRIBUTE_KEY = 'UniqueNameThatOthersAreVeryUnlikelyToUse';

    function listToProperties(list) {
        var object = {};
        while (list.ctor !== '[]') {
            var entry = list._0;
            if (entry.key === ATTRIBUTE_KEY) {
              object.attributes = object.attributes || {};
              object.attributes[entry.value.attrKey] = entry.value.attrValue;
            }
            else {
              object[entry.key] = entry.value;
            }
            list = list._1;
        }
        return object;
    }

    function node(name, propertyList, contents) {
        var props = listToProperties(propertyList);

        var key, namespace;
        // support keys
        if (props.key !== undefined) {
            key = props.key;
            props.key = undefined;
        }

        // support namespace
        if (props.namespace !== undefined) {
            namespace = props.namespace;
            props.namespace = undefined;
        }

        // ensure that setting text of an input does not move the cursor
        var useSoftSet =
            name === 'input'
            && props.value !== undefined
            && !isHook(props.value);

        if (useSoftSet) {
            props.value = SoftSetHook(props.value);
        }

        return new VNode(name, props, List.toArray(contents), key, namespace);
    }

    function property(key, value) {
        return {
            key: key,
            value: value
        };
    }

    function attribute(key, value) {
        return {
            key: ATTRIBUTE_KEY,
            value: {
                attrKey: key,
                attrValue: value
            }
        };
    }

    function on(name, decoder, createMessage) {
        // Ensure we're listening for this type of event
        delegator.listenTo(name);
        function eventHandler(event) {
            var value = A2(Json.runDecoderValue, decoder, event);
            if (value.ctor === 'Ok') {
                createMessage(value._0)();
            }
        }
        return property(name, DataSetHook(eventHandler));
    }

    function DataSetHook(value) {
        if (!(this instanceof DataSetHook)) {
            return new DataSetHook(value);
        }

        this.value = value;
    }

    DataSetHook.prototype.hook = function (node, propertyName) {
        var ds = DataSet(node);
        ds[propertyName] = this.value;
    };


    function SoftSetHook(value) {
      if (!(this instanceof SoftSetHook)) {
        return new SoftSetHook(value);
      }

      this.value = value;
    }

    SoftSetHook.prototype.hook = function (node, propertyName) {
      if (node[propertyName] !== this.value) {
        node[propertyName] = this.value;
      }
    };

    function text(string) {
        return new VText(string);
    }

    function fromElement(element) {
        return {
            type: "Widget",

            element: element,

            init: function () {
                return NativeElement.render(element);
            },

            update: function (previous, node) {
                return NativeElement.update(node, previous.element, element);
            }
        };
    }

    function toElement(width, height, html) {
        return A3(Element.newElement, width, height,
                  { ctor: 'Custom'
                  , type: 'evancz/elm-html'
                  , render: render
                  , update: update
                  , model: html
                  });
    }

    function render(model) {
        var element = NativeElement.createNode('div');
        element.appendChild(createElement(model));
        return element;
    }

    function update(node, oldModel, newModel) {
        updateAndReplace(node.firstChild, oldModel, newModel);
        return node;
    }

    function updateAndReplace(node, oldModel, newModel) {
        var patches = diff(oldModel, newModel);
        var newNode = patch(node, patches);
        return newNode;
    }

    function lazyRef(fn, a) {
        function thunk() {
            return fn(a);
        }
        return new Thunk(fn, [a], thunk);
    }

    function lazyRef2(fn, a, b) {
        function thunk() {
            return A2(fn, a, b);
        }
        return new Thunk(fn, [a,b], thunk);
    }

    function lazyRef3(fn, a, b, c) {
        function thunk() {
            return A3(fn, a, b, c);
        }
        return new Thunk(fn, [a,b,c], thunk);
    }

    function Thunk(fn, args, thunk) {
        this.fn = fn;
        this.args = args;
        this.vnode = null;
        this.key = undefined;
        this.thunk = thunk;
    }

    Thunk.prototype.type = "Thunk";
    Thunk.prototype.update = updateThunk;
    Thunk.prototype.render = renderThunk;

    function shouldUpdate(current, previous) {
        if (current.fn !== previous.fn) {
            return true;
        }

        // if it's the same function, we know the number of args must match
        var cargs = current.args;
        var pargs = previous.args;

        for (var i = cargs.length; i--; ) {
            if (cargs[i] !== pargs[i]) {
                return true;
            }
        }

        return false;
    }

    function updateThunk(previous, domNode) {
        if (!shouldUpdate(this, previous)) {
            this.vnode = previous.vnode;
            return;
        }

        if (!this.vnode) {
            this.vnode = this.thunk();
        }

        var patches = diff(previous.vnode, this.vnode);
        patch(domNode, patches);
    }

    function renderThunk() {
        return this.thunk();
    }

    return Elm.Native.VirtualDom.values = {
        node: F3(node),
        text: text,
        on: F3(on),

        property: F2(property),
        attribute: F2(attribute),

        lazy: F2(lazyRef),
        lazy2: F3(lazyRef2),
        lazy3: F4(lazyRef3),

        toElement: F3(toElement),
        fromElement: fromElement,

        render: createElement,
        updateAndReplace: updateAndReplace
    };
};

},{"data-set":2,"dom-delegator":8,"vdom/create-element":18,"vdom/patch":24,"vtree/diff":26,"vtree/is-vhook":29,"vtree/vnode":36,"vtree/vtext":38}],40:[function(require,module,exports){

},{}]},{},[39]);

Elm.Native = Elm.Native || {};
Elm.Native.Window = {};
Elm.Native.Window.make = function(localRuntime) {

    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Window = localRuntime.Native.Window || {};
    if (localRuntime.Native.Window.values) {
        return localRuntime.Native.Window.values;
    }

    var Signal = Elm.Signal.make(localRuntime);
    var NS = Elm.Native.Signal.make(localRuntime);
    var Tuple2 = Elm.Native.Utils.make(localRuntime).Tuple2;

    function getWidth() {
        return localRuntime.node.clientWidth;
    }
    function getHeight() {
        if (localRuntime.isFullscreen()) {
            return window.innerHeight;
        }
        return localRuntime.node.clientHeight;
    }

    var dimensions = NS.input(Tuple2(getWidth(), getHeight()));
    dimensions.defaultNumberOfKids = 2;

    // Do not move width and height into Elm. By setting the default number of kids,
    // the resize listener can be detached.
    var width  = A2(Signal.map, function(p){return p._0;}, dimensions);
    width.defaultNumberOfKids = 0;

    var height = A2(Signal.map, function(p){return p._1;}, dimensions);
    height.defaultNumberOfKids = 0;

    function resizeIfNeeded() {
        // Do not trigger event if the dimensions have not changed.
        // This should be most of the time.
        var w = getWidth();
        var h = getHeight();
        if (dimensions.value._0 === w && dimensions.value._1 === h) return;

        setTimeout(function () {
            // Check again to see if the dimensions have changed.
            // It is conceivable that the dimensions have changed
            // again while some other event was being processed.
            var w = getWidth();
            var h = getHeight();
            if (dimensions.value._0 === w && dimensions.value._1 === h) return;
            localRuntime.notify(dimensions.id, Tuple2(w,h));
        }, 0);
    }
    localRuntime.addListener([dimensions.id], window, 'resize', resizeIfNeeded);

    return localRuntime.Native.Window.values = {
        dimensions: dimensions,
        width: width,
        height: height,
        resizeIfNeeded: resizeIfNeeded
    };

};

Elm.Result = Elm.Result || {};
Elm.Result.make = function (_elm) {
   "use strict";
   _elm.Result = _elm.Result || {};
   if (_elm.Result.values)
   return _elm.Result.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Result",
   $Maybe = Elm.Maybe.make(_elm);
   var toMaybe = function (result) {
      return function () {
         switch (result.ctor)
         {case "Err":
            return $Maybe.Nothing;
            case "Ok":
            return $Maybe.Just(result._0);}
         _U.badCase($moduleName,
         "between lines 158 and 171");
      }();
   };
   var Err = function (a) {
      return {ctor: "Err",_0: a};
   };
   var andThen = F2(function (result,
   callback) {
      return function () {
         switch (result.ctor)
         {case "Err":
            return Err(result._0);
            case "Ok":
            return callback(result._0);}
         _U.badCase($moduleName,
         "between lines 120 and 139");
      }();
   });
   var Ok = function (a) {
      return {ctor: "Ok",_0: a};
   };
   var map = F2(function (func,
   ra) {
      return function () {
         switch (ra.ctor)
         {case "Err": return Err(ra._0);
            case "Ok":
            return Ok(func(ra._0));}
         _U.badCase($moduleName,
         "between lines 35 and 46");
      }();
   });
   var map2 = F3(function (func,
   ra,
   rb) {
      return function () {
         var _v9 = {ctor: "_Tuple2"
                   ,_0: ra
                   ,_1: rb};
         switch (_v9.ctor)
         {case "_Tuple2":
            switch (_v9._0.ctor)
              {case "Err":
                 return Err(_v9._0._0);
                 case "Ok": switch (_v9._1.ctor)
                   {case "Ok": return Ok(A2(func,
                        _v9._0._0,
                        _v9._1._0));}
                   break;}
              switch (_v9._1.ctor)
              {case "Err":
                 return Err(_v9._1._0);}
              break;}
         _U.badCase($moduleName,
         "between lines 49 and 52");
      }();
   });
   var map3 = F4(function (func,
   ra,
   rb,
   rc) {
      return function () {
         var _v16 = {ctor: "_Tuple3"
                    ,_0: ra
                    ,_1: rb
                    ,_2: rc};
         switch (_v16.ctor)
         {case "_Tuple3":
            switch (_v16._0.ctor)
              {case "Err":
                 return Err(_v16._0._0);
                 case "Ok": switch (_v16._1.ctor)
                   {case "Ok":
                      switch (_v16._2.ctor)
                        {case "Ok": return Ok(A3(func,
                             _v16._0._0,
                             _v16._1._0,
                             _v16._2._0));}
                        break;}
                   break;}
              switch (_v16._1.ctor)
              {case "Err":
                 return Err(_v16._1._0);}
              switch (_v16._2.ctor)
              {case "Err":
                 return Err(_v16._2._0);}
              break;}
         _U.badCase($moduleName,
         "between lines 57 and 61");
      }();
   });
   var map4 = F5(function (func,
   ra,
   rb,
   rc,
   rd) {
      return function () {
         var _v26 = {ctor: "_Tuple4"
                    ,_0: ra
                    ,_1: rb
                    ,_2: rc
                    ,_3: rd};
         switch (_v26.ctor)
         {case "_Tuple4":
            switch (_v26._0.ctor)
              {case "Err":
                 return Err(_v26._0._0);
                 case "Ok": switch (_v26._1.ctor)
                   {case "Ok":
                      switch (_v26._2.ctor)
                        {case "Ok":
                           switch (_v26._3.ctor)
                             {case "Ok": return Ok(A4(func,
                                  _v26._0._0,
                                  _v26._1._0,
                                  _v26._2._0,
                                  _v26._3._0));}
                             break;}
                        break;}
                   break;}
              switch (_v26._1.ctor)
              {case "Err":
                 return Err(_v26._1._0);}
              switch (_v26._2.ctor)
              {case "Err":
                 return Err(_v26._2._0);}
              switch (_v26._3.ctor)
              {case "Err":
                 return Err(_v26._3._0);}
              break;}
         _U.badCase($moduleName,
         "between lines 66 and 71");
      }();
   });
   var map5 = F6(function (func,
   ra,
   rb,
   rc,
   rd,
   re) {
      return function () {
         var _v39 = {ctor: "_Tuple5"
                    ,_0: ra
                    ,_1: rb
                    ,_2: rc
                    ,_3: rd
                    ,_4: re};
         switch (_v39.ctor)
         {case "_Tuple5":
            switch (_v39._0.ctor)
              {case "Err":
                 return Err(_v39._0._0);
                 case "Ok": switch (_v39._1.ctor)
                   {case "Ok":
                      switch (_v39._2.ctor)
                        {case "Ok":
                           switch (_v39._3.ctor)
                             {case "Ok":
                                switch (_v39._4.ctor)
                                  {case "Ok": return Ok(A5(func,
                                       _v39._0._0,
                                       _v39._1._0,
                                       _v39._2._0,
                                       _v39._3._0,
                                       _v39._4._0));}
                                  break;}
                             break;}
                        break;}
                   break;}
              switch (_v39._1.ctor)
              {case "Err":
                 return Err(_v39._1._0);}
              switch (_v39._2.ctor)
              {case "Err":
                 return Err(_v39._2._0);}
              switch (_v39._3.ctor)
              {case "Err":
                 return Err(_v39._3._0);}
              switch (_v39._4.ctor)
              {case "Err":
                 return Err(_v39._4._0);}
              break;}
         _U.badCase($moduleName,
         "between lines 76 and 117");
      }();
   });
   var formatError = F2(function (f,
   result) {
      return function () {
         switch (result.ctor)
         {case "Err":
            return Err(f(result._0));
            case "Ok":
            return Ok(result._0);}
         _U.badCase($moduleName,
         "between lines 142 and 155");
      }();
   });
   var fromMaybe = F2(function (err,
   maybe) {
      return function () {
         switch (maybe.ctor)
         {case "Just":
            return Ok(maybe._0);
            case "Nothing":
            return Err(err);}
         _U.badCase($moduleName,
         "between lines 174 and 176");
      }();
   });
   _elm.Result.values = {_op: _op
                        ,Ok: Ok
                        ,Err: Err
                        ,map: map
                        ,map2: map2
                        ,map3: map3
                        ,map4: map4
                        ,map5: map5
                        ,andThen: andThen
                        ,formatError: formatError
                        ,toMaybe: toMaybe
                        ,fromMaybe: fromMaybe};
   return _elm.Result.values;
};
Elm.Signal = Elm.Signal || {};
Elm.Signal.make = function (_elm) {
   "use strict";
   _elm.Signal = _elm.Signal || {};
   if (_elm.Signal.values)
   return _elm.Signal.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Signal",
   $Basics = Elm.Basics.make(_elm),
   $List = Elm.List.make(_elm),
   $Native$Signal = Elm.Native.Signal.make(_elm);
   var subscribe = $Native$Signal.subscribe;
   var send = $Native$Signal.send;
   var channel = $Native$Signal.input;
   var Message = {ctor: "Message"};
   var Channel = {ctor: "Channel"};
   _op["~"] = F2(function (sf,s) {
      return A3($Native$Signal.map2,
      F2(function (f,x) {
         return f(x);
      }),
      sf,
      s);
   });
   _op["<~"] = F2(function (f,s) {
      return A2($Native$Signal.map,
      f,
      s);
   });
   var sampleOn = $Native$Signal.sampleOn;
   var dropRepeats = $Native$Signal.dropRepeats;
   var dropIf = $Native$Signal.dropIf;
   var keepIf = $Native$Signal.keepIf;
   var keepWhen = F3(function (bs,
   def,
   sig) {
      return A2(_op["<~"],
      $Basics.snd,
      A3(keepIf,
      $Basics.fst,
      {ctor: "_Tuple2"
      ,_0: false
      ,_1: def},
      A2(_op["~"],
      A2(_op["<~"],
      F2(function (v0,v1) {
         return {ctor: "_Tuple2"
                ,_0: v0
                ,_1: v1};
      }),
      A2(sampleOn,sig,bs)),
      sig)));
   });
   var dropWhen = function (bs) {
      return keepWhen(A2(_op["<~"],
      $Basics.not,
      bs));
   };
   var merge = $Native$Signal.merge;
   var mergeMany = function (signals) {
      return A2($List.foldr1,
      merge,
      signals);
   };
   var foldp = $Native$Signal.foldp;
   var map5 = $Native$Signal.map5;
   var map4 = $Native$Signal.map4;
   var map3 = $Native$Signal.map3;
   var map2 = $Native$Signal.map2;
   var map = $Native$Signal.map;
   var constant = $Native$Signal.constant;
   var Signal = {ctor: "Signal"};
   _elm.Signal.values = {_op: _op
                        ,Signal: Signal
                        ,constant: constant
                        ,map: map
                        ,map2: map2
                        ,map3: map3
                        ,map4: map4
                        ,map5: map5
                        ,foldp: foldp
                        ,merge: merge
                        ,mergeMany: mergeMany
                        ,keepIf: keepIf
                        ,dropIf: dropIf
                        ,keepWhen: keepWhen
                        ,dropWhen: dropWhen
                        ,dropRepeats: dropRepeats
                        ,sampleOn: sampleOn
                        ,Channel: Channel
                        ,Message: Message
                        ,channel: channel
                        ,send: send
                        ,subscribe: subscribe};
   return _elm.Signal.values;
};
Elm.String = Elm.String || {};
Elm.String.make = function (_elm) {
   "use strict";
   _elm.String = _elm.String || {};
   if (_elm.String.values)
   return _elm.String.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "String",
   $Maybe = Elm.Maybe.make(_elm),
   $Native$String = Elm.Native.String.make(_elm),
   $Result = Elm.Result.make(_elm);
   var fromList = $Native$String.fromList;
   var toList = $Native$String.toList;
   var toFloat = $Native$String.toFloat;
   var toInt = $Native$String.toInt;
   var indices = $Native$String.indexes;
   var indexes = $Native$String.indexes;
   var endsWith = $Native$String.endsWith;
   var startsWith = $Native$String.startsWith;
   var contains = $Native$String.contains;
   var all = $Native$String.all;
   var any = $Native$String.any;
   var toLower = $Native$String.toLower;
   var toUpper = $Native$String.toUpper;
   var lines = $Native$String.lines;
   var words = $Native$String.words;
   var trimRight = $Native$String.trimRight;
   var trimLeft = $Native$String.trimLeft;
   var trim = $Native$String.trim;
   var padRight = $Native$String.padRight;
   var padLeft = $Native$String.padLeft;
   var pad = $Native$String.pad;
   var dropRight = $Native$String.dropRight;
   var dropLeft = $Native$String.dropLeft;
   var right = $Native$String.right;
   var left = $Native$String.left;
   var slice = $Native$String.slice;
   var repeat = $Native$String.repeat;
   var join = $Native$String.join;
   var split = $Native$String.split;
   var foldr = $Native$String.foldr;
   var foldl = $Native$String.foldl;
   var reverse = $Native$String.reverse;
   var filter = $Native$String.filter;
   var map = $Native$String.map;
   var length = $Native$String.length;
   var concat = $Native$String.concat;
   var append = $Native$String.append;
   var uncons = $Native$String.uncons;
   var cons = $Native$String.cons;
   var fromChar = function ($char) {
      return A2(cons,$char,"");
   };
   var isEmpty = $Native$String.isEmpty;
   _elm.String.values = {_op: _op
                        ,isEmpty: isEmpty
                        ,cons: cons
                        ,fromChar: fromChar
                        ,uncons: uncons
                        ,append: append
                        ,concat: concat
                        ,length: length
                        ,map: map
                        ,filter: filter
                        ,reverse: reverse
                        ,foldl: foldl
                        ,foldr: foldr
                        ,split: split
                        ,join: join
                        ,repeat: repeat
                        ,slice: slice
                        ,left: left
                        ,right: right
                        ,dropLeft: dropLeft
                        ,dropRight: dropRight
                        ,pad: pad
                        ,padLeft: padLeft
                        ,padRight: padRight
                        ,trim: trim
                        ,trimLeft: trimLeft
                        ,trimRight: trimRight
                        ,words: words
                        ,lines: lines
                        ,toUpper: toUpper
                        ,toLower: toLower
                        ,any: any
                        ,all: all
                        ,contains: contains
                        ,startsWith: startsWith
                        ,endsWith: endsWith
                        ,indexes: indexes
                        ,indices: indices
                        ,toInt: toInt
                        ,toFloat: toFloat
                        ,toList: toList
                        ,fromList: fromList};
   return _elm.String.values;
};
Elm.Text = Elm.Text || {};
Elm.Text.make = function (_elm) {
   "use strict";
   _elm.Text = _elm.Text || {};
   if (_elm.Text.values)
   return _elm.Text.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Text",
   $Basics = Elm.Basics.make(_elm),
   $Color = Elm.Color.make(_elm),
   $Graphics$Element = Elm.Graphics.Element.make(_elm),
   $List = Elm.List.make(_elm),
   $Maybe = Elm.Maybe.make(_elm),
   $Native$Text = Elm.Native.Text.make(_elm);
   var markdown = $Native$Text.markdown;
   var justified = $Native$Text.justified;
   var centered = $Native$Text.centered;
   var rightAligned = $Native$Text.rightAligned;
   var leftAligned = $Native$Text.leftAligned;
   var line = $Native$Text.line;
   var italic = $Native$Text.italic;
   var bold = $Native$Text.bold;
   var color = $Native$Text.color;
   var height = $Native$Text.height;
   var link = $Native$Text.link;
   var monospace = $Native$Text.monospace;
   var typeface = $Native$Text.typeface;
   var style = $Native$Text.style;
   var append = $Native$Text.append;
   var fromString = $Native$Text.fromString;
   var empty = fromString("");
   var concat = function (texts) {
      return A3($List.foldr,
      append,
      empty,
      texts);
   };
   var join = F2(function (seperator,
   texts) {
      return concat(A2($List.intersperse,
      seperator,
      texts));
   });
   var plainText = function (str) {
      return leftAligned(fromString(str));
   };
   var asText = function (value) {
      return leftAligned(monospace(fromString($Basics.toString(value))));
   };
   var defaultStyle = {_: {}
                      ,bold: false
                      ,color: $Color.black
                      ,height: $Maybe.Nothing
                      ,italic: false
                      ,line: $Maybe.Nothing
                      ,typeface: _L.fromArray([])};
   var Style = F6(function (a,
   b,
   c,
   d,
   e,
   f) {
      return {_: {}
             ,bold: d
             ,color: c
             ,height: b
             ,italic: e
             ,line: f
             ,typeface: a};
   });
   var Through = {ctor: "Through"};
   var Over = {ctor: "Over"};
   var Under = {ctor: "Under"};
   var Text = {ctor: "Text"};
   _elm.Text.values = {_op: _op
                      ,Text: Text
                      ,Under: Under
                      ,Over: Over
                      ,Through: Through
                      ,Style: Style
                      ,defaultStyle: defaultStyle
                      ,fromString: fromString
                      ,empty: empty
                      ,append: append
                      ,concat: concat
                      ,join: join
                      ,style: style
                      ,typeface: typeface
                      ,monospace: monospace
                      ,link: link
                      ,height: height
                      ,color: color
                      ,bold: bold
                      ,italic: italic
                      ,line: line
                      ,leftAligned: leftAligned
                      ,rightAligned: rightAligned
                      ,centered: centered
                      ,justified: justified
                      ,plainText: plainText
                      ,markdown: markdown
                      ,asText: asText};
   return _elm.Text.values;
};
Elm.Transform2D = Elm.Transform2D || {};
Elm.Transform2D.make = function (_elm) {
   "use strict";
   _elm.Transform2D = _elm.Transform2D || {};
   if (_elm.Transform2D.values)
   return _elm.Transform2D.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Transform2D",
   $Native$Transform2D = Elm.Native.Transform2D.make(_elm);
   var multiply = $Native$Transform2D.multiply;
   var rotation = $Native$Transform2D.rotation;
   var matrix = $Native$Transform2D.matrix;
   var translation = F2(function (x,
   y) {
      return A6(matrix,
      1,
      0,
      0,
      1,
      x,
      y);
   });
   var scale = function (s) {
      return A6(matrix,
      s,
      0,
      0,
      s,
      0,
      0);
   };
   var scaleX = function (x) {
      return A6(matrix,
      x,
      0,
      0,
      1,
      0,
      0);
   };
   var scaleY = function (y) {
      return A6(matrix,
      1,
      0,
      0,
      y,
      0,
      0);
   };
   var identity = $Native$Transform2D.identity;
   var Transform2D = {ctor: "Transform2D"};
   _elm.Transform2D.values = {_op: _op
                             ,identity: identity
                             ,matrix: matrix
                             ,multiply: multiply
                             ,rotation: rotation
                             ,translation: translation
                             ,scale: scale
                             ,scaleX: scaleX
                             ,scaleY: scaleY};
   return _elm.Transform2D.values;
};
Elm.VirtualDom = Elm.VirtualDom || {};
Elm.VirtualDom.make = function (_elm) {
   "use strict";
   _elm.VirtualDom = _elm.VirtualDom || {};
   if (_elm.VirtualDom.values)
   return _elm.VirtualDom.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "VirtualDom",
   $Graphics$Element = Elm.Graphics.Element.make(_elm),
   $Json$Decode = Elm.Json.Decode.make(_elm),
   $Native$VirtualDom = Elm.Native.VirtualDom.make(_elm),
   $Signal = Elm.Signal.make(_elm);
   var lazy3 = $Native$VirtualDom.lazy3;
   var lazy2 = $Native$VirtualDom.lazy2;
   var lazy = $Native$VirtualDom.lazy;
   var on = $Native$VirtualDom.on;
   var attribute = $Native$VirtualDom.attribute;
   var property = $Native$VirtualDom.property;
   var Property = {ctor: "Property"};
   var fromElement = $Native$VirtualDom.fromElement;
   var toElement = $Native$VirtualDom.toElement;
   var text = $Native$VirtualDom.text;
   var node = $Native$VirtualDom.node;
   var Node = {ctor: "Node"};
   _elm.VirtualDom.values = {_op: _op
                            ,Node: Node
                            ,node: node
                            ,text: text
                            ,toElement: toElement
                            ,fromElement: fromElement
                            ,Property: Property
                            ,property: property
                            ,attribute: attribute
                            ,on: on
                            ,lazy: lazy
                            ,lazy2: lazy2
                            ,lazy3: lazy3};
   return _elm.VirtualDom.values;
};
Elm.Window = Elm.Window || {};
Elm.Window.make = function (_elm) {
   "use strict";
   _elm.Window = _elm.Window || {};
   if (_elm.Window.values)
   return _elm.Window.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _P = _N.Ports.make(_elm),
   $moduleName = "Window",
   $Native$Window = Elm.Native.Window.make(_elm),
   $Signal = Elm.Signal.make(_elm);
   var height = $Native$Window.height;
   var width = $Native$Window.width;
   var dimensions = $Native$Window.dimensions;
   _elm.Window.values = {_op: _op
                        ,dimensions: dimensions
                        ,width: width
                        ,height: height};
   return _elm.Window.values;
};
