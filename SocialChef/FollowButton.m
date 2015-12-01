//
//  FollowButton.m
//  SocialChef
//
//  Created by Matthew Darke on 11/29/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "FollowButton.h"

@implementation FollowButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)buttonTapped {
    
    [self.delegate followButton:self didTapWithSectionIndex:self.sectionIndex];
    
    
}



-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    [self addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    return self;

}






@end
