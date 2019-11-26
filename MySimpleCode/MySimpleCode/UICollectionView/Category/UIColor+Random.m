//
//  UIColor+Random.m
//  TestPods
//
//  Created by Long on 2019/11/25.
//  Copyright © 2019 Long. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)

+ (UIColor *)randomColor {
    CGFloat red = arc4random_uniform(255)/255.0f;
    CGFloat green = arc4random_uniform(255)/255.0f;
    CGFloat blue = arc4random_uniform(255)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end
