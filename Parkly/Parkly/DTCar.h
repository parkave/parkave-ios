//
//  DTCar.h
//  Parkly
//
//  Created by CCEW on 3/3/14.
//  Copyright (c) 2014 DevTeam14. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTUser.h"

@interface DTCar : NSObject

@property (strong, nonatomic) NSString* _id;
@property (strong, nonatomic) NSString* __v;
@property (strong, nonatomic) NSString* user_id;
@property (strong, nonatomic) NSString* make;
@property (strong, nonatomic) NSString* model;
@property (strong, nonatomic) NSString* year;
@property (strong, nonatomic) NSString* plate;
@property (strong, nonatomic) NSString* state;
@property (strong, nonatomic) NSString* color;

- (NSDictionary*) dictionaryRepresentation;
- (id) initWithDictionary:(NSDictionary*)dictionary;
- (id) initWithUser:(DTUser*)user;

@end
