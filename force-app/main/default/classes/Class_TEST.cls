/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 07-26-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
@isTest
private class Class_TEST {
    @isTest
    private static void runTest() {
        System.assertEquals(1 + 1, 2, 'We broke math');
        System.assertEquals(1 + 3, 4, 'We broke math again');
    }

    @isTest
    private static void runTest2() {
        System.assertEquals(1 + 1, 2, 'We broke math');
    }
}
