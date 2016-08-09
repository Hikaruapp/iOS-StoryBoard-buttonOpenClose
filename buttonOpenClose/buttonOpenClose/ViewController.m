//
//  ViewController.m
//  buttonOpenClose
//
//  Created by Yanase Yuji on 2016/08/09.
//  Copyright © 2016年 hikaruApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)buttonOpenClose:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button1Height;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (nonatomic) BOOL isAnimationOpenClose;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonOpenClose:(id)sender {
    [self btnOpenCloseAnimation];
}

- (void)btnOpenCloseNonAnimation {
    // アニメーション無し
    if (self.button1.hidden) {
        // Open
        self.button1Height.constant = 30;
        self.buttonTopSpace.constant = 8;
        self.button1.hidden = !self.button1.hidden;
    } else {
        // Close
        self.button1Height.constant = 0;
        self.buttonTopSpace.constant = 0;
        self.button1.hidden = !self.button1.hidden;
    }
}

- (void)btnOpenCloseAnimation {
    
    // ボタン連打対策
    if (self.isAnimationOpenClose) {
        return;
    }
    
    self.isAnimationOpenClose = YES;
    
    
    // アニメーション
    [self.view setNeedsUpdateConstraints];
    
    if (self.button1.hidden) {
        // Open
        self.button1Height.constant = 30;
        self.buttonTopSpace.constant = 8;
        self.button1.hidden = !self.button1.hidden;
        [UIView animateWithDuration:0.3f
                         animations:^{
                             [self.view layoutIfNeeded];
                             self.button1.alpha = 1.0;
                         } completion:^(BOOL finished) {
                             self.isAnimationOpenClose = NO;
                         }];
    } else {
        // Close
        self.button1Height.constant = 0;
        self.buttonTopSpace.constant = 0;
        [UIView animateWithDuration:0.3f
                         animations:^{
                             [self.view layoutIfNeeded];
                             self.button1.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             self.button1.hidden = !self.button1.hidden;
                             self.isAnimationOpenClose = NO;
                         }];
    }
}

@end
