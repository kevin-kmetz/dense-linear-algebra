/*
 * dense-linear-algebra/tests/Tests.hx
 */

package tests;

class Tests {
  private static function main():Void {
    trace("Tests.");

    runAll();
  }

  private static function runAll():Void {
    VectorTest.run();
    MatrixTest.run();
  }
}

