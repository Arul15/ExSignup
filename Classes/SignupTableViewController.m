//
//  SignupTableViewController.m
//  ExSignup
//
//  Created by Nada Jaksic on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SignupTableViewController.h"

@implementation SignupTableViewController
@synthesize cellFirstname, cellLastname, cellEmail, cellPassword, cellConfirmPassword, cellGender;
@synthesize txtFirstname, txtLastname, txtEmail, txtGender, txtPassword, txtConfirmPassword;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad 
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;

	UIBarButtonItem* btnSubmitSignup = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"Join",@"") style:UIBarButtonItemStylePlain target:self action:@selector(signup)];
	[[self navigationItem] setRightBarButtonItem:btnSubmitSignup];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{		
		if (indexPath.row == 0) {
			return cellFirstname;
		}
		if (indexPath.row == 1) {
			return cellLastname;
		}
		if (indexPath.row == 2) {
			return cellEmail;
		}
		if (indexPath.row == 3) {
			return cellPassword;
		}
		if (indexPath.row == 4) {
			return cellConfirmPassword;
		}
	
		return cellGender;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{ 
	[textField resignFirstResponder];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	
	if (textField == txtGender)
	{
		UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Gender", @"")
																 delegate:self
														cancelButtonTitle:nil
												   destructiveButtonTitle:nil
														otherButtonTitles:NSLocalizedString(@"Male",@""), 
																		  NSLocalizedString(@"Female",@""),
																		  NSLocalizedString(@"NoGender", @""), nil];
		[actionSheet showInView:self.view];
		[actionSheet release];		
	}	
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	NSLog(@"Index is %i", buttonIndex);
	switch(buttonIndex){
		case 0:
			txtGender.text = NSLocalizedString(@"Male",@"");
			break;
		case 1:
			txtGender.text = NSLocalizedString(@"Female",@"");
			break;
		case 2:
			txtGender.text = NSLocalizedString(@"NoGender", @"");
			break;
		default:
			break;
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

-(void) signup
{
	// make sure the keyboard is hidden
	[txtFirstname resignFirstResponder];
	[txtLastname resignFirstResponder];
	[txtEmail resignFirstResponder];
	[txtPassword resignFirstResponder];
	[txtConfirmPassword resignFirstResponder];
		
	activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[activityIndicator setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0+20)]; 
	[activityIndicator startAnimating];
	[self.view addSubview:activityIndicator]; 	
		
	if (![self validateSignupForm])
		return;

	//do your signup code here
	
}

-(BOOL)validateSignupForm
{
	BOOL rtn = YES; 
	// Declare your Alert,  NSArray, increment int
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"FormIncomplete", @"") delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	NSArray *fieldArray;	
	int i = 0;
	
	// Load up our field array with the UITextField Values
	fieldArray = [[NSArray arrayWithObjects: 
				   [NSString stringWithFormat:@"%@",txtFirstname.text], 
				   [NSString stringWithFormat:@"%@",txtLastname.text], 
				   [NSString stringWithFormat:@"%@",txtEmail.text], 
				   [NSString stringWithFormat:@"%@",txtPassword.text], 
				   [NSString stringWithFormat:@"%@",txtConfirmPassword.text],
				   [NSString stringWithFormat:@"%@",txtGender.text], nil] retain];
	
	
	// loop through the array, alert if text field is empty, and break the the loop, other wise increment i  
	for (NSString *fieldText in fieldArray){
		NSLog(fieldText); // make sure all is reading correctly in the console
		if([fieldText isEqualToString:@""]){			
			[alert show]; 	
			rtn = NO;
			break; // break out!!
		}
		i++;		
	}
	
	// check that all the field were passed (i == array.count) 
	if(i == [[NSNumber numberWithInt: fieldArray.count] intValue]){
		NSLog(@"Passed validation..."); 
		rtn = YES;           
	}
	
	if (rtn)
	{
		// validate email address
		NSString* emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
		NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
		rtn = [emailTest evaluateWithObject:txtEmail.text];
		if (!rtn)
		{
			[alert setMessage:NSLocalizedString(@"BadEmail", @"")];
			[alert show];		
		}
		else {
			rtn = [txtPassword.text isEqualToString:txtConfirmPassword.text];
			if (!rtn)
			{
				[alert setMessage:NSLocalizedString(@"ConfirmPwdError", @"")];
				[alert show];
			}
		}
	}
	
	// release it all
	[alert release];
	[fieldArray release];
	return rtn;
}

- (void)dealloc {
	[cellFirstname release];
	[cellLastname release];
	[cellEmail release];
	[cellPassword release];
	[cellConfirmPassword release];
	[cellGender release];
	[txtFirstname release];
	[txtLastname release];
	[txtEmail release];
	[txtGender release];
	[txtPassword release];
	[txtConfirmPassword release];
	[activityIndicator release];
    [super dealloc];
}


@end

