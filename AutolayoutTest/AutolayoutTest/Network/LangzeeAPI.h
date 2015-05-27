//
//  LangzeeAPI.h
//  AutolayoutTest
//
//  Created by Kamil Zietek on 16.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface LangzeeAPI : NSObject

+ (instancetype)sharedInstance;

+ (void)getCountriesWithSuccess:(void(^)(AFHTTPRequestOperation*, id))success failure:(void(^)(AFHTTPRequestOperation*, NSError*))failure;

@end
