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
    randomizedTest();
    zeroTest();
    equalsTest();

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

  private static function randomizedTest():Void {
    final validateValues = function (vector:Vector, min:Float, max:Float):Bool {
      var allValuesWithinRange = true;

      for (i in 0...vector.length) {
        final value = vector.get(i);

        if (value < min || value > max) {
          allValuesWithinRange = false;
          break;
        }
      }

      return allValuesWithinRange;
    };

    final vec = Vector.randomized(10, -5.0, 7.5);
    assert(vec.length == 10);
    assert(validateValues(vec, -5.0, 7.5));

    final vec2 = Vector.randomized(20);
    assert(vec2.length == 20);
    assert(validateValues(vec2, 0.0, 1.0));

    final vec3 = Vector.randomized(30, -23.0);
    assert(vec3.length == 30);
    assert(validateValues(vec3, -23.0, 1.0));

    final vec4 = Vector.randomized(40, null, 75.2);
    assert(vec4.length == 40);
    assert(validateValues(vec4, 0.0, 75.2));
  }

  private static function zeroTest():Void {
    final vec = Vector.zero(10);

    assert(vec.length == 10);

    for (i in 0...vec.length) {
      assert(vec.get(i) == 0.0);
    }

    final vec2 = Vector.zero(500);

    assert(vec2.length == 500);

    for (i in 0...vec2.length) {
      assert(vec2.get(i) == 0.0);
    }
  }

  private static function equalsTest():Void {
    final vec1 = Vector.zero(5);
    final vec2 = Vector.fromArray([0.0, 0.0, 0.0, 0.0, 0.0]);

    assert(vec1.equals(vec2, 0.0000000001));

    final vec3 = Vector.fromArray([0.0005, 0.0005, 0.0005, 0.0005, 0.0005]);

    assert(vec1.equals(vec3, 0.001));
    assert(!vec1.equals(vec3, 0.00000000001));
  }
}

