//
//  ViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/10/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
   
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Social-414Chef"] forBarMetrics:UIBarMetricsDefault];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
