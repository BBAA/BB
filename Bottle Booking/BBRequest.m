//
//  BBRequest.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "BBRequest.h"
#import "SBJsonWriter.h"
#import "SBJsonParser.h"
#import "BBUser.h"

@interface BBRequest()
@property (nonatomic,strong) UIAlertView *noNetworkAlert;
@end

@implementation BBRequest
#define TOKEN @"4356TFG87IUJBHIUJHCV78IOU98YU"
#define MAIL @"me@mail.com"
#define PASSWORD @"pass"

/*==========================================================================================================
 =================================================V 0.9====================================================
 ==========================================================================================================*/
-(void)sendLocallyWithDictionary:(NSDictionary *)dictionary inBackgroundWithBlock:(void(^)(NSDictionary *result))handler
{
    _completionHandler = [handler copy];
    if ([dictionary[@"function"] isEqualToString:@"LOGIN"]) {
        if ([dictionary[@"content"][@"mail"] isEqualToString:MAIL] && [dictionary[@"content"][@"password"] isEqualToString:PASSWORD]) {
            NSDictionary *returnedDictionnary = @{@"content":
  													@{@"user":
                                                          @{@"username":@"jean",@"token":TOKEN,@"mail":@"me@mail.com"},
                                                      @"error":@"NO_ERROR"}};
            _completionHandler(returnedDictionnary[@"content"]);
        } else {
            NSDictionary *returnedDictionnary = @{@"content":@{@"error":@"WRONG_COMBINATION"}};
            _completionHandler(returnedDictionnary[@"content"]);
        }
    } else if ([dictionary[@"function"] isEqualToString:@"FORGOTTEN_PASSWORD"]) {
        NSDictionary *returnedDictionnary = [[NSDictionary alloc]init];
        if ([dictionary[@"content"][@"mail"] isEqualToString:MAIL]) {
        	returnedDictionnary = @{@"content":@{@"error":@"NO_ERROR"}};
        } else {
            returnedDictionnary = @{@"content":@{@"error":@"WRONG_MAIL"}};
        }
        _completionHandler(returnedDictionnary[@"content"]);
    }
}

-(void)sendLocallyWithContent:(NSDictionary *)content andFunctionKeyWord:(NSString *)keyWord inBackgroundWithBlock:(void(^)(NSDictionary *result))handler
 {

}
/*==========================================================================================================
  =================================================V 1.0====================================================
  ==========================================================================================================*/
-(void)sendWithDictionary:(NSDictionary *)dictionary inBackgroundWithBlock:(void(^)(NSDictionary *result))handler
{
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://ifiwere.eu.com/app/"]];
    
    // Convert data
    SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
    NSString *jsonData = [jsonWriter stringWithObject:dictionary];
    NSLog(@"jsonSent : %@",jsonData);
    NSData *requestData = [jsonData dataUsingEncoding: NSUTF8StringEncoding];
    request.HTTPBody = requestData;
    
    // This is how we set header fields
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    // Create url connection and fire request
    [self activateNetworkActivityIndicator];
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *connectionError) {
        [self desactivateNetworkActivityIndicator];
        _completionHandler = [handler copy];
        if (!connectionError) {
            NSString *returnedString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            NSLog(@"returnedString : %@",returnedString);
            
            SBJsonParser *jsonParser = [[SBJsonParser alloc]init];
            id returnedJson = [jsonParser objectWithString:returnedString error:NULL];
            
            NSDictionary *returnedDictionary = [[NSDictionary alloc]init];
            returnedDictionary = (NSDictionary *)returnedJson;
            NSLog(@"returnedDictionary :%@", returnedDictionary);
            
            if ([returnedDictionary count]>0) {
                int success = (int)returnedDictionary[@"success"];
                if (success == 0) {
                    UIAlertView *noSuccessAlert = [[UIAlertView alloc]initWithTitle:@"Oups" message:@"Something went wrong!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                    [noSuccessAlert show];
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                    	_completionHandler(returnedDictionary[@"content"]);
                	});
                }
            }
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self handleNoNetworkError];
            });
        }
    }];
}

