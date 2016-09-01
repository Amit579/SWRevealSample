//
//  frontViewController.m
//  SWRevealSample
//
//  Created by inveera technologies on 6/22/16.
//  Copyright © 2016 inveera technologies. All rights reserved.
//

#import "frontViewController.h"

@interface frontViewController ()

@end

@implementation frontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
    
    //[self.frontTableMenuView registerClass:[frontTableViewCell class] forCellWithReuseIdentifier:@"frontCell"];
    
    self.title = NSLocalizedString(@"Front View", nil);
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    //Add an image to your project & set that image here.
    /*UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"invite-m-icon.png"]style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = revealButtonItem;*/
    
    //Add an image to your project & set that image here.
    UIBarButtonItem *rightRevealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"linebox-1.png"]style:UIBarButtonItemStyleBordered target:revealController action:@selector(rightRevealToggle:)];
    self.navigationItem.rightBarButtonItem = rightRevealButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
