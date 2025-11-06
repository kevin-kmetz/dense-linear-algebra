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
    randomizedTest();
    zeroTest();
    identityTest();
    equalsTest();

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

  private static function randomizedTest():Void {
    final validateValues = function (matrix:Matrix, min:Float, max:Float):Bool {
      var allValuesWithinRange = true;

      for (r in 0...matrix.rows) {
        for (c in 0...matrix.columns) {
          final value = matrix.get(r, c);

          if (value < min || value > max) {
            allValuesWithinRange = false;
            break;
          }
        }
      }

      return allValuesWithinRange;
    };

    final mat1 = Matrix.randomized(5, 10, -5.0, 7.5);
    assert(mat1.rows == 5);
    assert(mat1.columns == 10);
    assert(validateValues(mat1, -5.0, 7.5));

    final mat2 = Matrix.randomized(4, 5);
    assert(mat2.rows == 4);
    assert(mat2.columns == 5);
    assert(validateValues(mat2, 0.0, 1.0));

    final mat3 = Matrix.randomized(6, 6, -23.0);
    assert(mat3.rows == 6);
    assert(mat3.columns == 6);
    assert(validateValues(mat3, -23.0, 1.0));

    final mat4 = Matrix.randomized(8, 5, null, 75.2);
    assert(mat4.rows == 8);
    assert(mat4.columns == 5);
    assert(validateValues(mat4, 0.0, 75.2));
  }

  private static function zeroTest():Void {
    final rows = 100, columns = 150;
    final matrix = Matrix.zero(rows, columns);

    assert(matrix.rows == rows);
    assert(matrix.columns == columns);

    for (r in 0...matrix.rows) {
      for (c in 0...matrix.columns) {
        assert(matrix.get(r, c) == 0.0);
      }
    }
  }

  private static function identityTest():Void {
    final sideLength = 200;
    final matrix = Matrix.identity(sideLength);

    assert(matrix.rows == sideLength);
    assert(matrix.columns == sideLength);

    for (r in 0...sideLength) {
      for (c in 0...sideLength) {
        if (r == c) {
          assert(matrix.get(r, c) == 1.0);
        } else {
          assert(matrix.get(r, c) == 0.0);
        }
      }
    }
  }

  private static function equalsTest():Void {
    final mat1 = Matrix.fromArrayOfArrays([
      [0.0, 1.0, 2.0, 3.0, 4.0],
      [50.0, 60.0, 70.0, 80.0, 90.0],
    ]);

    final mat2 = Matrix.fromArray(
      2, 5,
      [0.0, 1.0, 2.0, 3.0, 4.0, 50.0, 60.0, 70.0, 80.0, 90.0]
    );

    assert(mat1.equals(mat2, 0.00000000001));
    assert(mat2.equals(mat1, 0.00000000001));

    final mat3 = Matrix.fromArrayOfArrays([
      [0.000008, 1.00000053, 2.000000031, 3.00000012, 4.00000098],
      [50.0000027, 60.0000000064, 70.00000008, 80.00000002, 90.00000005],
    ]);

    assert(!mat1.equals(mat3, 0.00000000001));
    assert(!mat3.equals(mat1, 0.00000000001));
    assert(mat1.equals(mat3, 0.0001));
    assert(mat3.equals(mat1, 0.0001));

    final mat4 = Matrix.fromArrayOfArrays([
      [0.0, 1.0, 2.0, 3.0],
      [50.0, 60.0, 70.0, 80.0],
    ]);

    assert(!mat1.equals(mat4, 1.001));
    assert(!mat4.equals(mat1, 1.001));
  }
}

