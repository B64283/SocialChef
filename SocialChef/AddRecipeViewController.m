//
//  AddRecipeViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/17/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "AddRecipeViewController.h"
#import "CustomIngredientCell.h"
#import "AddIngredientsViewController.h"
#import <Parse/Parse.h>
@interface AddRecipeViewController ()
//@property (nonatomic, strong) UIImage *anImage;
//@property (nonatomic, strong) UIImage *image;
//
//@property (nonatomic, strong) PFFile *thumbnailFile;
//@property (nonatomic, assign) UIBackgroundTaskIdentifier fileUploadBackgroundTaskId;
//@property (nonatomic, assign) UIBackgroundTaskIdentifier photoPostBackgroundTaskId;
//
@end

@implementation AddRecipeViewController

//@synthesize image;
////@synthesize commentTextField;
//@synthesize photoFile;
//@synthesize thumbnailFile;
//@synthesize fileUploadBackgroundTaskId;
//@synthesize photoPostBackgroundTaskId;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Back";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    [self performSelector:@selector(retrieveFromParse)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)retrieveFromParse
{
    PFQuery *query = [PFQuery queryWithClassName:@"newSavedItems"];
    [query orderByAscending:@"createdAt"];
    [query fromLocalDatastore];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            userStrIngArray = [[NSMutableArray alloc]initWithArray:objects];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        
        [_myIngredientTableView reloadData];
        
    }];
    
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        picker = [[UIImagePickerController alloc]init];
        if (picker != nil)
        {
            //type of media
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate =self;
            
            picker.allowsEditing = true;
            
            [self presentViewController:picker animated:true completion:nil];
        }

    
    
    
    }else if (buttonIndex == 1){
        
        
        UIImagePickerController *albumPicker = [[UIImagePickerController alloc]init];
        if (albumPicker != nil)
        {
            //type of media
            albumPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            albumPicker.delegate =self;
            
            albumPicker.allowsEditing = true;
            
            [self presentViewController:albumPicker animated:true completion:nil];
        }

        
        
    }
    
    
}

-(IBAction)Sharerecipe:(id)sender{
    
    
    if (imageView.image) {
        NSData *imageData = UIImagePNGRepresentation(imageView.image);
        PFFile *photoFile = [PFFile fileWithData:imageData];
        PFObject *photo = [PFObject objectWithClassName:@"Takenphoto"];
        photo [@"Takenimage"] = photoFile;
        photo [@"whoIsuser"] = [PFUser currentUser];
        [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
            if (!succeeded) {
                [self showError];
            }
            
        }];
        
        
        
    }
    else{
        [self showError];
        
    }
    
    [self.tabBarController setSelectedIndex:0];


}

-(void)showError {
    
    UIAlertView *Alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"could not upload your photo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
    
    
    
    
}


-(IBAction)TakePhoto:(id)sender {
    
    UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"please Take a photo or select from album" message:nil delegate:self cancelButtonTitle:@"Take photo" otherButtonTitles: @"From Album", nil];
    
    if(eventAlertView != nil)
        
    {
        [eventAlertView show];
    }

    
    
    
}


//- (BOOL)shouldUploadImage:(UIImage *)anImage {
////    // Resize the image to be square (what is shown in the preview)
////    UIImage *resizedImage = [anImage resizedImageWithContentMode:UIViewContentModeScaleAspectFit
////                                                          bounds:CGSizeMake(560.0f, 560.0f)
////                                            interpolationQuality:kCGInterpolationHigh];
////    // Create a thumbnail and add a corner radius for use in table views
////    UIImage *thumbnailImage = [anImage thumbnailImage:86.0f
////                                    transparentBorder:0.0f
////                                         cornerRadius:10.0f
////                                 interpolationQuality:kCGInterpolationDefault];
////    
////    // Get an NSData representation of our images. We use JPEG for the larger image
////    // for better compression and PNG for the thumbnail to keep the corner radius transparency
//  
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.8f);
//    //NSData *thumbnailImageData = UIImageJPEGRepresentation(image, 0.8f);
////
////    if (!imageData || !thumbnailImageData) {
////        return NO;
////    }
//    // Create the PFFiles and store them in properties since we'll need them later
//    
//    self.photoFile = [PFFile fileWithData:imageData];
//    //self.thumbnailFile = [PFFile fileWithData:thumbnailImageData];
//    
//    // Request a background execution task to allow us to finish uploading the photo even if the app is backgrounded
//    self.fileUploadBackgroundTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskId];
//    }];
//    
//    [self.photoFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            [self.thumbnailFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskId];
//            }];
//        } else {
//            [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskId];
//        }
//    }];
//    
//    return YES;
//}







- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [imageView setImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
     self->picker.allowsEditing = YES;
    [self dismissViewControllerAnimated:YES  completion:NULL];
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES  completion:NULL];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Back";
    
    [self performSelector:@selector(retrieveFromParse)];
    [self.myIngredientTableView reloadData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [userStrIngArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomIngredientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyAddCell"];
    if (cell != nil)
    {
        PFObject *tempObject = [userStrIngArray objectAtIndex:indexPath.row];
        
        cell.ingredNameText = [tempObject objectForKey:@"itemName"];
        cell.measureNumberText = [tempObject objectForKey:@"itemNumber"];
        
        
        
    }
    
    [cell refreshCell];
    return cell;

}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{    //are we in delete mode
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        PFObject *tempObject = [userStrIngArray objectAtIndex:indexPath.row];
        
        [tempObject deleteInBackground];
        
        
        [tempObject unpinInBackground];
        
        [userStrIngArray removeObjectAtIndex:indexPath.row];
        
        [_myIngredientTableView reloadData];
        
        
        
        
    }
}

-(IBAction)backTotheStart:(UIStoryboardSegue *)segue

{
    //AddIngredientsViewController *source = segue.sourceViewController;
    
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
