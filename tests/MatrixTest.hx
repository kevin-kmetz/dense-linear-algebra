/*
 * dense-linear-algebra/tests/MatrixTest.hx
 */

package tests;

import dense.Matrix;

private final assert = Assert.assert;
private typedef FloatVector = haxe.ds.Vector<Float>;

class MatrixTest {
  public static function run():Void {
    trace("Now running all tests for the class dense.Matrix...");

    fromArrayTest();
    fromArrayOfArraysTest();

    trace("...all tests passed!");
  }

  private static function fromArrayTest():Void {
    final array = [8.0, 6.0, 7.0, 5.0, 3.0, 0.0];

    final mat1 = Matrix.fromArray(3, 2, array);
    assert(mat1.rows == 3);
    assert(mat1.columns == 2);

    final mat2 = Matrix.fromArray(2, 3, array);

    final mat3 = Matrix.fromArray(6, 1, array);
    assert(mat3.rows == 6);

    final mat4 = Matrix.fromArray(1, 6, array);
  }

  private static function fromArrayOfArraysTest():Void {
    final arrayArray = [
      [10.0, 20.0, 30.0, 40.0],
      [100.0, 200.0, 300.0, 400.0],
      [1000.0, 2000.0, 3000.0, 4000.0],
    ];

    final matrix = Matrix.fromArrayOfArrays(arrayArray);

    assert(matrix.rows == 3);
    assert(matrix.columns == 4);
  }
}

