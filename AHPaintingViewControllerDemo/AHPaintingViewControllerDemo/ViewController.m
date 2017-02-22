//
//  ViewController.m
//  AHPaintingViewControllerDemo
//
//  Created by Aalen on 2017/2/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "ViewController.h"

#import "AHPaintingViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	AHPaintingViewController *viewController = [[AHPaintingViewController alloc] init];
	[self presentViewController: viewController animated: NO completion: nil];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
