//
//  Event.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "Event.h"
#import "BBRequest.h"
@interface Event()
@property (nonatomic, strong) BBRequest *bbRequest;
@end
@implementation Event
- (void) getProductsAndAreasFromClub:(NSDictionary *)clubIdentifier inBackgroundWithBlock:(void(^)(NSDictionary *result))handler
{
    [self.bbRequest sendLocallyWithContent:clubIdentifier andFunctionKeyWord:@"GET_CLUB_PRODUCTS_AND_AREAS" inBackgroundWithBlock:^(NSDictionary *result) {
        _completionHandler = [handler copy];
        if ([result[@"error"] isEqualToString:@"NO_ERROR"]) {
        	_completionHandler(result);
        } else if ([result[@"error"] isEqualToString:@"WRONG_EVENT"]) _completionHandler(NULL);

    }];
}

- (BBRequest *)bbRequest
{
    if (!_bbRequest) _bbRequest = [[BBRequest alloc]init];
    return _bbRequest;
}
@end
