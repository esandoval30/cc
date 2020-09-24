({
	
    
    showToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Cases are being generated. Check the New Cases List view"
        });
        toastEvent.fire();
	}
})

({    
    navigateToCaseObject : function (component, event, helper) {
    	 var homeEvent = $A.get("e.force:navigateToObjectHome");
		    homeEvent.setParams({
        		"scope": "Case"
    	});
    	homeEvent.fire();
	}
})

({
    closeQuickAction : function (component, event, helper) {
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
    }
})