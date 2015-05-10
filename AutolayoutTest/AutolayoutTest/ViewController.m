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
@property (strong, nonatomic) NSArray *orgTexts;
@property (strong, nonatomic) NSArray *orgWidths;
@property (strong, nonatomic) NSArray *constraintArray;
@property (strong, nonatomic) NSArray *labelArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.orgWidths = @[
                       @(self.space1.constant),
                       @(self.space2.constant),
                       @(self.space3.constant)
                       ];
    self.orgTexts = @[
                      self.label1.text,
                      self.label2.text,
                      self.label3.text
                      ];
    
    self.constraintArray = @[self.space1, self.space2, self.space3];
    self.labelArray = @[self.label1, self.label2, self.label3];
    
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
    for (UILabel *label in self.labelArray) {
        label.hidden = NO;
        NSInteger idx = [self.labelArray indexOfObject:label];
        label.text = self.orgTexts[idx];
    }
    
    for (NSLayoutConstraint *constraint in self.constraintArray) {
        constraint.constant = 20;
    }
}

- (void)hide {
    
    for (UILabel *label in self.labelArray) {
        label.hidden = YES;
        label.text = @"";
    }
    
    for (NSLayoutConstraint *constraint in self.constraintArray) {
        constraint.constant = 0;
    }
}

@end
