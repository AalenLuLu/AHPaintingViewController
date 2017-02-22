//
//  AHPaintingHandler.m
//  AHPaintingViewControllerDemo
//
//  Created by Aalen on 2017/2/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "AHPaintingHandler.h"

#import "AHPaintingDescription.h"

@interface AHPaintingHandler ()

@property (strong, nonatomic) AHPaintingDescription *paintingDescription;
@property (strong, nonatomic) dispatch_queue_t paintingQueue;

@end

@implementation AHPaintingHandler

- (instancetype)init
{
	if(self = [super init])
	{
		_paintingDescription = [[AHPaintingDescription alloc] init];
		_paintingQueue = dispatch_queue_create("com.aalen.paintingviewcontroller.queue.painting", DISPATCH_QUEUE_SERIAL);
	}
	return self;
}

- (void)draw
{
	if(_view)
	{
		dispatch_async(_paintingQueue, ^{
			@autoreleasepool {
				CGFloat width = _view.bounds.size.width;
				CGFloat height = _view.bounds.size.height;
				CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast);
				CGContextTranslateCTM(context, 0, height);
				CGContextScaleCTM(context, 1, -1);
				[_paintingDescription drawWithContext: context];
				CGImageRef imageRef = CGBitmapContextCreateImage(context);
				UIImage *image = [[UIImage alloc] initWithCGImage: imageRef];
				CGImageRelease(imageRef);
				CGContextRelease(context);
				dispatch_async(dispatch_get_main_queue(), ^{
					_view.layer.contents = (__bridge id)image.CGImage;
				});
			}
		});
	}
}

- (void)touchDownWithLocation:(CGPoint)location
{
	AHPaintingStroke *stroke = [[AHPaintingStroke alloc] init];
	stroke.location = location;
	stroke.color = _color;
	stroke.width = _width;
	[_paintingDescription addPaintingDescription: stroke];
}

- (void)touchMoveWithLocation:(CGPoint)location
{
	AHPaintingStroke *stroke = [_paintingDescription lastDescription];
	AHPaintingVertex *vertex = [[AHPaintingVertex alloc] init];
	vertex.location = location;
	[stroke addVertex: vertex];
	//setNeedsDisplay
	[self draw];
}

- (void)touchUpWithLocation:(CGPoint)location
{
	AHPaintingStroke *stroke = [_paintingDescription lastDescription];
	if(location.x == stroke.location.x && location.y == stroke.location.y)
	{
		AHPaintingDot *dot = [[AHPaintingDot alloc] init];
		dot.location = location;
		dot.color = _color;
		dot.width = _width;
		[_paintingDescription replaceLastDescriptionWithDescription: dot];
		//setNeedsDisplay
		[self draw];
	}
}

- (void)touchCancelWithLocation:(CGPoint)location
{
	
}

@end
