public with sharing class SimpleMath2 {
    public static Integer add(Integer a, Integer b) {
        return a + b;
    }

    public static Integer subtract(Integer a, Integer b) {
        return a - b;
    }

    public static Boolean isEven(Integer value) {
        return Math.mod(value, 2) == 0;
    }
}