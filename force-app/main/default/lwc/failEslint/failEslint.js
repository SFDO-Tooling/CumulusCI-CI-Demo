import { LightningElement } from "lwc";

export default class FailEslint extends LightningElement {
    doSomething() {
        console.log("error");
        asdasd;
    }
}
