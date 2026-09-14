@IsTest
public class OpportunityServiceTest {

    @TestSetup
    static void setupData() {
        Account acc = new Account(Name = 'Test Account', Industry = 'Technology');
        insert acc;
    }

    // ✅ PASS — only covers createOpportunity method (~20% coverage)
    @IsTest
    static void testCreateOpportunity_Success() {
        Account acc = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Test.startTest();
        Opportunity opp = OpportunityService.createOpportunity('Test Opp', acc.Id);
        Test.stopTest();

        System.assertNotEquals(null, opp.Id, 'Opportunity Id should not be null after insert');
        System.assertEquals('Test Opp', opp.Name, 'Opportunity name should match');
        System.assertEquals('Prospecting', opp.StageName, 'Stage should be Prospecting');
    }
}