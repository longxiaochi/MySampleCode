//
//  LCScrollView.m
//  CustomScrollView
//
//  Created by Long on 2019/11/19.
//  Copyright © 2019 Long. All rights reserved.
//

#import "LCScrollView.h"

@interface LCScrollView ()

@end

@implementation LCScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:panGestureRecognizer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint transform = [gestureRecognizer translationInView:self];
    CGRect bounds = self.bounds;
    
    NSLog(@"transform = %@", NSStringFromCGPoint(transform));
    //坐标计算
    CGFloat newBoundsX = bounds.origin.x - transform.x;
    CGFloat minBoundsX = 0.0f;
    CGFloat maxBoundsX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsX, fmin(newBoundsX, maxBoundsX));
    
    CGFloat newBoundsY = bounds.origin.y - transform.y;
    CGFloat minBoundsY = 0.0f;
    CGFloat maxBoundsY = self.contentSize.height - bounds.size.width;
    bounds.origin.y = fmax(minBoundsY, fmin(newBoundsY, maxBoundsY));
    
    self.bounds = bounds;
    
    [gestureRecognizer setTranslation:CGPointZero inView:self];
}

@end
