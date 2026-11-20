public class TestEnvironment {
    public static void testReplaceByEnvvar(){
        // hello {!Environment.TestNamanChange}
        System.debug('hello world');
    }
}