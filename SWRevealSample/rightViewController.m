//
//  rightViewController.m
//  SWRevealSample
//
//  Created by inveera technologies on 6/22/16.
//  Copyright © 2016 inveera technologies. All rights reserved.
//

#import "rightViewController.h"

@interface rightViewController (){
    NSArray *list;
    NSArray *cellImage;
}

@end

@implementation rightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    
    list=@[@"Home",@"Invite Friends",@"Message",@"How It Works",@"My Account",@"My Activity",@"Terms & Conditions",@"Logout"];
    cellImage=@[@"home-m-icon.png",@"invite-m-icon.png",@"message-m-icon.png",@"how-m-icon.png",@"my-account-m-icon.png",@"activity-m-icon.png",@"terms-m-icon.png",@"login-m-icon.png"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RearCell";
    
    
    rearTableViewCell *cell = (rearTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"rearTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.rearMenuLabel.text = [list objectAtIndex:indexPath.row];
    cell.rearLogoImage.image = [UIImage imageNamed:[cellImage objectAtIndex:indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        // build an activity view controller
        UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:cellImage applicationActivities:nil];
        
        // exclude several items (for example, Facepuke and Shitter)
        NSArray *excluded = @[UIActivityTypePostToFacebook, UIActivityTypePostToTwitter, UIActivityTypeMail];
        controller.excludedActivityTypes = excluded;
         [self presentActivityController:controller];
    }
}

#pragma mark- Present Activity

- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // access the completion handler
    controller.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *error){
        // react to the completion
        if (completed) {
            
            // user shared an item
            NSLog(@"We used activity type%@", activityType);
            
        } else {
            
            // user cancelled
            NSLog(@"We didn't want to share anything after all.");
        }
        
        if (error) {
            NSLog(@"An Error occured: %@, %@", error.localizedDescription, error.localizedFailureReason);
        }
    };
}


@end
