var DeliveryProvider = Parse.Object.extend("DeliveryProvider");

exports.returnProviders = function(results,response) {
    if(results.length > 0) {
               var defaultCity = results[0];
                var providersQuery = new Parse.Query(DeliveryProvider);
                providersQuery.find({
                    success: function(results) {
                        if(results.length > 0) {
                            response.success(JSON.stringify(results));
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
}