/*
 * dense-linear-algebra/src/dense/Util.hx
 *
 * A module for utility functions shared between the Vector and Matrix classes,
 * intended to be used only within the library itself.
 */

package dense;

class Util {
  public static function randomFloat(min:Float = 0.0, max:Float = 1.0):Float {
    if (min > max) {
      throw "Randomization minimum cannot exceed provided maximum.";
    }

    final distance = max - min;

    return Math.random() * distance + min;
  }
}

