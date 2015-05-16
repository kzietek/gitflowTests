//
//  Language.h
//  AutolayoutTest
//
//  Created by Kamil Zietek on 16.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "JSONModel.h"

@interface Language : JSONModel

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* languageImage;

@end
