/*
 * dense-linear-algebra/tests/VectorTest.hx
 */

package tests;

import dense.Vector;

final assert = Assert.assert;
typedef FloatVector = haxe.ds.Vector<Float>;

class VectorTest {
  public static function run():Void {
    trace("Running all tests for the class dense.Vector...");

    fromArrayTest();
    fromHaxeVectorTest();
    generateTest();

    trace("...all tests passed!");
  }

  private static function fromArrayTest():Void {
    final array = [20.0, 25.0, 100.0, -50.0];
    final vec = Vector.fromArray(array);

    assert(vec.length == 4);

    array[2] = 10000.0;
    assert(array[2] != vec.get(2));
  }

  private static function fromHaxeVectorTest():Void {
    final haxeVec = new FloatVector(3);
    haxeVec[0] = 200.0;
    haxeVec[1] = 350.0;
    haxeVec[2] = 500.0;

    final vec = Vector.fromHaxeVector(haxeVec);
    assert(vec.length == 3);

    haxeVec[1] = 7000.0;
    assert(haxeVec[1] != vec.get(1));
  }

  private static function generateTest():Void {
    final f = (i:Int) -> 2.0 * i + 1.0;

    final vec = Vector.generate(7, f);

    assert(vec.length == 7);
    assert(vec.get(6) == 13.0);
  }
}

