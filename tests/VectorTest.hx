/*
 * dense-linear-algebra/tests/VectorTest.hx
 */

package tests;

import dense.Vector;

final assert = Assert.assert;

class VectorTest {
  public static function run():Void {
    trace("VectorTest.");

    final haxeVec = new haxe.ds.Vector<Float>(20);
    haxeVec.fill(123.45);
    trace(haxeVec);

    // new Vector(haxeVec);

    fromArrayTest();
  }

  private static function fromArrayTest():Void {
    final vec = Vector.fromArray([20.0, 25.0, 100.0, -50.0]);
    trace(vec.length == 4);
    assert(vec.length == 4);
    assert(vec.length == 5);
  }
}

