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
    fromHaxeVectorTest();
    generateTest();
    generateByLinearIndexTest();

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

  private static function fromHaxeVectorTest():Void {
    final rows = 2, columns = 3;
    final haxeVec = new FloatVector(6);

    haxeVec[0] = 7.0;
    haxeVec[1] = 14.0;
    haxeVec[2] = 21.0;
    haxeVec[3] = 500.0;
    haxeVec[4] = 1000.0;
    haxeVec[5] = 1500.0;

    final matrix = Matrix.fromHaxeVector(rows, columns, haxeVec);

    assert(matrix.rows == rows);
    assert(matrix.columns == columns);
    assert(matrix.get(0, 0) == haxeVec[0]);
    assert(matrix.get(1, 0) == haxeVec[3]);
    assert(matrix.get(1, 2) == haxeVec[5]);
  }

  private static function generateTest():Void {
    final genFunc = (row:Int, column:Int) -> 100.0 * row + 5 * column;
    final rows = 3, columns = 4;
    final expected = [
      [0.0, 5.0, 10.0, 15.0],
      [100.0, 105.0, 110.0, 115.0],
      [200.0, 205.0, 210.0, 215.0],
    ];

    final matrix = Matrix.generate(rows, columns, genFunc);

    for (r in 0...rows) {
      for (c in 0...columns) {
        assert(matrix.get(r, c) == expected[r][c]);
      }
    }
  }

  private static function generateByLinearIndexTest():Void {
    final genFunc = (index:Int) -> 5.0 * index - 1.0;
    final rows = 3, columns = 4;
    final expected = [
      [-1.0, 4.0, 9.0, 14.0],
      [19.0, 24.0, 29.0, 34.0],
      [39.0, 44.0, 49.0, 54.0],
    ];

    final matrix = Matrix.generateByLinearIndex(rows, columns, genFunc);

    for (r in 0...rows) {
      for (c in 0...columns) {
        assert(matrix.get(r, c) == expected[r][c]);
      }
    }
  }
}

