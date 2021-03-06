//
//  SCRootViewController.m
//  SubjectiveCImagePan
//
//  Created by Sam Page on 16/02/14.
//  Copyright (c) 2014 Sam Page. All rights reserved.
//

#import "SCRootViewController.h"

@interface SCRootViewController ()
@property (nonatomic, strong) SCImagePanViewController *imagePanViewController;
@end

@implementation SCRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    self.imagePanViewController = [[SCImagePanViewController alloc] initWithMotionManager:motionManager];
    self.imagePanViewController.disablePinchZoom = NO; // set to YES to disable pinch/zoom


    [self.imagePanViewController willMoveToParentViewController:self];
    
    [self addChildViewController:self.imagePanViewController];
    [self.view addSubview:self.imagePanViewController.view];
    
    self.imagePanViewController.view.frame = self.view.bounds;
    self.imagePanViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self.imagePanViewController didMoveToParentViewController:self];
    
    UIImage *panoramaImage = [UIImage imageNamed:@"melbourne.jpg"];
    [self.imagePanViewController configureWithImage:panoramaImage];
	self.imagePanViewController.delegate  = self;
}

- (UIViewController *)childViewControllerForStatusBarHidden
{
    return self.imagePanViewController;
}

#pragma mark - SCImagePanViewDelegate
-(void)exitImagePanViewController {
	NSLog(@"Exit fired");
}

@end
