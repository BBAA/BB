//
//  LoginViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "LoginViewController.h"
#import "Login.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (nonatomic,strong) Login *loginModel;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (IBAction)forgotYourPassword {
    NSString *mail = _mailTextfield.text;
    if ([mail isEqualToString:@""]) {
        UIAlertView *emptyMailAlert = [[UIAlertView alloc]initWithTitle:@"No mail !"
                                                                    message:@"Please provide your mail..."
                                                                   delegate:self
                                                          cancelButtonTitle:@"Of course..."
                                                          otherButtonTitles: nil];
        [emptyMailAlert show];
    } else if (![self validEmail:mail]) {
        UIAlertView *unvalidEmailAlert = [[UIAlertView alloc]initWithTitle:@"Unvalid Email"
                                                                   message:@"Your email is wrong !"
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles: nil];
        [unvalidEmailAlert show];
    } else {
        [self.loginModel forgotPasswordUsingMail:mail inBackgroundWithBlock:^(int succeeded) {
            if (succeeded) {
                UIAlertView *sentMailAlert = [[UIAlertView alloc]initWithTitle:@"Forgot your password ?"
                                                                       message:@"An email has been sent to you !"
                                                                      delegate:self
                                                             cancelButtonTitle:@"Great!"
                                                             otherButtonTitles: nil];
                [sentMailAlert show];
            } else {
	            UIAlertView *wrongMailAlert = [[UIAlertView alloc]initWithTitle:@"Wrong Email"
                                                                       message:@"Your email is wrong !"
                                                                      delegate:self
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles: nil];
    	        [wrongMailAlert show];
            }
        }];
    }
}

- (IBAction)login {
    NSString *mail = _mailTextfield.text;
    NSString *password = _passwordTextfield.text;
    if ([mail isEqualToString:@""]) {
        UIAlertView *emptyMailAlert = [[UIAlertView alloc]initWithTitle:@"No mail !"
                                                                    message:@"Please provide your mail..."
                                                                   delegate:self
                                                          cancelButtonTitle:@"Of course..."
                                                          otherButtonTitles: nil];
        [emptyMailAlert show];
    } else if ([password isEqualToString:@""]) {
        UIAlertView *emptyPasswordAlert = [[UIAlertView alloc]initWithTitle:@"No password !"
                                                                    message:@"Please provide password..."
                                                                   delegate:self
                                                          cancelButtonTitle:@"Of course..."
                                                          otherButtonTitles: nil];
        [emptyPasswordAlert show];
    } else if (![self validEmail:mail]) {
        UIAlertView *unvalidEmailAlert = [[UIAlertView alloc]initWithTitle:@"Unvalid Email"
                                                                   message:@"Your email is wrong !"
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles: nil];
        [unvalidEmailAlert show];
    } else {
        [self.loginModel loginWithMail:mail andpassword:password inBackgroundWithBlock:^(int succeeded) {
            if (succeeded) {
                [self performSegueWithIdentifier:@"login" sender:self];
            } else {
                UIAlertView *wrongCredentialsAlert = [[UIAlertView alloc]initWithTitle:@"Wrong combination!" message:@"Please double check your informations" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [wrongCredentialsAlert show];
            }
        }];
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self login];
	return YES;
}
- (IBAction)dismissKeyboard:(UITapGestureRecognizer *)sender {
    [_passwordTextfield resignFirstResponder];
    [_mailTextfield resignFirstResponder];
}

- (Login *)loginModel
{
    if (!_loginModel) _loginModel = [[Login alloc]init];
    return _loginModel;
}
@end
