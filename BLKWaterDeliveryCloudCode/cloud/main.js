
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

Parse.Cloud.define("loadProvidersForDefaultCity",function(request,response) {
    var query = new Parse.Query(City);
    query.equalTo("name","Nikolaev");
    query.find({
        success: function(results) {            
            providersFunctions.returnProviders(results,response);
        },
    error: function(error) {
       // alert("Error: " + error.code + " " + error.message);
        response.error("failed");
    }
    });
});

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
