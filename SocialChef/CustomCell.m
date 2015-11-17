//
//  CustomCell.m
//  SocialChef
//
//  Created by Matthew Darke on 11/12/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)refreshCellWithInfo:(NSString*)firstString secondString:(NSString*)secondString
          thirdString:(NSString*)thirdString fourthString:(NSString*)fourthString cellImage:(UIImage*)cellImage recepImage:(UIImage*)recepImage;

{
        //followerString.text = userNameLable;
    
    userNameLable.text = firstString;
    userFollowerLable.text = secondString;
    recipeLable.text = thirdString ;
    likesLable.text = fourthString;
    
    
    
    userImage.image = cellImage;
    recipeImage.image = recepImage;
    
    
    
    
    
}





@end
