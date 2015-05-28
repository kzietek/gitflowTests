//
//  ClassA.h
//  AutolayoutTest
//
//  Created by Kamil Zietek on 27.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClassB;

@interface ClassA : NSObject

@property (nonatomic, strong) ClassB *peer;

- (NSString*)sendDataAndReceiveResponse:(NSString*)dataToSend;

@end
