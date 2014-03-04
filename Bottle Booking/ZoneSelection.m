//
//  ZoneSelection.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "ZoneSelection.h"
#import "BBRequest.h"

@interface ZoneSelection()
@property (nonatomic,strong) BBRequest *bbRequest;
@end

@implementation ZoneSelection

- (void)getZonesInBackgroundWithBlock:(void(^)(int succeeded))handler
{
    NSDictionary *getZonesRequest = @{@"eventID":@"someEventID",@"someSocID":@"socID"};
    [self.bbRequest sendLocallyWithContent:getZonesRequest andFunctionKeyWord:@"GET_AREA_BY_EVENT" inBackgroundWithBlock:^(NSDictionary *result) {
        /*_completionHandler = [handler copy];
        if ([result[@"error"] isEqualToString:@"NO_ERROR"]) {
            NSDictionary *currentUser = (NSDictionary *)result[@"user"];
            [BBUser saveCurrentUserLocallyWithDictionary:currentUser];
            _completionHandler(1);
        } else if ([result[@"error"] isEqualToString:@"WRONG_COMBINATION"]) _completionHandler(0);*/
    }];
}

- (BBRequest *)bbRequest
{
    if (!_bbRequest) _bbRequest = [[BBRequest alloc]init];
    return _bbRequest;
}
@end