-(void)sendWithContent:(NSDictionary *)content andFunctionKeyWord:(NSString *)keyWord inBackgroundWithBlock:(void(^)(NSDictionary *result))handler{
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://ifiwere.eu.com/app/"]];
    
    // Create complete dictionnary
    NSDictionary *completeDictionary = @{@"token": [BBUser currentUser][@"token"],
                                         @"function":keyWord,
                                         @"content":content};
    
    // Convert data
    SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
    NSString *jsonData = [jsonWriter stringWithObject:completeDictionary];
    NSLog(@"jsonSent : %@",jsonData);
    NSData *requestData = [jsonData dataUsingEncoding: NSUTF8StringEncoding];
    request.HTTPBody = requestData;
    
    // This is how we set header fields
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    // Create url connection and fire request
    [self activateNetworkActivityIndicator];
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *connectionError) {
        [self desactivateNetworkActivityIndicator];
        _completionHandler = [handler copy];
        if (!connectionError) {
            NSString *returnedString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            NSLog(@"returnedString : %@",returnedString);
            
            SBJsonParser *jsonParser = [[SBJsonParser alloc]init];
            id returnedJson = [jsonParser objectWithString:returnedString error:NULL];
            
            NSDictionary *returnedDictionary = [[NSDictionary alloc]init];
            returnedDictionary = (NSDictionary *)returnedJson;
            NSLog(@"returnedDictionary :%@", returnedDictionary);
            
            if ([[returnedDictionary allKeys]count] > 0) {
                int isTokenOk = [returnedDictionary[@"isTokenOk"] intValue];
                int success = [returnedDictionary[@"success"] intValue];
                if (isTokenOk==0) {
                    UIAlertView *wrongTokenAlert = [[UIAlertView alloc]initWithTitle:@"Oups" message:@"Denied access!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                    [wrongTokenAlert show];
                } else if (success == 0) {
                    UIAlertView *noSuccessAlert = [[UIAlertView alloc]initWithTitle:@"Oups" message:@"Something went wrong!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                    [noSuccessAlert show];
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        _completionHandler(returnedDictionary[@"content"]);
                    });
                }
            }
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self handleNoNetworkError];
            });
        }
    }];
}

//no network error
#define NO_NETWORK_COUNT @"noNetworkCount"
-(void)handleNoNetworkError
{
    int noNetworkCount = (int)[[NSUserDefaults standardUserDefaults]integerForKey:NO_NETWORK_COUNT];
    
    if (noNetworkCount==0) {
        noNetworkCount++;
        [[NSUserDefaults standardUserDefaults] setInteger:noNetworkCount forKey:NO_NETWORK_COUNT];
        [[NSUserDefaults standardUserDefaults] synchronize];
        _noNetworkAlert = [[UIAlertView alloc]initWithTitle:@"No network!" message:@"Please check your network connection !" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [_noNetworkAlert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView isEqual:_noNetworkAlert]) {
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:NO_NETWORK_COUNT];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

//activity network indicator
#define ACTIVITY_NETWORK_INDICATOR_COUNT @"activityNetworkIndicatorCount"
- (void)activateNetworkActivityIndicator
{
    int activityNetworkIndicatorCount = (int)[[NSUserDefaults standardUserDefaults]integerForKey:ACTIVITY_NETWORK_INDICATOR_COUNT];
    activityNetworkIndicatorCount++;
    [[NSUserDefaults standardUserDefaults] setInteger:activityNetworkIndicatorCount forKey:ACTIVITY_NETWORK_INDICATOR_COUNT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)desactivateNetworkActivityIndicator
{
    int activityNetworkIndicatorCount = (int)[[NSUserDefaults standardUserDefaults]integerForKey:ACTIVITY_NETWORK_INDICATOR_COUNT];
    activityNetworkIndicatorCount--;
    if (activityNetworkIndicatorCount <= 0) activityNetworkIndicatorCount=0;
    [[NSUserDefaults standardUserDefaults] setInteger:activityNetworkIndicatorCount forKey:ACTIVITY_NETWORK_INDICATOR_COUNT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (activityNetworkIndicatorCount <= 0) [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
@end
