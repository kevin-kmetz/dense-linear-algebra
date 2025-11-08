# dense-linear-algebra
A simple, portable, Haxe-only linear algebra library that implements dense vectors and dense matrices of arbitrary dimensions. The matrices are CPU-based, and don't involve SIMD, CUDA, or OpenGL. The focus is on simplicity, portability, and convenience-of-use, not speed, optimization, or efficiency.

## Table of Contents

## Motivation

## Exposed Classes and Methods

### dense.Vector
```haxe
public final length:Int;
public static function fromArray(array:Array<Float>):Vector;
public static function fromHaxeVector(haxeVector:FloatVector):Vector;
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
public static function fromArray(rows:Int, columns:Int, haxeVector:FloatVector):Matrix;
public static function fromArrayOfArrays(array:Array<Array<Float>>):Matrix;
public static function fromHaxeVector(rows:Int, columns:Int, haxeVector:FloatVector;
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


