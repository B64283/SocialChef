//
//  FollowButton.h
//  SocialChef
//
//  Created by Matthew Darke on 11/29/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FollowButton;
@protocol FollowButtonDelegate

-(void) followButton:(FollowButton * )button didTapWithSectionIndex:(NSInteger)index;






@end



@interface FollowButton : UIButton



@property (nonatomic, assign)NSInteger sectionIndex;
@property (nonatomic, weak)id <FollowButtonDelegate> delegate;


@end
