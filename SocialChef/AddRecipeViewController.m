//
//  AddRecipeViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/17/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "AddRecipeViewController.h"
#import "CustomIngredientCell.h"
#import <MobileCoreServices/UTCoreTypes.h>
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
   // [self performSelector:@selector(retrieveFromParse)];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//- (void)retrieveFromParse
//{
//    PFQuery *query = [PFQuery queryWithClassName:@"newSavedItems"];
//    [query orderByAscending:@"createdAt"];
//    [query fromLocalDatastore];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            
//            userStrIngArray = [[NSMutableArray alloc]initWithArray:objects];
//            
//        } else {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//        
//        
//        //[_myIngredientTableView reloadData];
//        
//    }];
//    
//    
//}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_recipeTitle resignFirstResponder];
    [_recipeServings resignFirstResponder];
    [_ingredItem1 resignFirstResponder];
    [_ingredItem2 resignFirstResponder];
    [_ingredItem3 resignFirstResponder];
    [_ingredItem4 resignFirstResponder];
    [_ingredItem5 resignFirstResponder];
    [_ingredItem6 resignFirstResponder];
    [_ingredItem7 resignFirstResponder];
    [_ingredItem8 resignFirstResponder];
    [_ingredItem9 resignFirstResponder];
    [_ingredItem10 resignFirstResponder];
    [_ingredItem11 resignFirstResponder];
    [_ingredItem12 resignFirstResponder];
    [_ingredItem13 resignFirstResponder];
    [_ingredItem14 resignFirstResponder];
    [_ingredItem15 resignFirstResponder];
    [_ingredItem16 resignFirstResponder];
    [_ingredItem17 resignFirstResponder];
    [_ingredItem18 resignFirstResponder];
    
    //[_ingredItem1 resignFirstResponder];
    
    
    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Textfield was dismissed by the delegate");
    
    
    [textField resignFirstResponder];
    return YES;
}







-(void)alertView:(UIAlertController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        picker = [[UIImagePickerController alloc]init];
        if (picker != nil)
        {
            //type of media
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate =self;
            
            picker.allowsEditing = YES;
            
    ///delete if crash
//            picker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, nil];
            
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



//SAVE DATA
-(IBAction)Sharerecipe:(id)sender{
    
   
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hey There Chef!" message:@"Are You Ready To Save Your recipe?" preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    //For multiple buttons you can use :
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self performSelector:@selector(saveToParse)];
    }]];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Not Yet" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }]];
    
     
    
    
    
    
  //  [self performSelector:@selector(saveToParse)];
    
    

}

-(void)showError {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"could not upload your photo"preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    //For multiple buttons you can use :
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self closeAlertview];
    }]];

    
    
}


-(IBAction)TakePhoto:(id)sender {
    
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"please Take a photo or select from album" message:@"You Shared You Recipe?" preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    //For multiple buttons you can use :
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Take photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        //take action
        picker = [[UIImagePickerController alloc]init];
        if (picker != nil)
        {
            //type of media
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate =self;
            
            picker.allowsEditing = YES;
            
            ///delete if crash
            //            picker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, nil];
            
            [self presentViewController:picker animated:true completion:nil];
            
        }
    
    
    }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"Choose fro album" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        //take action
        
        UIImagePickerController *albumPicker = [[UIImagePickerController alloc]init];
        if (albumPicker != nil)
        {
            //type of media
            albumPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            albumPicker.delegate =self;
            
            albumPicker.allowsEditing = true;
            
            [self presentViewController:albumPicker animated:true completion:nil];
        }
    

        
//[self closeAlertview];
        }]];

    

    
    
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









-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}












- (void)saveToParse
{

    
    
    
    
    
    
    
    
    
    
    
    if (imageView.image) {
        
       
        
        NSData *imageData = UIImageJPEGRepresentation(imageView.image, 1.0);
        PFFile *photoFile = [PFFile fileWithData:imageData];
        PFObject *photo = [PFObject objectWithClassName:@"Takenphoto"];
        photo [@"Takenimage"] = photoFile;
        photo [@"whoIsuser"] = [PFUser currentUser];
        
        photo [@"title"] = self.recipeTitle.text;
        photo [@"serving"] = self.recipeServings.text;
        
        photo [@"ingred1"] = self.ingredItem1.text;
        photo [@"ingred2"] = self.ingredItem2.text;
        photo [@"ingred3"] = self.ingredItem3.text;
        photo [@"ingred4"] = self.ingredItem4.text;
        photo [@"ingred5"] = self.ingredItem5.text;
        photo [@"ingred6"] = self.ingredItem6.text;
        photo [@"ingred7"] = self.ingredItem7.text;
        photo [@"ingred8"] = self.ingredItem8.text;
        photo [@"ingred9"] = self.ingredItem9.text;
        photo [@"ingred10"] = self.ingredItem10.text;
        photo [@"ingred11"] = self.ingredItem11.text;
        photo [@"ingred12"] = self.ingredItem12.text;
        photo [@"ingred13"] = self.ingredItem13.text;
        photo [@"ingred14"] = self.ingredItem14.text;
        photo [@"ingred15"] = self.ingredItem15.text;
        photo [@"ingred16"] = self.ingredItem16.text;
        photo [@"ingred17"] = self.ingredItem17.text;
        photo [@"ingred18"] = self.ingredItem18.text;
        
        photo [@"stepOne"] = self.stepOne.text;
        photo [@"stepTwo"] = self.stepTwo.text;
        photo [@"stepThree"] = self.stepThree.text;
        
        
        
        
        [photo addUniqueObjectsFromArray:@[@"ingred1", @"ingred2", @"ingred3",@"ingred4", @"ingred5", @"ingred6",@"ingred7", @"ingred8", @"ingred9",@"ingred10", @"ingred11", @"ingred12",@"ingred13", @"ingred14", @"ingred15",@"ingred16", @"ingred17", @"ingred18"] forKey:@"ingredientsArray"];
        
        [photo saveInBackground];
        
        [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            
            if (!succeeded) {
                [self showError];
            }
            
        }];
        
        
        
    }
    else{
        [self showError];
        
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@" Success!" message:@"You Shared You Recipe?" preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    //For multiple buttons you can use :
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Great!" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self closeAlertview];
    }]];
    

 
    
    
    
    
    
    
    
    
    
}



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
    
    //[self performSelector:@selector(retrieveFromParse)];
    //[self.myIngredientTableView reloadData];
}



//- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
//{
//    return 1;
//}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//    return [userStrIngArray count];
//    
//}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CustomIngredientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyAddCell"];
//    if (cell != nil)
//    {
//        PFObject *tempObject = [userStrIngArray objectAtIndex:indexPath.row];
//        
//        cell.ingredNameText = [tempObject objectForKey:@"itemName"];
//        //cell.measureNumberText = [tempObject objectForKey:@"itemNumber"];
//        
//        
//        
//    }
//    
//    [cell refreshCell];
//    return cell;
//
//}


//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{    //are we in delete mode
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        PFObject *tempObject = [userStrIngArray objectAtIndex:indexPath.row];
//        
//        [tempObject deleteInBackground];
//        
//        
//        [tempObject unpinInBackground];
//        
//        [userStrIngArray removeObjectAtIndex:indexPath.row];
//        
//        [_myIngredientTableView reloadData];
//        
//        
//        
//        
//    }
//}

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
