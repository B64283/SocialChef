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

@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController

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



-(IBAction)TakePhoto:(id)sender {
    
    UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"please Take a photo or select from album" message:nil delegate:self cancelButtonTitle:@"Take photo" otherButtonTitles: @"From Album", nil];
    
    if(eventAlertView != nil)
        
    {
        [eventAlertView show];
    }

    
    
    
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [imageView setImage:image];
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

-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
