//
//  CustomCell.h
//  SocialChef
//
//  Created by Matthew Darke on 11/12/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    
    IBOutlet UILabel * userNameLable;
    IBOutlet UILabel * userFollowerLable;
    IBOutlet UILabel * recipeLable;
    IBOutlet UILabel * likesLable;
    
    IBOutlet UIImageView *recipeImage;
    IBOutlet UIImageView *userImage;
    
}


-(void)refreshCellWithInfo:(NSString*)firstString secondString:(NSString*)secondString
               thirdString:(NSString*)thirdString fourthString:(NSString*)fourthString cellImage:(UIImage*)cellImage recepImage:(UIImage*)recepImage;




@end
