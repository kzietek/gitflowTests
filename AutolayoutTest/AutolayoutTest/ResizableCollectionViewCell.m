//
//  ResizableCollectionViewCell.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 28.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "ResizableCollectionViewCell.h"
#import <PureLayout/PureLayout.h>

@interface ResizableCollectionViewCell ()

@property (nonatomic, strong) UILabel *internalLabel;
@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation ResizableCollectionViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Placeholder";
        label.numberOfLines = 0;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:label];
        [label sizeToFit];
        [label autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
        [label autoSetDimension:ALDimensionWidth toSize:100];

        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [label autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        
//        [label autoSetDimension:ALDimensionHeight toSize:21];
        _internalLabel = label;
        _vLabel = _internalLabel;
        
        _didSetupConstraints = NO;
    }
    return self;
}

@end
