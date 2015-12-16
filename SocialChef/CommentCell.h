//
//  CommentCell.h
//  SocialChef
//
//  Created by Matthew Darke on 11/25/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface CommentCell : UITableViewCell
{

    IBOutlet UILabel * userLable;
    
    IBOutlet UILabel * commentLable;



}

-(void)refreshCell;


@property(nonatomic, strong) NSString *commentText;
@property(nonatomic, strong) NSString *userNameText;
@end
