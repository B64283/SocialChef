//
//  MainFeedCustomClass.h
//  SocialChef
//
//  Created by Matthew Darke on 11/13/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MainFeedCustomClass : NSObject
{
    
}
@property (nonatomic, strong)NSString *recipeTitle;
@property (nonatomic, strong)NSString *userName;
@property (nonatomic, strong)NSString *userFollow;
@property (nonatomic, strong)NSString *likes;




@property (nonatomic, strong)UIImage *userImage;
@property (nonatomic, strong)UIImage *recipeImage;




@end
