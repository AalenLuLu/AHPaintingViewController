//
//  AHPaintingDescription.h
//  AHPaintingViewControllerDemo
//
//  Created by Aalen on 2017/2/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AHPaintingDescription <NSObject>

- (CGPoint)location;
- (void)drawInContext: (CGContextRef)context;

@optional
- (UIColor *)color;
- (CGFloat)width;
- (void)drawInContext: (CGContextRef)context lastLocation: (CGPoint)lastLocation;

@end

@interface AHPaintingVertex : NSObject <AHPaintingDescription>

@property (assign, nonatomic) CGPoint location;

@end

@interface AHPaintingDot : AHPaintingVertex

@property (copy, nonatomic) UIColor *color;
@property (assign, nonatomic) CGFloat width;

@end

@interface AHPaintingStroke : NSObject <AHPaintingDescription>

@property (assign, nonatomic) CGPoint location;
@property (copy, nonatomic) UIColor *color;
@property (assign, nonatomic) CGFloat width;

- (void)addVertex: (AHPaintingVertex *)vertex;

@end

@interface AHPaintingDescription : NSObject

- (id<AHPaintingDescription>)lastDescription;
- (void)addPaintingDescription: (id<AHPaintingDescription>)description;
- (void)replaceLastDescriptionWithDescription: (id<AHPaintingDescription>)description;
- (void)drawWithContext: (CGContextRef)context;

@end
