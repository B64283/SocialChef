//
//  CustomIngredientCell.m
//  SocialChef
//
//  Created by Matthew Darke on 11/17/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "CustomIngredientCell.h"

@implementation CustomIngredientCell

@synthesize ingredNameText, measureNumberText;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)refreshCell

{
    ingredLable.text = ingredNameText;
    measureLable.text = measureNumberText;
}


@end
