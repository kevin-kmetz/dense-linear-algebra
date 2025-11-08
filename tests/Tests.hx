/*
 * dense-linear-algebra/tests/Tests.hx
 */

package tests;

class Tests {
  private static function main():Void {
    trace("\nNow running all tests for the package 'dense'...");

    runAll();

    trace("...all tests for package 'dense' passed!\n");
  }

  private static function runAll():Void {
    VectorTest.run();
    MatrixTest.run();
  }
}

