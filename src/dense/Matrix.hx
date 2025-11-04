/*
 * dense-linear-algebra/src/dense/Matrix.hx
 *
 * A class representing an immutable mathematical dense matrix of floating point
 * numbers, of fixed and arbitrary dimensions.
 */

package dense;

typedef FloatVector = haxe.ds.Vector<Float>;

class Matrix {
  private final vector:FloatVector;

  public final rowCount:Int;
  public final columnCount:Int;

  private function new(rows:Int, columns:Int, haxeVector:FloatVector) {}

  // public static function fromArray(rows:Int, columns:Int, array:Array<Float>):Matrix {}
  // public static function fromArrayOfArrays(array:Array<Array<Float>>):Matrix {}
  // public static function fromHaxeVector(rows:Int, columns:Int, haxeVector:FloatVector):Matrix {}
  // public static function generate(rows:Int, columns:Int, func:(Int, Int) -> Float):Matrix {}
  // public static function generateByLinearIndex(rows:Int, columns:Int, func:Int -> Float):Matrix {}
  // public static function randomized(rows:Int, columns:Int, min:Float, max:Float):Matrix {}
  // public static function zero(rows:Int, columns:Int):Matrix {}
  // public static function identity(sideLength:Int):Matrix {}

  // public function clone():Matrix {}
  // public function equals(other:Matrix, threshold:Float):Bool {}
  // public function toString():String {}
  // public function get(rowIndex:Int, columnIndex:Int):Float {}
  // public function map(func:Float -> Float):Matrix {}
  // public function mapIndex(func:(Int, Int, Float) -> Float):Matrix {}

  // public function transpose():Matrix {}

  // public function addMatrix(other:Matrix):Matrix {}
  // public function subtractMatrix(other:Matrix):Matrix {}
  // public function multiplyMatrix(other:Matrix):Matrix {}

  // public function multiplyVector(other:Vector):Matrix {}

  // public function addScalar(other:Float):Matrix {}
  // public function subtractScalar(other:Float):Matrix {}
  // public function multiplyScalar(other:Float):Matrix {}
  // public function divideScalar(other:Float):Matrix {}
}

