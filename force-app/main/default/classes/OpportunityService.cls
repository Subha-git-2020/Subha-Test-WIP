public with sharing class OpportunityService {

    // ✅ Covered by test
    public static Opportunity createOpportunity(String name, Id accountId) {
        Opportunity opp = new Opportunity(
            Name = name,
            AccountId = accountId,
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30)
        );
        insert opp;
        return opp;
    }

    // ❌ NOT covered — no test calls this method
    public static void closeOpportunity(Id oppId) {
        Opportunity opp = [SELECT Id, StageName FROM Opportunity WHERE Id = :oppId LIMIT 1];
        opp.StageName = 'Closed Won';
        update opp;
    }

    // ❌ NOT covered — no test calls this method
    public static void deleteOpportunity(Id oppId) {
        Opportunity opp = [SELECT Id FROM Opportunity WHERE Id = :oppId LIMIT 1];
        delete opp;
    }

    // ❌ NOT covered — no test calls this method
    public static List<Opportunity> getOpportunitiesByAccount(Id accountId) {
        return [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE AccountId = :accountId];
    }

    // ❌ NOT covered — no test calls this method
    public static Decimal calculateTotalAmount(List<Opportunity> opps) {
        Decimal total = 0;
        for (Opportunity opp : opps) {
            if (opp.Amount != null) {
                total += opp.Amount;
            }
        }
        return total;
    }
}