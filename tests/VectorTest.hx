/*
 * dense-linear-algebra/tests/VectorTest.hx
 */

package tests;

import dense.Vector;

class VectorTest {
  public static function run():Void {
    trace("VectorTest.");

    final haxeVec = new haxe.ds.Vector<Float>(20);
    haxeVec.fill(123.45);

    new Vector(haxeVec);
  }
}

