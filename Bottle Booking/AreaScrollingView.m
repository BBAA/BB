//
//  AreaScrollingView.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "AreaScrollingView.h"

@interface AreaScrollingView ()
@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;

@end
@implementation AreaScrollingView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	if ([self pointInside:point withEvent:event]) {
		return _scrollView;
	}
	return nil;
}

@end
