//
//  LikesButton.h
//  SocialChef
//
//  Created by Matthew Darke on 12/1/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LikesButton;
@protocol LikesButtonDelegate

-(void) likesButton:(LikesButton * )button didTapWithSectionIndex:(NSInteger)index;






@end



@interface LikesButton : UIButton



@property (nonatomic, assign)NSInteger sectionIndex;
@property (nonatomic, weak)id <LikesButtonDelegate> delegate;


@end
