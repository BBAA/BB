//
//  BBUser.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBUser : NSObject
+ (NSDictionary *) currentUser;
+ (void) saveCurrentUserLocallyWithDictionary:(NSDictionary *)currentUser;
+ (void) logout;
+ (BOOL) isLoggedIn;
@end
