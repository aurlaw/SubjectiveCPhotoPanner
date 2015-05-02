//
//  SCImagePanViewController.h
//  SubjectiveCImagePan
//
//  Created by Sam Page on 16/02/14.
//  Copyright (c) 2014 Sam Page. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@protocol SCImagePanViewDelegate <NSObject>

@required
-(void)exitImagePanViewController;

@end

@interface SCImagePanViewController : UIViewController

- (id)initWithMotionManager:(CMMotionManager *)motionManager;
- (void)configureWithImage:(UIImage *)image;
@property (nonatomic, weak) id<SCImagePanViewDelegate> delegate;
@property BOOL disablePinchZoom;
@end
