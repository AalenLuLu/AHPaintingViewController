//
//  AHPaintingHandler.h
//  AHPaintingViewControllerDemo
//
//  Created by Aalen on 2017/2/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHPaintingHandler : NSObject

@property (weak, nonatomic) UIView *view;
@property (strong, nonatomic) UIColor *color;
@property (assign, nonatomic) CGFloat width;

- (void)touchDownWithLocation: (CGPoint)location;
- (void)touchMoveWithLocation: (CGPoint)location;
- (void)touchUpWithLocation: (CGPoint)location;
- (void)touchCancelWithLocation: (CGPoint)location;

@end
