//
//  Login.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "Login.h"
#import "BBRequest.h"
#import "BBUser.h"
@interface Login()
@property (nonatomic,strong) BBRequest *bbRequest;
@end

@implementation Login

#define CURRENT_USER @"currentUserObject"

- (void)loginWithMail:(NSString *)mail andpassword:(NSString *)password inBackgroundWithBlock:(void(^)(int succeeded))handler
{
    NSDictionary *loginRequest = @{@"function":@"LOGIN",
                                   @"content":@{@"mail": mail,@"password":password},
                                   };
    [self.bbRequest sendLocallyWithDictionary:loginRequest inBackgroundWithBlock:^(NSDictionary *result) {
        _completionHandler = [handler copy];
        if ([result[@"error"] isEqualToString:@"NO_ERROR"]) {
            NSDictionary *currentUser = (NSDictionary *)result[@"user"];
            [BBUser saveCurrentUserLocallyWithDictionary:currentUser];
            _completionHandler(1);
        } else if ([result[@"error"] isEqualToString:@"WRONG_COMBINATION"]) _completionHandler(0);
    }];
}

- (void)forgotPasswordUsingMail:(NSString *)mail inBackgroundWithBlock:(void(^)(int succeeded))handler
{
    NSDictionary *forgotPasswordRequest = @{@"function":@"FORGOTTEN_PASSWORD",
                                   @"content":@{@"mail": mail}};

    [self.bbRequest sendLocallyWithDictionary:forgotPasswordRequest inBackgroundWithBlock:^(NSDictionary *result) {
        _completionHandler = [handler copy];
        if ([result[@"error"] isEqualToString:@"NO_ERROR"]) _completionHandler(1);
        else _completionHandler(0);
    }];
}

- (BBRequest *)bbRequest
{
    if (!_bbRequest) _bbRequest = [[BBRequest alloc]init];
    return _bbRequest;
}

@end