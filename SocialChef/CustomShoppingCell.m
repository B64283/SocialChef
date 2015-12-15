//
//  CustomShoppingCell.m
//  SocialChef
//
//  Created by Matthew Darke on 11/30/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "CustomShoppingCell.h"

@implementation CustomShoppingCell
@synthesize itemNamText, itemAmountText;



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)refreshCell

{
    itemNamLable.text = itemNamText;
    itemAmountLable.text = itemAmountText;
}



@end
