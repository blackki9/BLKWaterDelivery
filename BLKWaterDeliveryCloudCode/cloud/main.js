
var City = Parse.Object.extend("City",{},{
	getDefaultCity:function() {
		var city = new City();
		city.set("name","Nikolaev");
		return city;
	}
});

var DeliveryProvider = Parse.Object.extend("DeliveryProvider");
var ContactInfo = Parse.Object.extend("ContactInfo");
var providersFunctions = require("cloud/providers.js");

Parse.Cloud.define("loadContactInfoForProvider",function(request,response) {
    var contactInfoObjctId = request.params.contactInfoObjectId;
    var query = new Parse.Query(ContactInfo);
    query.equalTo("objectId",contactInfoObjctId);
    query.first({success:function(results) {
        response.success(JSON.stringify(results));
    },
        error:function(error) {
            response.error("error" + error);
        }});
});

Parse.Cloud.define("loadContactInfoForProviders",function(request,response) {
    var query = new Parse.Query("ContactInfo");
    query.containedIn("objectId", request.params.objectIdsArray);
    query.find({success:function(results) {
        if(results.length == 0) {
            response.success(JSON.stringify(pointers));
        }
        else {
            response.success(JSON.stringify(results));
        }
    },
    error:function(error) {
        response.error(error);
    }});
    
});

Parse.Cloud.define("getUpdatesForProviders",function(request,response) {
    var updateDate = request.params.updateDate;
    var query = new Parse.Query(DeliveryProvider);
    query.greaterThan("updatedAt",updateDate); 
    query.find({success:function(results) {
        response.success(JSON.stringify(results));
    },
    error:function(error) {
        response.error("error "+error + "request parameter " + updateDate)
    }
    });
});

