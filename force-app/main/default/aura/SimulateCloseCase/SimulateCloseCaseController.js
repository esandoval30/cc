({
	doInit: function(component, event, helper) {
        console.log("doInit called");
        var action = component.get("c.closeSomeCases");
        helper.showToastWait(component, event, helper);
        
        action.setCallback(this, function(response){
            console.log("setCallback called");
            var state = response.getState();
            if(state === "SUCCESS"){
                helper.navigateToCaseObject(component, event, helper);
                helper.showToastDone(component, event, helper);
                helper.closeQuickAction(component, event, helper);
            }
            else if(state === "ERROR"){
                console.log('Error: ' + JSON.stringify(response.error));
            }     
        });

        $A.enqueueAction(action);                   
    }
})