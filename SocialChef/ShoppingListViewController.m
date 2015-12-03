//
//  ShoppingListViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/3/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "ShoppingListViewController.h"
#import "CustomShoppingCell.h"
#import "AddShoppingItemsViewController.h"


@interface ShoppingListViewController ()
@property (weak, nonatomic) IBOutlet UITableView* myShoppingTableView;

@end

@implementation ShoppingListViewController





- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self performSelector:@selector(retrieveFromParse)];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)retrieveFromParse
{
    PFQuery *query = [PFQuery queryWithClassName:@"nSavedItems"];
    [query orderByAscending:@"createdAt"];
    [query fromLocalDatastore];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            userStrArray = [[NSMutableArray alloc]initWithArray:objects];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        
        [_myShoppingTableView reloadData];
        
    }];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self performSelector:@selector(retrieveFromParse)];
    [self.myShoppingTableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [userStrArray count];
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListItemCell"];
    if (cell != nil)
    {
        PFObject *tempObject = [userStrArray objectAtIndex:indexPath.row];
        
        cell.itemNameText = [tempObject objectForKey:@"itemName"];
        cell.itemNumberText = [tempObject objectForKey:@"itemNumber"];
        
        
        
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
        PFObject *tempObject = [userStrArray objectAtIndex:indexPath.row];
        
        [tempObject deleteInBackground];
        
        
        [tempObject unpinInBackground];
        
        [userStrArray removeObjectAtIndex:indexPath.row];
        
        [_myShoppingTableView reloadData];
        
        
        
        
    }
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
