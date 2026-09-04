@IsTest
private with sharing class SimpleMath2Test {
    @IsTest
    private static void addReturnsSum() {
        Integer result = SimpleMath.add(2, 3);
        Assert.areEqual(5, result, 'Add should return the sum.');
    }

    @IsTest
    private static void subtractReturnsDifference() {
        Integer result = SimpleMath.subtract(7, 4);
        Assert.areEqual(3, result, 'Subtract should return the difference.');
    }

    @IsTest
    private static void isEvenReturnsExpectedValues() {
        Assert.isTrue(SimpleMath.isEven(8), '8 should be even.');
        Assert.isFalse(SimpleMath.isEven(5), '5 should be odd.');
    }
}