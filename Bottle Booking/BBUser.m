//
//  BBUser.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "BBUser.h"

@implementation BBUser

#define CURRENT_USER @"currentUserObject"

+ (NSDictionary *) currentUser
{
    NSDictionary *currentUser = (NSDictionary *)[[NSUserDefaults standardUserDefaults] objectForKey:CURRENT_USER];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return currentUser;
}

+ (BOOL) isLoggedIn
{
    NSDictionary *currentUser = [BBUser currentUser];
    BOOL loggedIn=YES;
    if (!currentUser) loggedIn=NO;
    return loggedIn;
}

+ (void) saveCurrentUserLocallyWithDictionary:(NSDictionary *)currentUser
{
    [[NSUserDefaults standardUserDefaults] setObject:currentUser forKey:CURRENT_USER];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) logout
{
    [[NSUserDefaults standardUserDefaults] setObject:NULL forKey:CURRENT_USER];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end