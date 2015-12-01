//
//  MainFeedTableViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/11/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "FollowButton.h"


@interface MainFeedTableViewController : PFQueryTableViewController <FollowButtonDelegate>


- (NSIndexPath *)_indexPathForPaginationCell;
    




- (IBAction)commentButn:(id)sender;

@end
