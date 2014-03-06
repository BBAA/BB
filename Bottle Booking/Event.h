//
//  Event.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
{
    void (^_completionHandler)(NSDictionary *result);
}
- (void) getProductsAndAreasFromClub:(NSDictionary *)clubIdentifier inBackgroundWithBlock:(void(^)(NSDictionary *result))handler;
@end
