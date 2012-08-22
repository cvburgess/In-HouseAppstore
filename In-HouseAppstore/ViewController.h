//
//  ViewController.h
//  In-HouseAppstore
//
//  Created by Charles Burgess on 8/22/12.
//  Copyright (c) 2012 SquareOne Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;

@end
