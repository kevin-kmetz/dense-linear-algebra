/*
 * dense-linear-algebra/tests/Tests.hx
 */

package tests;

class Tests {
  private static function main():Void {
    trace("Now running all tests for the package 'dense'...");

    runAll();

    trace("...all tests for package 'dense' passed!");
  }

  private static function runAll():Void {
    VectorTest.run();
    MatrixTest.run();
  }
}

