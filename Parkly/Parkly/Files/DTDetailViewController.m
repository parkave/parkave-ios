//
//  DTDetailViewController.m
//  Parkly
//
//  Created by Shelby Vanhooser on 2/21/14.
//  Copyright (c) 2014 DevTeam14. All rights reserved.
//

#import "DTDetailViewController.h"
#import "DTReviewTableViewController.h"
#import "DTSpotTableViewController.h"
#import "DTBuyViewController.h"
#import "DTModel.h"

@interface DTDetailViewController ()

@property (strong, nonatomic) DTSpotTableViewController *spotTable;

@end

@implementation DTDetailViewController

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
  if(self.lot){
    [self initialize];
    [[DTModel sharedInstance] imageForLot:self.lot success:^(NSURLSessionDataTask *task, id responseObject) {
      [self.imageView setImage:responseObject];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
      [self.imageView setImage:nil];
    }];
  } else {
    NSLog(@"Lot doesn't exist");
  }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initialize
{
  self.lotOwner.text = [NSString stringWithFormat:@"%@", self.lot.title];
  //self.distanceToVenue.text = [NSString stringWithFormat:@"%.1f mi", self.lot.distance.floatValue];
  //self.averageReview.text = [NSString stringWithFormat:@"%.1f", self.lot.averageRating.floatValue];
  //self.averagePrice.text = [NSString stringWithFormat:@"$%.2f", self.lot.averagePrice.floatValue];
  UIImage *theImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.lot.imagePath]]];
  [self.imageView setImage:theImage];
  [self didDeselectRow];
}

- (IBAction)bookSpot:(id)sender
{
  if(self.spotTable.theTable.indexPathForSelectedRow){
    //if([[DTModel sharedInstance] userHasAccount]){
      //if([[DTModel sharedInstance] userIsLoggedIn]){
        [self performSegueWithIdentifier:@"bookIt" sender:self];
     // } else {
    ////    [self logIn];
  //    }
   // } else {
    //  [self createAccount];
   // }
  }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if([[segue identifier] isEqualToString:@"goToReview"]){
    DTReviewTableViewController *reviewController = [segue destinationViewController];
    reviewController.userID = self.lot.user_id;
  } else if([[segue identifier] isEqualToString:@"embed"]){
    self.spotTable  = [segue destinationViewController];
    self.spotTable.theLot = self.lot;
    self.spotTable.delegate = self;
  } else if([[segue identifier] isEqualToString:@"bookIt"]){
     DTParkingSpot *selectedSpot = self.spotTable.spots[self.spotTable.theTable.indexPathForSelectedRow.row];
    DTBuyViewController *buyViewController = [segue destinationViewController];
    buyViewController.theLot = self.lot;
    buyViewController.theSpot = selectedSpot;
  }
}

-(void)didSelectRow
{
  [self.bookItButton setEnabled:YES];
  
  [self.bookItButton setAlpha:1.0f];
}

-(void)didDeselectRow
{
  [self.bookItButton setEnabled:NO];
  [self.bookItButton setAlpha:0.4f];
}

-(void)logIn
{
  
}

-(void)createAccount
{
  
}

@end