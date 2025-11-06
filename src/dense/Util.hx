/*
 * dense-linear-algebra/src/dense/Util.hx
 *
 * A module for utility functions shared between the Vector and Matrix classes,
 * intended to be used only within the library itself.
 */

package dense;

private typedef FloatVector = haxe.ds.Vector<Float>;

class Util {
  // Sanity checks for the length parameter of the following function
  // are expected to occur at the sources of its invocation.
  //
  public static function randomizedHaxeVector(
    length:Int, min:Float = 0.0, max:Float = 1.0
  ) {
    final floatVector = new FloatVector(length);

    for (i in 0...length) {
      floatVector[i] = randomFloat(min, max);
    }

    return floatVector;
  }

  private static function randomFloat(min:Float, max:Float):Float {
    if (min > max) {
      throw "Randomization minimum cannot exceed provided maximum.";
    }

    final distance = max - min;

    return Math.random() * distance + min;
  }
}

