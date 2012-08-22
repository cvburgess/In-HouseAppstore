//
//  downloadCell.h
//  Paradigm Appstore
//
//  Created by App Development on 6/14/12.
//  Copyright (c) 2012 Paradigm Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface downloadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;

@property (weak, nonatomic) IBOutlet UITextView *subTxt;
@property (weak, nonatomic) IBOutlet UILabel *titleTxt;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *manifest;

@end
