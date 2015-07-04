
var City = Parse.Object.extend("City",{},{
	getDefaultCity:function() {
		var city = new City();
		city.set("name","Nikolaev");
		return city;
	}
});

var DeliveryProvider = Parse.Object.extend("DeliveryProvider");

Parse.Cloud.define("loadProvidersForCity",function(request,response) {
    var query = new Parse.Query(City);
    query.equalTo("name","Nikolaev");
    query.find({
        success: function(results) {            
            if(results.length > 0) {
               var defaultCity = results[0];
                var providersQuery = new Parse.Query(DeliveryProvider);
                providersQuery.find({
                    success: function(results) {
                        if(results.length > 0) {
                            response.success("success " + JSON.stringify(defaultCity) + " " + JSON.stringify(results));     
                        }
                        else {
                            response.success("[]");
                        }
                    },
                    error: function(error) {
                        response.error("failed");
                    }
                });
                
            }
            else {
                response.success("[]");
            }
        },
    error: function(error) {
       // alert("Error: " + error.code + " " + error.message);
        response.error("failed");
    }
    });
});

Parse.Cloud.define("hello",function(request,response) {
	response.success("Hello,world");
});

