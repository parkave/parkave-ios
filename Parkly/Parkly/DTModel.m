//
//  DTModel.m
//  Parkly
//
//  Created by CCEW on 2/24/14.
//  Copyright (c) 2014 DevTeam14. All rights reserved.
//

#import "DTModel.h"

@interface DTModel ()

@property (weak, nonatomic) DTDataManager* dataManager;
@property (weak, nonatomic) DTNetworkManager* networkManager;

@end

@implementation DTModel

+ (instancetype)sharedInstance {
    //  Static local predicate must be initialized to 0
    static DTModel *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
        
        // Do any other initialisation stuff here
        sharedInstance.dataManager = [DTDataManager sharedInstance];
        sharedInstance.networkManager = [DTNetworkManager sharedInstance];
    });
    return sharedInstance;
}

- (void) authenticateUser:(NSDictionary*)parameters success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    //FIX THIS
    [self.networkManager POST:@"users/session" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}

- (void) getAllUsers: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    [self.networkManager fetchAllUsers:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}

- (void) getSpotsForLotWithId:(NSString*)lotID success: (void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    //0. check if we already have the spots
    //1. create parameters dictionary
    //2. call network manager
    //3.1   if success, parse spots into DTParkingSpot array
    //      update data manager
    //3.2   if failure, return error
    
    //0
    
    //1
    NSDictionary* parameters = [NSDictionary dictionaryWithObject:lotID forKey:@"_id"];
    
    //2
    [self.networkManager fetchSpotsForLotWithId:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        //if success, first parse JSON into objects
        NSArray* spotArray;
        //update the dataManager
        [self.dataManager updateSpots:spotArray withLotId:lotID];
        
        //do whatever the user wants with the array of spots
        success(task, spotArray);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //bubble up the error
        failure(task, error);
    }];
}


@end
