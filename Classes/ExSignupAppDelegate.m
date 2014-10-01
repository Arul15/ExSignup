//
//  ExSignupAppDelegate.m
//  ExSignup
//
//  Created by Nada Jaksic on 2/25/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "ExSignupAppDelegate.h"
#import "SignupTableViewController.h"

@implementation ExSignupAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
		
	UINavigationController* nc;
	nc = [[UINavigationController alloc]init];
    SignupTableViewController* signupVC = [[SignupTableViewController alloc]initWithNibName:@"SignupTableViewController" bundle:nil];
	signupVC.title = NSLocalizedString(@"SignUp", @"");
	[nc pushViewController:signupVC animated:NO];
	[signupVC release];
	[window addSubview:nc.view];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
