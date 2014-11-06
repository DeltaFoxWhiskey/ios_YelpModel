//
//  YelpInterface.m
//  iosChatClient
//
//  Created by Daniel F Wyatt on 10/28/14.
//  Copyright (c) 2014 Daniel F Wyatt. All rights reserved.
//

#import "YelpInterface.h"
#import "YelpBusiness.h"


/************************* YELP DEMO KEYS: *************************/
//You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
NSString * const kYelpConsumerKey = @"vxKwwcR_NMQ7WaEiQBK_CA";
NSString * const kYelpConsumerSecret = @"33QCvh5bIF5jIHR5klQr7RtBDhQ";
NSString * const kYelpToken = @"uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV";
NSString * const kYelpTokenSecret = @"mqtKIxMIR4iBtBPZCmCLEb-Dz3Y";


@interface YelpInterface()

@end

@implementation YelpInterface


 -(id)initWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken accessSecret:(NSString *)accessSecret {
    NSURL *baseURL = [NSURL URLWithString:@"http://api.yelp.com/v2/"];
    self = [super initWithBaseURL:baseURL consumerKey:consumerKey consumerSecret:consumerSecret];
    if (self) {
        BDBOAuthToken *token = [BDBOAuthToken tokenWithToken:accessToken secret:accessSecret expiration:nil];
        [self.requestSerializer saveAccessToken:token];
    }
    return self;
}


-(id)initWithStoredKeys {
    
    return [self initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
}


    // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
- (AFHTTPRequestOperation *)searchWithTerm:(NSString *)term atLat:(double)lat lon:(double)lon success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSString *ll = [NSString stringWithFormat:@"%+.6f,%+.6f", lat, lon];
   
    NSDictionary *parameters = @{@"term": term, @"ll" : ll};  //NASHUA = @"42.7554,-71.4881"
    
    return [self GET:@"search" parameters:parameters success:success failure:failure];
}

#pragma mark - Class Functions

//create objects from the response and check to see if it worked
- (NSMutableArray *) getYelpBusinessesFromQuery: (id) response {
    
    NSMutableArray *yelpLocations = [NSMutableArray new];
    
    if ([response  isKindOfClass: [NSDictionary class]]) {
        
        NSMutableArray *yelpBusinesses = [[NSMutableArray alloc] initWithArray:[response objectForKey:@"businesses"]];
        
        for (NSDictionary *item in yelpBusinesses) {
            
            YelpBusiness *newLocation= [[YelpBusiness alloc] initWithDictionary:item error:nil];
            [yelpLocations addObject:newLocation];
            
        }
        
        return yelpLocations;
    }

    else {return nil;};
}

@end