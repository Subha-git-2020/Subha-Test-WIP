@IsTest
private class EnvSyncReproBaseTest {

    // PASSING test: printName() runs without throwing an exception
    @IsTest
    static void printName_runsWithoutError_passes() {
        Test.startTest();
        EnvSyncReproBase.printName();
        Test.stopTest();

        System.assert(true, 'printName should execute without exceptions');
    }

    // FAILING test: intentionally asserts something that is false
    /*@IsTest
    static void printName_intentionalFailure_fails() {
        Test.startTest();
        EnvSyncReproBase.printName();
        Test.stopTest();

        System.assertEquals(1, 2, 'Intentional failure: 1 does not equal 2');
    }*/
}