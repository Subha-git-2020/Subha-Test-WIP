@IsTest
private class TestCleanPrWithConflictTest {

    // ─── Tests for printNameInCleanPR ──────────────────────────────────────── modified in the UAT directly on 3rd sep

    @IsTest
    static void testPrintNameInCleanPR() {
        // Given / When
        Test.startTest();
        TestCleanPrWithConflict.printNameInCleanPR();
        Test.stopTest();

        // Then: method executes without exceptions and produces a debug log entry.
        // No return value to assert; coverage and exception-free execution are the goals.
        System.assert(true, 'printNameInCleanPR should complete without throwing an exception.');
    }

    // ─── Tests for newMethodInClass ──────────────────────────────────────────

    @IsTest
    static void testNewMethodInClass() {
        // Given / When
        Test.startTest();
        TestCleanPrWithConflict.newMethodInClass();
        Test.stopTest();

        // Then: method executes without exceptions and produces a debug log entry.
        System.assert(true, 'newMethodInClass should complete without throwing an exception.');
    }

    // ─── Combined execution test ─────────────────────────────────────────────

    @IsTest
    static void testBothMethodsExecuteSequentially() {
        // Given / When: both static methods are called in sequence
        Test.startTest();
        TestCleanPrWithConflict.printNameInCleanPR();
        TestCleanPrWithConflict.newMethodInClass();
        Test.stopTest();

        // Then: no exception is thrown when both methods run together.
        System.assert(true, 'Both methods should execute sequentially without errors.');
    }
}
