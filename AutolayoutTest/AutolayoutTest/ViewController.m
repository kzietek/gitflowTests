//
//  ViewController.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 10.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *space1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *space2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *space3;
@property (assign, nonatomic) CGFloat orgWidth1;
@property (assign, nonatomic) CGFloat orgWidth2;
@property (assign, nonatomic) CGFloat orgWidth3;
@property (strong, nonatomic) NSString *orgText1;
@property (strong, nonatomic) NSString *orgText2;
@property (strong, nonatomic) NSString *orgText3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.orgWidth1 = self.space1.constant;
    self.orgWidth2 = self.space2.constant;
    self.orgWidth3 = self.space3.constant;
    
    self.orgText1 = self.label1.text;
    self.orgText2 = self.label2.text;
    self.orgText3 = self.label3.text;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTap:(UITapGestureRecognizer *)sender {
    BOOL isShowing = self.space1.constant != 0;
    
    if (isShowing)
        [self hide];
    else
        [self show];
}

- (void)show {
    NSArray *constraintArray = @[self.space1, self.space2, self.space3];
    NSArray *labelArray = @[self.label1, self.label2, self.label3];
    NSArray *textArray = @[self.orgText1, self.orgText2, self.orgText3];
    
    for (UILabel *label in labelArray) {
        label.hidden = NO;
        NSInteger idx = [labelArray indexOfObject:label];
        label.text = textArray[idx];
    }
    
    for (NSLayoutConstraint *constraint in constraintArray) {
        constraint.constant = 20;
    }
}

- (void)hide {
    NSArray *constraintArray = @[self.space1, self.space2, self.space3];
    NSArray *labelArray = @[self.label1, self.label2, self.label3];
    
    for (UILabel *label in labelArray) {
        label.hidden = YES;
        label.text = @"";
    }
    
    for (NSLayoutConstraint *constraint in constraintArray) {
        constraint.constant = 0;
    }
}

@end
