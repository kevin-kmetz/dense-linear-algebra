# dense-linear-algebra
A simple, portable, zero-dependency, immutable linear algebra library that implements dense vectors and dense matrices of arbitrary dimensions. The matrices are CPU-based, and don't involve SIMD, CUDA, or OpenGL. The focus is on simplicity, portability, and convenience-of-use, not speed, optimization, or efficiency.
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

## Table of Contents
- [Motivation](#motivation)
- [Installation](#installation)
- [Building](#building)
- [Running Unit Tests](#running-unit-tests)
- [Usage (with Haxe)](#usage-with-haxe)
- [Exposed Classes and Methods](#exposed-classes-and-methods)
  - [dense.Vector](#densevector)
  - [dense.Matrix](#densematrix)
- [Usage as a Target-specific Module](#usage-as-a-target-specific-module)
  - [Lua](#lua)
  - [JavaScript (Node)](#javascript-node)
  - [Python](#python)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Status and Maintenance](#status-and-maintenance)

## Motivation

## Installation

## Building
Typically, if one is writing a Haxe program that makes use of this library, if not installed via haxelib, then one would `git clone` the reposity, and then in the HXML file for a custom Haxe project, the `--class-path` option would be used to point to the project to the source folder from the dense-linear-algebra repository directory so that the dense package can be seen.

If one merely wants to build the library to a specific target to be used as an importable module, the following can be done, which builds importable modules for the Lua, JavaScript, and Python Haxe targets:

```
git clone https://github.com/kevin-kmetz/dense-linear-algebra.git

cd dense-linear-algebra

haxe build_modules_for_scripting_targets.hxml

cd build/lib

ls -l
```
See the [Usage as a Target-specific Module](#usage-as-a-target-specific-module) section below for how to use the built modules within scripts in each of those languages.

The library can also be built for other non-scripting Haxe targets using the `haxe` command and corresponding target-specific options.

## Running Unit Tests
To run a quick test over which just makes use of the `haxe --run` target, the following can be run from the root directory of the project:

```
haxe run_tests_quick.hxml
```

To run the unit tests but across most of the targets that Haxe has to offer, the following can be run from the root directory of the project:

```
haxe run_tests_most_targets.hxml
```

The above assumes that the proper compilation toolchains are installed for each of the targets.

## Usage (with Haxe)
The default constructors for both classes are private, and instances of each class are meant to be created using various provided public static factory methods.

```haxe
import dense.Vector;
import dense.Matrix;

final vec = Vector.fromArray([2.0, 5.0, 7.0]);
final anotherVec = vec.multiplyScalar(3.0);

final mat = Matrix.fromArrayOfArrays([
  [-1.0, -3.0, -5.0],
  [10.0, 20.0, 30.0],
  [-5.0, 0.0, 5.0],
  [0.0, 100.0, 0.0],
]);

// The following method treats vectors as right-hand column vectors:
final matrixVectorProduct = matrix.multiplyVector(vec);
```

Individual elements of vectors and methods are not intended to be set after initial creation of any particular vector or matrix - that is by design. Elements can be set individually at time of creation using factory methods that provide an index or a row and column index. These factory methods take a function as an argument, which would be a fantastic place to use a lambda, and if any variable-dependent behavior is needed, a closure.

Both vectors and the rows and columns of matrices are indexed starting with zero, as is the norm with other Haxe data structures.

## Exposed Classes and Methods

### dense.Vector
```haxe
public final length:Int;
public static function fromArray(array:Array<Float>):Vector;
public static function fromHaxeVector(haxeVector:haxe.ds.Vector<Float>):Vector;
public static function generate(length:Int, func: Int -> Float):Vector;
public static function randomized(length:Int, ?min:Float, ?max:Float):Vector;
public static function zero(length:Int):Vector;
public function clone():Vector;
public function equals(other:Vector, threshold:Float):Bool;
public function toString():String;
public function get(index:Int):Float;
public function map(func:Float -> Float):Vector;
public function magnitude():Float;
public function normalize():Vector;
public function dotProduct(other:Vector):Float;
public function crossProduct(otherVec3:Vector):Vector;
public function addVector(other:Vector):Vector;
public function subtractVector(other:Vector):Vector;
public function negate():Vector;
public function addScalar(scalar:Float):Vector;
public function subtractScalar(scalar:Float):Vector;
public function multiplyScalar(scalar:Float):Vector;
public function divideScalar(scalar:Float):Vector;
public function asMatrixColumn():Matrix;
public function asMatrixRow():Matrix;
```

### dense.Matrix
```haxe
public final rows:Int;
public final columns:Int;
public static function fromArray(rows:Int, columns:Int, haxeVector:Array<Float>):Matrix;
public static function fromArrayOfArrays(array:Array<Array<Float>>):Matrix;
public static function fromHaxeVector(rows:Int, columns:Int, haxeVector:haxe.ds.Vector<Float>):Matrix;
public static function generate(rows:Int, columns:Int, func:(Int, Int) -> Float):Matrix;
public static function generateByLinearIndex(rows:Int, columns:Int, func:Int -> Float):Matrix;
public static function randomized():Matrix
public static function zero(rows:Int, columns:Int):Matrix;
public static function identity(sideLength:Int):Matrix;
public function clone():Matrix;
public function equals(other:Matrix, threshold:Float):Bool;
public function toString():String;
public function get(rowIndex:Int, columnIndex:Int):Float;
public function map(func:Float -> Float):Matrix;
public function mapIndex(func:(Int, Int, Float) -> Float):Matrix;
public function transpose():Matrix;
public function addMatrix(other:Matrix):Matrix;
public function subtractMatrix(other:Matrix):Matrix;
public function multiplyMatrix(other:Matrix):Matrix;
public function multiplyVector(other:Vector):Matrix;
public function addScalar(scalar:Float):Matrix;
public function subtractScalar(scalar:Float):Matrix;
public function multiplyScalar(scalar:Float):Matrix;
public function divideScalar(scalar:Float):Matrix;
public function negate():Matrix;
public function getRow(rowIndex:Int):Vector;
public function getColumn(columnIndex:Int):Vector;
public function hasSameDimensions(other:Matrix):Bool;
```

## Usage as a Target-specific Module

The library can be compiled as an importable module for each of the Haxe targets. An HXML build script "build_modules_for_scripting_targets.hxml" can be run with the `haxe` command, which will then build importable libraries for Lua, JavaScript (Node), and Python in corresponding folders under "./bin/lib/".

While the modules can of course be used within scripts in each of the targets, the primary motivation for offering them as such was so that the library can be used and experimented with from a REPL environment, and then used in a fully compiled capacity for more serious application.

### Lua
From a Lua REPL:

```lua
dense = require 'dense_linear_algebra'.dense
Vector, Matrix = dense.Vector, dense.Matrix

vec = Vector.new(7, function(i) return 5.0 * i - 1.0 end)
vec:substractScalar(3.0)
```

### JavaScript (Node)
From a Node REPL:

```javascript
const { dense } = require('./dense_linear_algebra');
const { Vector, Matrix } = dense;

const mat = Matrix.fromArrayOfArrays([
  [10.0, 20.0, 30.0, 1.0],
  [55.0, 77.0, 99.0, 2.0],
  [-2.0, -4.0, -6.0, 3.0],
]);

const transposed = mat.transpose();
```

### Python
From a Python REPL:

```python
from dense_linear_algebra import dense_Vector as Vector, dense_Matrix as Matrix

mat = Matrix.randomized(5, 3)
print(mat.toString())
```

## Roadmap

## Contributing

## Status and Maintenance

Unless this README explicitly states otherwise, this project is being actively maintained, regardless of how much time has elapsed since the last commit or update. If any issues or improvements are needed or desired, feel free to contribute, open an issue, or reach out to the maintainer at "kevin.kmetz@protonmail.com".
