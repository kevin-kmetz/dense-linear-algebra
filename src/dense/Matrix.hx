/*
 * dense-linear-algebra/src/dense/Matrix.hx
 *
 * A class representing an immutable mathematical dense matrix of floating point
 * numbers, of fixed and arbitrary dimensions.
 */

package dense;

private typedef FloatVector = haxe.ds.Vector<Float>;

class Matrix {
  private final vector:FloatVector;

  public final rows:Int;
  public final columns:Int;

  private function new(rows:Int, columns:Int, haxeVector:FloatVector) {
    if (rows < 1) throw "Invalid number of rows for matrix.";
    if (columns < 1) throw "Invalid number of columns for matrix.";
    if (rows * columns != haxeVector.length) {
      throw "Supplied data does not match stated shape of matrix.";
    }

    vector = haxeVector;
    this.rows = rows;
    this.columns = columns;
  }

  public static function fromArray(
    rows:Int, columns:Int, array:Array<Float>
  ):Matrix {
    return new Matrix(rows, columns, FloatVector.fromArrayCopy(array));
  }

  public static function fromArrayOfArrays(array:Array<Array<Float>>):Matrix {
    final impliedRowCount = array.length;
    if (impliedRowCount < 1) throw "Invalid number of rows for matrix.";

    final impliedColumnCount = array[0].length;
    if (impliedColumnCount < 1) throw "Invalid number of columns for matrix.";

    var mergedArray = array[0].copy();

    for (i in 1...impliedRowCount) {
      if (array[i].length != impliedColumnCount) {
        throw "Inconsistent column count among rows in supplied array of arrays.";
      }

      mergedArray = mergedArray.concat(array[i]);
    }

    return new Matrix(
      impliedRowCount,
      impliedColumnCount,
      FloatVector.fromArrayCopy(mergedArray)
    );
  }

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

