//
//  AHPaintingViewController.m
//  AHPaintingViewControllerDemo
//
//  Created by Aalen on 2017/2/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "AHPaintingViewController.h"

#import "AHPaintingHandler.h"

@interface AHPaintingViewController ()

@property (strong, nonatomic) AHPaintingHandler *handler;

@end

@implementation AHPaintingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];
	_handler = [[AHPaintingHandler alloc] init];
	_handler.view = self.view;
	_handler.color = [UIColor blueColor];
	_handler.width = 2.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[super touchesBegan:touches withEvent:event];
	NSUInteger touchesCount = event.allTouches.count;
	if(1 == touchesCount)
	{
		CGPoint location = [touches.anyObject locationInView: self.view];
		[_handler touchDownWithLocation: location];
	}
	else if(2 == touchesCount)
	{
		
	}
	else
	{
		
	}
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[super touchesMoved:touches withEvent:event];
	NSUInteger touchesCount = event.allTouches.count;
	
	if(1 == touchesCount)
	{
		CGPoint location = [touches.anyObject locationInView: self.view];
		[_handler touchMoveWithLocation: location];
	}
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[super touchesEnded:touches withEvent:event];
	NSUInteger touchesCount = event.allTouches.count;
	
	if(1 == touchesCount)
	{
		CGPoint location = [touches.anyObject locationInView: self.view];
		[_handler touchUpWithLocation: location];
	}
	else if(2 == touchesCount)
	{
		
	}
	else
	{
		
	}
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[super touchesCancelled:touches withEvent:event];
	NSUInteger touchesCount = event.allTouches.count;
	
	if(1 == touchesCount)
	{
		CGPoint location = [touches.anyObject locationInView: self.view];
		[_handler touchCancelWithLocation: location];
	}
	else if(2 == touchesCount)
	{
		
	}
	else
	{
		
	}
}

@end
