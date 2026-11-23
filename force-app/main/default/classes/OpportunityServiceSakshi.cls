public with sharing class OpportunityServiceSakshi {
    
    /**
     * Flags opportunities with amounts over 100,000 as high priority in their description.
     */
    public static List<Opportunity> markHighValueOpportunities(List<Opportunity> opps) {
        List<Opportunity> updatedOpps = new List<Opportunity>();
        
        if (opps == null || opps.isEmpty()) {
            return updatedOpps;
        }

        for (Opportunity opp : opps) {
            if (opp.Amount != null && opp.Amount >= 100000) {
                opp.Description = 'High Priority: Key Enterprise Account';
                updatedOpps.add(opp);
            }
        }
        
        if (!updatedOpps.isEmpty()) {
            update updatedOpps;
        }
        
        return updatedOpps;
    }
}