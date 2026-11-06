@isTest
private class OpportunityServiceSakshiTest {

    @TestSetup
    static void setupTestData() {
        List<Opportunity> testOpps = new List<Opportunity>{
            new Opportunity(
                Name = 'High Value Deal',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(30),
                Amount = 150000
            ),
            new Opportunity(
                Name = 'Standard Deal',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(30),
                Amount = 50000
            )
        };
        insert testOpps;
    }

    @isTest
    static void testMarkHighValueOpportunities_Positive() {
        List<Opportunity> records = [SELECT Id, Amount, Description FROM Opportunity];

        Test.startTest();
        List<Opportunity> processed = OpportunityServiceSakshi.markHighValueOpportunities(records);
        Test.stopTest();

        // Verify only the qualifying record was processed
        System.assertEquals(1, processed.size(), 'Only one high-value opportunity should be updated');

        // Query database to ensure persistence
        Opportunity updatedOpp = [SELECT Description FROM Opportunity WHERE Name = 'High Value Deal' LIMIT 1];
        System.assertEquals('High Priority: Key Enterprise Account', updatedOpp.Description, 'Description must reflect high-priority status');
        
        Opportunity untouchedOpp = [SELECT Description FROM Opportunity WHERE Name = 'Standard Deal' LIMIT 1];
        System.assertEquals(null, untouchedOpp.Description, 'Standard deal description should not change');
    }

    @isTest
    static void testMarkHighValueOpportunities_EmptyList() {
        Test.startTest();
        List<Opportunity> result = OpportunityServiceSakshi.markHighValueOpportunities(new List<Opportunity>());
        Test.stopTest();

        System.assert(result.isEmpty(), 'Empty input should yield an empty result list');
    }
}