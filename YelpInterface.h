//
//  YelpInterface.h
//  iosChatClient
//
//  Created by Daniel F Wyatt on 10/28/14.
//  Copyright (c) 2014 Daniel F Wyatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDBOAuth1RequestOperationManager.h"


@interface YelpInterface : BDBOAuth1RequestOperationManager

- (id)initWithStoredKeys;
- (id)initWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken accessSecret:(NSString *)accessSecret;
- (AFHTTPRequestOperation *)searchWithTerm:(NSString *)term atLat:(double)lat lon:(double)lon success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (NSMutableArray *) getYelpBusinessesFromQuery: (id) response;

@end
