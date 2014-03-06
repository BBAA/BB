//
//  AreaView.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic) UIImageView *logoImageView;
@property (nonatomic) UILabel *areaNameLabel;
@property (nonatomic) NSString *areaName;
@property (nonatomic) int minimumSpending;
@property (nonatomic) int capacity;
- (id) initWithFrame:(CGRect)frame imageName:(NSString *)imageName areaName:(NSString *)areaName minimumSpending:(int)minimumSpending andCapacity:(int)capacity;
@property (nonatomic, strong) UIButton *button;
@end
