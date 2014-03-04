//
//  BBRequest.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBRequest : NSObject <UIAlertViewDelegate>
{
    void (^_completionHandler)(NSDictionary *result);
    void (^_succeededHandler)(int succeeded);
}
-(void)sendWithDictionary:(NSDictionary *)dictionary inBackgroundWithBlock:(void(^)(NSDictionary *result))handler;
-(void)sendWithContent:(NSDictionary *)content andFunctionKeyWord:(NSString *)keyWord inBackgroundWithBlock:(void(^)(NSDictionary *result))handler;
-(void)sendLocallyWithDictionary:(NSDictionary *)dictionary inBackgroundWithBlock:(void(^)(NSDictionary *result))handler;
-(void)sendLocallyWithContent:(NSDictionary *)content andFunctionKeyWord:(NSString *)keyWord inBackgroundWithBlock:(void(^)(NSDictionary *result))handler;

@end
