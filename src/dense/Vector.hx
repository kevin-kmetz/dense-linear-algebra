/*
 * dense-linear-algebra/src/dense/Vector.hx
 *
 * A class representing an immutable mathematical dense vector of floating point
 * numbers, of fixed and arbitrary size.
 */

package dense;

typedef FloatVector = haxe.ds.Vector<Float>;

class Vector {
  private final vector:FloatVector;

  public final length:Int;

  private function new(haxeVector:FloatVector) {
    vector = haxeVector.copy();
    length = haxeVector.length;

    trace("Vector.");
  }

  public static function fromArray(array:Array<Float>):Vector {
    return new Vector(FloatVector.fromArrayCopy(array));
  }

  // public static function fromHaxeVector(haxeVector:FloatVector):Vector {}
  // public static function generate(length:Int, func: Int -> Float):Vector {}
  // public static function randomized(length:Int, min:Float, max:Float):Vector {}
  // public static function zero(length:Int):Vector {}
  // public static function unit(length:Int):Vector {}

  // public function clone():Vector {}
  // public function equals(other:Vector, threshold:Float):Bool {}
  // public function toString():String {}
  // public function get(index:Int):Float {}
  // public function map(func:Float -> Float):Vector {}

  // public function magnitude():Float {}
  // public function norm(p:Float):Float {}
  // public function normalize():Vector {}
  // public function dotProduct(other:Vector):Float {}

  // public function crossProduct(otherVec3:Vector):Vector {}

  // public function addVector(other:Vector):Vector {}
  // public function subtractVector(other:Vector):Vector {}
  // public function outerProduct(other:Vector):Matrix {}
  // public function negate():Vector {}

  // public function addScalar(scalar:Float):Vector {}
  // public function subtractScalar(scalar:Float):Vector {}
  // public function multiplyScalar(scalar:Float):Vector {}
  // public function divideScalar(scalar:Float):Vector {}

  // public function asMatrixColumn():Matrix {}
  // public function asMatrixRow():Matrix {}
}

