//
//  BorderedButton.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 06/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "BorderedButton.h"

@implementation BorderedButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor=[UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
#define BORDER_COLOR 55/255.0

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:self.bounds];
    
    [[UIColor colorWithRed:BORDER_COLOR green:BORDER_COLOR blue:BORDER_COLOR alpha:1]setStroke];
    [bezierPath stroke];
}

@end
