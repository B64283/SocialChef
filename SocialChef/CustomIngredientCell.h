//
//  CustomIngredientCell.h
//  SocialChef
//
//  Created by Matthew Darke on 11/17/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface CustomIngredientCell : UITableViewCell {


IBOutlet UILabel * ingredLable;
IBOutlet UILabel * measureLable;


}

-(void)refreshCell;

@property(nonatomic, strong) NSString *ingredNameText;
//@property(nonatomic, strong) NSString *measureNumberText;


@end
