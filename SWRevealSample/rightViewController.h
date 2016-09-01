//
//  rightViewController.h
//  SWRevealSample
//
//  Created by inveera technologies on 6/22/16.
//  Copyright © 2016 inveera technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rearTableViewCell.h"
@interface rightViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *rightTableView;


@end
