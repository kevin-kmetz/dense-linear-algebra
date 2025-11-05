/*
 * dense-linear-algebra/src/dense/Vector.hx
 *
 * A class representing an immutable mathematical dense vector of floating point
 * numbers, of fixed and arbitrary size.
 */

package dense;

typedef FloatVector = haxe.ds.Vector<Float>;

class Vector {
  private final vector:FloatVector;

  public final length:Int;

  private function new(haxeVector:FloatVector) {
    vector = haxeVector.copy();
    length = haxeVector.length;
  }

  public static function fromArray(array:Array<Float>):Vector {
    return new Vector(FloatVector.fromArrayCopy(array));
  }

  public static function fromHaxeVector(haxeVector:FloatVector):Vector {
    return new Vector(haxeVector);
  }

  public static function generate(length:Int, func: Int -> Float):Vector {
    if (length < 1) { throw "Invalid Vector length."; }

    final floatVector = new FloatVector(length);

    for (i in 0...length) {
      floatVector[i] = func(i);
    }

    return new Vector(floatVector);
  }

  public static function randomized(length:Int, min:Float = 0.0, max:Float = 1.0):Vector {
    if (length < 1) { throw "Invalid Vector length."; }

    final floatVector = new FloatVector(length);

    for (i in 0...length) {
      floatVector[i] = randomFloat(min, max);
    }

    return new Vector(floatVector);
  }

  public static function zero(length:Int):Vector {
    if (length < 1) { throw "Invalid Vector length."; }

    final floatVector = new FloatVector(length);
    floatVector.fill(0.0);

    return new Vector(floatVector);
  }

  public function clone():Vector {
    return new Vector(vector);
  }

  public function equals(other:Vector, threshold:Float):Bool {
    if (this.length != other.length) return false;

    var allWithinThreshold = true;

    for (i in 0...this.length) {
      if (Math.abs(vector[i] - other.get(i)) > threshold) {
        allWithinThreshold = false;
        break;
      }
    }

    return allWithinThreshold;
  }

  // public function toString():String {}

  public function get(index:Int):Float {
    return vector[index];
  }

  public function map(func:Float -> Float):Vector {
    final floatVector = new FloatVector(this.length);

    for (i in 0...this.length) {
      floatVector[i] = func(this.get(i));
    }

    return new Vector(floatVector);
  }

  public function magnitude():Float {
    var sum = 0.0;

    for (i in 0...this.length) {
      sum += Math.pow(this.get(i), 2);
    }

    return Math.sqrt(sum);
  }

  // public function normalize():Vector {}
  // public function dotProduct(other:Vector):Float {}

  // public function crossProduct(otherVec3:Vector):Vector {}

  // public function addVector(other:Vector):Vector {}
  // public function subtractVector(other:Vector):Vector {}
  // public function outerProduct(other:Vector):Matrix {}
  // public function negate():Vector {}

  // public function addScalar(scalar:Float):Vector {}
  // public function subtractScalar(scalar:Float):Vector {}
  // public function multiplyScalar(scalar:Float):Vector {}
  // public function divideScalar(scalar:Float):Vector {}

  // public function asMatrixColumn():Matrix {}
  // public function asMatrixRow():Matrix {}

  private static function randomFloat(min:Float = 0.0, max:Float = 1.0):Float {
    if (min > max) {
      throw "Randomization minimum cannot exceed provided maximum.";
    }

    final distance = max - min;

    return Math.random() * distance + min;
  }
}

