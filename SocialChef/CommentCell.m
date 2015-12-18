//
//  CommentCell.m
//  SocialChef
//
//  Created by Matthew Darke on 11/25/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "CommentCell.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import <Parse/Parse.h>
@implementation CommentCell
@synthesize  commentText, userNameText, userPic;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





-(void)refreshCell

{
    
    userLable.text = userNameText;
    commentLable.text = commentText;
    _userCommentProfilePic.file = userPic;
    
}


@end
