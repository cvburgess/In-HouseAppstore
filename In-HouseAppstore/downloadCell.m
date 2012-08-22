//
//  downloadCell.m
//  In-HouseAppstore
//
//  Created by Charles Burgess on 8/22/12.
//  Copyright (c) 2012 SquareOne Apps. All rights reserved.
//

#import "downloadCell.h"
#import "AppDelegate.h"

@implementation downloadCell
@synthesize downloadBtn, titleTxt, subTxt, img, manifest;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //Init Code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(IBAction)download:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[manifest text]]];
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSDictionary *app =  [[NSDictionary alloc] initWithDictionary:[[appDelegate apps] objectAtIndex:[self tag]]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *bIDs = [[NSMutableDictionary alloc] initWithDictionary:[defaults objectForKey:@"bundleIDs"]];
    
    [bIDs setObject:[app objectForKey:@"bundle"] forKey:[app objectForKey:@"id"]];
    
    [defaults setObject:bIDs forKey:@"bundleIDs"];
    
    [defaults synchronize];
}

@end
