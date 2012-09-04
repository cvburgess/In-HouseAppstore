//
//  ViewController.m
//  In-HouseAppstore
//
//  Created by Charles Burgess on 8/22/12.
//  Copyright (c) 2012 SquareOne Apps. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import "downloadCell.h"
#import "FLImageView.h"

//#import "UIImageView+WebCache.h"

#define IS_IPAD   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

@interface ViewController ()

@end

@implementation ViewController
@synthesize table;
@synthesize bgImg;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[[self navigationController] navigationBar] setHidden:YES];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(deviceOrientationDidChange:) name: UIDeviceOrientationDidChangeNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView) name:@"refreshView" object:nil];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [self setBgImg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{	
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSDictionary *app =  [[NSDictionary alloc] initWithDictionary:[[appDelegate apps] objectAtIndex:[indexPath row]]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *bIDs = [[NSMutableDictionary alloc] initWithDictionary:[defaults objectForKey:@"bundleIDs"]];
    
    downloadCell *cell = (downloadCell *)[tableView dequeueReusableCellWithIdentifier:@"downloadCell"];
    
    if (cell == nil)
    {
        cell = [[downloadCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"downloadCell"];
    }
    
    [cell.titleTxt setText:[app objectForKey:@"title"]];
    [cell.subTxt setText:[app objectForKey:@"subtitle"]];
    [cell.manifest setText:[[NSString alloc] initWithFormat:@"itms-services://?action=download-manifest&url=http://paradigmpresentations.com/apps/%@/%@.plist", [app objectForKey:@"id"], [app objectForKey:@"id"]]];
    
    NSString *imgPath = @"";
    
    if ([UIScreen mainScreen].scale == 2.0)
    {
        imgPath = [NSString stringWithFormat:@"http://paradigmpresentations.com/apps/%@/gloss@2x.png", [app objectForKey:@"id"]];
    }
    else
    {
        imgPath = [NSString stringWithFormat:@"http://paradigmpresentations.com/apps/%@/gloss.png", [app objectForKey:@"id"]];
    }
    
    NSURL *url = [NSURL URLWithString:imgPath];
    [[cell img] loadImageAtURL:url placeholderImage:nil];
    
    [cell setTag:[indexPath row]];

    if ([bIDs objectForKey:[app objectForKey:@"id"]] == nil)
    {
        if (IS_IPAD)
        {
            [[cell downloadBtn] setImage:[UIImage imageNamed:@"download.png"] forState:UIControlStateNormal];
        }
        else
        {
            [[cell downloadBtn] setImage:[UIImage imageNamed:@"iPhone_download.png"] forState:UIControlStateNormal];
        }
    }
    else if ([[bIDs objectForKey:[app objectForKey:@"id"]] floatValue] < [[app objectForKey:@"bundle"] floatValue])
    {
        if (IS_IPAD)
        {
            [[cell downloadBtn] setImage:[UIImage imageNamed:@"update.png"] forState:UIControlStateNormal];
        }
        else
        {
            [[cell downloadBtn] setImage:[UIImage imageNamed:@"iPhone_update.png"] forState:UIControlStateNormal];
        }
    }
    else if ([[bIDs objectForKey:[app objectForKey:@"id"]] floatValue] == [[app objectForKey:@"bundle"] floatValue])
    {
        if (IS_IPAD)
        {
            [[cell downloadBtn] setImage:[UIImage imageNamed:@"reinstall.png"] forState:UIControlStateNormal];
        }
        else
        {
            [[cell downloadBtn] setImage:[UIImage imageNamed:@"iPhone_reinstall.png"] forState:UIControlStateNormal];
        }
    }
    else
    {
        //ERROR: The version on the device is newer than the version on the iDevice
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return [[appDelegate apps] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (IS_IPAD) {
        return 92.0;
    }
    else {
        return 78.0;
    }
}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    //Obtaining the current device orientation
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];

    if (IS_IPAD) {
        if (UIDeviceOrientationIsLandscape(orientation)) {
            [bgImg setImage:[UIImage imageNamed:@"Default-Landscape~ipad"]];
        }
        else if (UIDeviceOrientationIsPortrait(orientation)) {
            [bgImg setImage:[UIImage imageNamed:@"Default-Portrait~ipad"]];
        }
    }
    else {
        if (UIDeviceOrientationIsLandscape(orientation)) {
            [bgImg setImage:[UIImage imageNamed:@"iPhone_L"]];
        }
        else if (UIDeviceOrientationIsPortrait(orientation)) {
            [bgImg setImage:[UIImage imageNamed:@"Default"]];
        }
    }
}

-(void)refreshView
{
    [[self table] reloadData];
}

@end
