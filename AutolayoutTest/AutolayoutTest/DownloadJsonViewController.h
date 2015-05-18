//
//  DownloadJsonViewController.h
//  AutolayoutTest
//
//  Created by Kamil Zietek on 16.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadJsonViewController : UIViewController

@property(nonatomic,weak) IBOutlet UIImageView *vImage;

- (void)failure:(NSString*)displayText;

@end
