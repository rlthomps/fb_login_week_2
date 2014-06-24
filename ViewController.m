//
//  ViewController.m
//  fb_login_week_2
//
//  Created by Robert Thompson on 6/22/14.
//  Copyright (c) 2014 Google. All rights reserved.
//

#import "ViewController.h"
#import "FeedViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameBox;
@property (weak, nonatomic) IBOutlet UITextField *passwordBox;
- (IBAction)logInButton:(id)sender;
- (IBAction)KeyboardDimiss:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)passwordEditingChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *loginGroupView;
- (IBAction)emailTouchDown:(id)sender;
- (IBAction)passwordTouchDown:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *signupText;
- (void)authenticate;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginWaitSpinner;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;



@end

@implementation ViewController

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
    
    self.passwordBox.secureTextEntry = YES;
    self.loginButton.enabled = NO;
    
    //hide wait spinner
    self.loginWaitSpinner.layer.opacity = 0;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logInButton:(id)sender {

    //show spinner
    self.loginWaitSpinner.layer.opacity = 1;

    //start spinning
    [self.loginWaitSpinner startAnimating];

    //change button state
    self.loginButton.selected = YES;
    
    //kick off the authenticate method with delay
    [self performSelector:@selector(authenticate) withObject:nil afterDelay:2];
    
}

- (IBAction)KeyboardDimiss:(id)sender {
    [self.view endEditing:YES];
    NSLog(@"KEYBOARD DISMISS");
    
    [UIView animateWithDuration:0.4 animations:^{  self.loginGroupView.frame = CGRectMake(self.loginGroupView.frame.origin.x, 97,self.loginGroupView.frame.size.width,self.loginGroupView.frame.size.height); }];
    
    
    
    [UIView animateWithDuration:0.4 animations:^{      self.signupText.frame = CGRectMake(self.signupText.frame.origin.x, 455, self.signupText.frame.size.width, self.signupText.frame.size.height); }];
    
}




- (void)authenticate {

    //stop the spinning
    [self.loginWaitSpinner stopAnimating];
    
    NSString *passwordText = self.passwordBox.text;

  if ([passwordText isEqualToString:@"password"]) {
  
    
        FeedViewController *vc = [[FeedViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
      
        [self presentViewController:vc animated:YES completion:nil];
        
        
    } else {
        
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        //hide spinner
        self.loginWaitSpinner.layer.opacity = 0;
        
        //stop spinning
        [self.loginWaitSpinner stopAnimating];
        
        //change button state
        self.loginButton.selected = NO;
    }

    
    
}

- (IBAction)passwordEditingChanged:(id)sender {
    
    self.loginButton.enabled = YES;
    
}
- (IBAction)emailTouchDown:(id)sender {
    
    [self repositionFields];
    
}

- (IBAction)passwordTouchDown:(id)sender {
    
    [self repositionFields];
    
}

- (void)repositionFields {
    
        [UIView animateWithDuration:0.2 animations:^{  self.loginGroupView.frame = CGRectMake(self.loginGroupView.frame.origin.x, 20,self.loginGroupView.frame.size.width,self.loginGroupView.frame.size.height); }];
    

    
     [UIView animateWithDuration:0.2 animations:^{      self.signupText.frame = CGRectMake(self.signupText.frame.origin.x, 280, self.signupText.frame.size.width, self.signupText.frame.size.height); }];
    

    
    
    
}


- (void)codeGraveyard {
    

    
    
}
@end
