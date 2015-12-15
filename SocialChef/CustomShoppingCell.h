//
//  CustomShoppingCell.h
//  SocialChef
//
//  Created by Matthew Darke on 11/30/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CustomShoppingCell : UITableViewCell
{

IBOutlet UILabel * itemNamLable;
IBOutlet UILabel * itemAmountLable;



}

-(void)refreshCell;

@property(nonatomic, strong) NSString *itemNamText;
@property(nonatomic, strong) NSString *itemAmountText;
@end
