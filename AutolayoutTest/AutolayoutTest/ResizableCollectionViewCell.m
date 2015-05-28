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

@end

@implementation ResizableCollectionViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Placeholder";
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:label];
        [label autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
        _internalLabel = label;
        _vLabel = _internalLabel;
    }
    return self;
}

@end
