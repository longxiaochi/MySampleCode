//
//  LCCollectionViewCell.m
//  TestPods
//
//  Created by Long on 2019/11/25.
//  Copyright © 2019 Long. All rights reserved.
//

#import "LCCollectionViewCell.h"

@implementation LCCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[SDAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 4/5)];
        [self addSubview:self.imageView];
        
        self.label  = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height * 4/5, self.bounds.size.width, self.bounds.size.height *1/5)];
        [self addSubview:self.label];
    }
    return self;
}

@end
