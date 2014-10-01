//
//  SignupTableViewController.h
//  ExSignup
//
//  Created by Nada Jaksic on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SignupTableViewController : UITableViewController<UITextFieldDelegate, UIActionSheetDelegate>
{
	IBOutlet UITableViewCell *cellFirstname;
    IBOutlet UITableViewCell *cellLastname;
    IBOutlet UITableViewCell *cellEmail;
	IBOutlet UITableViewCell *cellPassword;
	IBOutlet UITableViewCell *cellConfirmPassword;
	IBOutlet UITableViewCell *cellGender;		
	
	IBOutlet UITextField* txtFirstname;
	IBOutlet UITextField* txtLastname;
	IBOutlet UITextField* txtEmail;
	IBOutlet UITextField* txtGender;
	IBOutlet UITextField* txtPassword;
	IBOutlet UITextField* txtConfirmPassword;

	UIActivityIndicatorView* activityIndicator;


}

@property (nonatomic, retain) IBOutlet UITableViewCell *cellFirstname;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellLastname;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellEmail;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellPassword;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellConfirmPassword;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellGender;
@property (nonatomic, retain) IBOutlet UITextField* txtFirstname;
@property (nonatomic, retain) IBOutlet UITextField* txtLastname;
@property (nonatomic, retain) IBOutlet UITextField* txtEmail;
@property (nonatomic, retain) IBOutlet UITextField* txtGender;
@property (nonatomic, retain) IBOutlet UITextField* txtPassword;
@property (nonatomic, retain) IBOutlet UITextField* txtConfirmPassword;

-(void)signup;

@end
