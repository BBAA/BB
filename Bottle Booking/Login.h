//
//  Login.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject
{
    void (^_completionHandler)(int succeeded);
}
- (void)loginWithMail:(NSString *)username andpassword:(NSString *)password inBackgroundWithBlock:(void(^)(int succeeded))handler;
- (void)forgotPasswordUsingMail:(NSString *)mail inBackgroundWithBlock:(void(^)(int succeeded))handler;
@end
