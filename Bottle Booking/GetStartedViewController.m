//
//  GetStartedViewController.m
//  Bottle Booking
//
//  Created by Alexandre Ohayon on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "GetStartedViewController.h"

@interface GetStartedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (weak, nonatomic) IBOutlet UITextField *jobTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *mailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
- (IBAction)sendRequest:(id)sender;
- (IBAction)activateAccount:(id)sender;

@end

@implementation GetStartedViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateDateOfBirthTextField:) forControlEvents:UIControlEventValueChanged];
    [_dateOfBirthTextField setInputView:datePicker];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    //[self login];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    int movementDistance;
    if (self.view.frame.size.height - textField.frame.origin.y < 250)
    {
        movementDistance=260 - (self.view.frame.size.height - textField.frame.origin.y);
    }
    else
        movementDistance=0;
        
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


- (IBAction)dismissKeyboard:(UITapGestureRecognizer *)sender {
    [_nameTextField resignFirstResponder];
    [_dateOfBirthTextField resignFirstResponder];
    [_jobTextField resignFirstResponder];
    [_addressTextField resignFirstResponder];
    [_phoneTextField resignFirstResponder];
    [_mailTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    [_confirmPasswordTextField resignFirstResponder];
}

-(void)updateDateOfBirthTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)_dateOfBirthTextField.inputView;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/yyyy"];
    _dateOfBirthTextField.text = [format stringFromDate:picker.date];
}

- (IBAction)sendRequest:(id)sender {
    
    if ([_mailTextField.text isEqualToString:@""]) {
        UIAlertView *emptyMailAlert = [[UIAlertView alloc]initWithTitle:@"No mail !"
                                                                message:@"Please provide your mail..."
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
        [emptyMailAlert show];
    } else if ([_passwordTextField.text isEqualToString:@""]) {
        UIAlertView *emptyPasswordAlert = [[UIAlertView alloc]initWithTitle:@"No password !"
                                                                    message:@"Please provide password..."
                                                                   delegate:self
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles: nil];
        [emptyPasswordAlert show];
    } else if (![self validEmail:_mailTextField.text]) {
        UIAlertView *unvalidEmailAlert = [[UIAlertView alloc]initWithTitle:@"Unvalid Email"
                                                                   message:@"Your email is wrong !"
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles: nil];
        [unvalidEmailAlert show];
    }  else if (![_passwordTextField.text isEqualToString:_confirmPasswordTextField.text]) {
        UIAlertView *incorrectPasswordAlert = [[UIAlertView alloc]initWithTitle:@"Passwords not matching"
                                                                    message:@"Please provide password..."
                                                                   delegate:self
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles: nil];
        [incorrectPasswordAlert show];
    }   else {
        //envoyer la requete d'inscription
    }

}


- (BOOL)validEmail:(NSString *) email {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[a-z0-9._-]+@[a-z0-9._-]+$" options:NSRegularExpressionCaseInsensitive error:NULL];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:email
                                                        options:0
                                                          range:NSMakeRange(0, [email length])];
    if (numberOfMatches > 0) {
        return true;
    } else {
        return false;
    }
}

- (IBAction)activateAccount:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.bottlebooking.com"]];
}
@end
