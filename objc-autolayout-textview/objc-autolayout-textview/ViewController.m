//
//  ViewController.m
//  objc-autolayout-textview
//
//  Created by David Park on 6/27/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic)UITraitCollection *portrait;
@property (strong, nonatomic)UITraitCollection *landscape;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.myTextView.translatesAutoresizingMaskIntoConstraints = NO;

    [self removeAllConstraintsOnScreen];
    
    [self.leftButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    [self.leftButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    
    [self.rightButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    [self.rightButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    
    [self.myTextView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;
    [self.myTextView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.myTextView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:10].active = YES;

    NSLog(@"%f",[[UIScreen mainScreen] bounds].size.height);
    
    if ([[UIScreen mainScreen] bounds].size.height == 667 || [[UIScreen mainScreen] bounds].size.height == 736) {                    //iphone6 || iphone 6+
        [self.myTextView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-40].active = YES;
    } else {                                                                                                                         //all other phones
        [self.myTextView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    }


    
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    if (size.height > size.width) {

        [self.myTextView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
        
    } else {
        
        [self.myTextView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    }
    
    
}

-(void)removeAllConstraintsOnScreen {
    
    [self.view removeConstraints:self.view.constraints];
    [self.leftButton removeConstraints:self.leftButton.constraints];
    [self.rightButton removeConstraints:self.rightButton.constraints];
    [self.myTextView removeConstraints:self.myTextView.constraints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
