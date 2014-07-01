//
//  FeedViewController.m
//  fb_login_week_2
//
//  Created by Robert Thompson on 6/22/14.
//  Copyright (c) 2014 Google. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedActivityIndicator;

@end

@implementation FeedViewController

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
    // Do any additional setup after loading the view from its nib.
    self.feedImageView.hidden = YES;
    

    //start spinning
    [self.feedActivityIndicator startAnimating];
    
    //kick off the authenticate method with delay
    [self performSelector:@selector(moveFeed) withObject:nil afterDelay:2];
    
    
    
    //navbar items

    UIButton *peopleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    peopleButton.frame = CGRectMake(0, 0, 40, 40);
    [peopleButton setImage:[UIImage imageNamed:@"people.png"] forState:UIControlStateNormal];
   

    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc] init];
    [rightButton setCustomView:peopleButton];
        self.navigationItem.rightBarButtonItem = rightButton;
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, 40, 40);
    [searchButton setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
   
    
    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc] init];
    [leftButton setCustomView:searchButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    //navbar color

    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:68. green:99 blue:166 alpha:0]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.opaque = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moveFeed {
    
    self.feedImageView.hidden = NO;
    //show spinner
    self.feedActivityIndicator.layer.opacity = 0;
    
    //bring feed into view after activity indicator
}

@end
