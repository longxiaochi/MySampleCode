//
//  LCCollectionReusableView.m
//  TestPods
//
//  Created by Long on 2019/11/25.
//  Copyright © 2019 Long. All rights reserved.
//

#import "LCCollectionReusableView.h"

@implementation LCCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _label.textColor = [UIColor blackColor];
        _label.backgroundColor = UIColor.whiteColor;
        [self addSubview:_label];
    }
    return self;
}

@end
