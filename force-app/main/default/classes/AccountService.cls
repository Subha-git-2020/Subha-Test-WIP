public with sharing class AccountService {

    public static Account getAccountById(Id accountId) {
        return [SELECT Id, Name, Industry FROM Account WHERE Id = :accountId LIMIT 1];
    }

    public static Account createAccount(String name, String industry) {
        Account acc = new Account(Name = name, Industry = industry);
        insert acc;
        return acc;
    }
}