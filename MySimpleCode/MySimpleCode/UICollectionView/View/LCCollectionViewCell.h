//
//  LCCollectionViewCell.h
//  TestPods
//
//  Created by Long on 2019/11/25.
//  Copyright © 2019 Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDAnimatedImageView.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) SDAnimatedImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

NS_ASSUME_NONNULL_END
