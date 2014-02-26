//
//  DTNetworkManager.h
//  Parkly
//
//  Created by CCEW on 2/25/14.
//  Copyright (c) 2014 DevTeam14. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "DTDataManager.h"

@interface DTNetworkManager : AFHTTPSessionManager

+ (instancetype) sharedInstance;

- (void) authenticateUser:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void) fetchAllUsers: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void) fetchSpotsForLotWithId:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void) fetchUserWithId:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


#pragma mark - GET

//GET-> 1 Parameter
- (void) getFrom:(NSString*)fromWhere parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

//GET-> 2 Parameters
- (void) getFrom:(NSString*)fromWhere what:(NSString*)whatYouWant parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

//GET-> 3 Parameters
- (void) getFrom:(NSString*)fromWhere who:(NSString*)whoYouWantItFrom what:(NSString*)whatYouWant parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

//GET-> 4 Parameters
- (void) getFrom:(NSString*)fromWhere who:(NSString*)whoYouWantItFrom what:(NSString*)whatYouWant which:(NSString*)whichOne parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

#pragma mark - POST

//POST-> 1 Parameter
- (void) postTo:(NSString*)toWhere parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

//POST-> 2 Parameters
- (void) postTo:(NSString*)toWhere what:(NSString*)whatYouWant parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

//POST-> 3 Parameters
- (void) postTo:(NSString*)toWhere who:(NSString*)whoYouWantItFrom what:(NSString*)whatYouWant parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

//POST-> 4 Parameters
- (void) postTo:(NSString*)toWhere who:(NSString*)whoYouWantItFrom what:(NSString*)whatYouWant which:(NSString*)whichOne parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


#pragma mark - Helper Methods

- (void) genericGet:(NSString*)pathString parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void) genericPost:(NSString*)pathString parameters:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


@end
