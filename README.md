ios_YelpModel
=============

Native iOS Yelp 2.0 API Data Model, works with JSONModel.

Created this because I could not find any other easy to use native iOS Yelp 2.0 Model. 

YelpInterface
-----------
This is the main interface for interacting with the Yelp 2.0 API.  Create a new instance of this class and call the - (id)initWithStoredKeys command. This class stores constants for the Yelp Auth keys.  The keys in this example are the ones provided by Yelp.  Replaces these keys with your developer key set from Yelp.

### - (id)initWithStoredKeys
This command initializes the Auth with Yelp based on the 4 stored const keys.

### - (AFHTTPRequestOperation *)searchWithTerm:(NSString *)term atLat:(double)lat lon:(double)lon success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
This function is the main function for making requests.  

RETURNS "(id) response" on success.  "response" is an NSDictionary of the JSON response based on the Yelp 2.0 API search term "term" and the location as dictated by "lat" and "lon." 


### - (NSMutableArray *) getYelpBusinessesFromQuery: (id) response 
This function takes the "(id) response" from the previous function and can return an Array of the locations in the form of YelpBusiness class instances.  After this function, you can access the data from the Yelp API directly through the properties defined by each class.

YelpBusiness
-----------
The YelpBusiness class is the top level class as returned by the Yelp Queries.  All other classes found in the Yelp Data Types Folders based on a has-a relationship to the YelpBusiness.  In other words, the YelpBusiness has properties made up of those classes. 



