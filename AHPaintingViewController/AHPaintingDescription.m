//
//  AHPaintingDescription.m
//  AHPaintingViewControllerDemo
//
//  Created by Aalen on 2017/2/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "AHPaintingDescription.h"

@implementation AHPaintingVertex

- (void)drawInContext:(CGContextRef)context
{
	CGContextAddLineToPoint(context, _location.x, _location.y);
}

- (void)drawInContext:(CGContextRef)context lastLocation:(CGPoint)lastLocation
{
	CGContextAddQuadCurveToPoint(context, lastLocation.x, lastLocation.y, (lastLocation.x + _location.x) * 0.5, (lastLocation.y + _location.y) * 0.5);
}

@end

@implementation AHPaintingDot

- (void)drawInContext:(CGContextRef)context
{
	CGContextSetFillColorWithColor(context, _color.CGColor);
	CGContextAddEllipseInRect(context, CGRectMake(self.location.x - _width * 0.5, self.location.y - _width * 0.5, _width, _width));
	CGContextFillPath(context);
}

@end

@interface AHPaintingStroke ()

@property (strong, nonatomic) NSMutableArray *strokes;

@end

@implementation AHPaintingStroke

- (instancetype)init
{
	if(self = [super init])
	{
		_strokes = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)drawInContext:(CGContextRef)context
{
	CGContextMoveToPoint(context, _location.x, _location.y);
	CGPoint lastLocation = _location;
	for(id<AHPaintingDescription> description in _strokes)
	{
		[description drawInContext: context lastLocation: lastLocation];
		lastLocation = [description location];
	}
	
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextSetStrokeColorWithColor(context, _color.CGColor);
	CGContextSetLineWidth(context, _width);
	CGContextStrokePath(context);
}

- (void)addVertex:(AHPaintingVertex *)vertex
{
	[_strokes addObject: vertex];
}

@end

@interface AHPaintingDescription ()

@property (strong, nonatomic) NSMutableArray<id<AHPaintingDescription>> *descriptions;

@end

@implementation AHPaintingDescription

- (instancetype)init
{
	if(self = [super init])
	{
		_descriptions = [[NSMutableArray alloc] init];
	}
	return self;
}

- (id<AHPaintingDescription>)lastDescription
{
	return _descriptions.lastObject;
}

- (void)addPaintingDescription:(id<AHPaintingDescription>)description
{
	[_descriptions addObject: description];
}

- (void)replaceLastDescriptionWithDescription:(id<AHPaintingDescription>)description
{
	[_descriptions replaceObjectAtIndex: _descriptions.count - 1 withObject: description];
}

- (void)drawWithContext:(CGContextRef)context
{
	for(id<AHPaintingDescription> description in _descriptions)
	{
		[description drawInContext: context];
	}
}

@end
