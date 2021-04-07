({    
    showToastDone : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Cases Closed Now"
        });
        toastEvent.fire();
	}, 
    showToastWait : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Great!",
            "message": "Please Wait. Up to 2k Cases are being closed. It might take up to 1 minute"
        });
        toastEvent.fire();
	}, 
    navigateToCaseObject : function (component, event, helper) {
    	 var homeEvent = $A.get("e.force:navigateToObjectHome");
		    homeEvent.setParams({
        		"scope": "Case"
    	});
    	homeEvent.fire();
	},
    closeQuickAction : function (component, event, helper) {
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
    }
})