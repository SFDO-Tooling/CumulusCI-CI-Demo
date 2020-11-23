@isTest
private class TestClass {
	@isTest
    private static void runTest() {
        System.assertEquals(1 + 1, 2, 'We broke math');
    }
}