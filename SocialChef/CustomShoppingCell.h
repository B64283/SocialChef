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

IBOutlet UILabel * itemNameLable;
IBOutlet UILabel * itemNumberLable;



}

-(void)refreshCell;

@property(nonatomic, strong) NSString *itemNameText;
@property(nonatomic, strong) NSString *itemNumberText;
@end
