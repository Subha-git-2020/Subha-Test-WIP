@IsTest(critical=true) 
public class AccountServiceTest {

    @TestSetup
    static void setupData() {
        Account acc = new Account(Name = 'Test Account', Industry = 'Technology');
        insert acc;
    }

    // ✅ PASS — verifies account creation returns correct values
    @IsTest
    static void testCreateAccount_Success() {
        Test.startTest();
        Account acc = AccountService.createAccount('Copado Inc', 'Technology');
        Test.stopTest();

        System.assertNotEquals(null, acc.Id, 'Account Id should not be null after insert');
        System.assertEquals('Copado Inc', acc.Name, 'Account name should match');
        System.assertEquals('Technology', acc.Industry, 'Industry should match');
    }

    // ✅ PASS — verifies account retrieval by Id
    @IsTest
    static void testGetAccountById_Success() {
        Account existing = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Test.startTest();
        Account result = AccountService.getAccountById(existing.Id);
        Test.stopTest();

        System.assertNotEquals(null, result, 'Account should be found');
        System.assertEquals('Test Account', result.Name, 'Account name should match');
    }

    // ❌ FAIL — intentionally asserts wrong industry value to simulate a failing test
    @IsTest
    static void testCreateAccount_WrongIndustry_Fail() {
        Test.startTest();
        Account acc = AccountService.createAccount('Fail Corp', 'Technology');
        Test.stopTest();

        // This assertion will fail — 'Finance' does not match the actual value 'Technology'
        System.assertEquals('Finance', acc.Industry, 'Expected Finance but got Technology — intentional failure');
    }
}