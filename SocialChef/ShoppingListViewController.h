//
//  ShoppingListViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 12/3/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CustomShoppingCell.h"

@interface ShoppingListViewController : UIViewController <UITableViewDelegate, UIAlertViewDelegate, UITableViewDataSource>


{
    
    NSMutableArray *userStringArray;
    
}



//@property (strong, nonatomic) NSMutableArray* userStringArray;

@property (weak, nonatomic) IBOutlet UITableView* myShoppingTableView;


@end
