//
//  MainFeedTableViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/11/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface MainFeedTableViewController : UIViewController  <UITableViewDelegate, UITableViewDelegate>


{
    IBOutlet UITableView *myTabelView;
    NSMutableArray *recipeArray;
    
    
    
}


@property (weak, nonatomic) IBOutlet UITableView *mmyTableView;

@property (strong, nonatomic) NSMutableArray* recipeArray;

- (IBAction)commentButn:(id)sender;

@end
