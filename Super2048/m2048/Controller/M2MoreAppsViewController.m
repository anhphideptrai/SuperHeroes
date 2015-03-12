//
//  M2MoreAppsViewController.m
//  Heroes 2048
//
//  Created by Phi Nguyen on 3/12/15.
//  Copyright (c) 2015 Danqing. All rights reserved.
//

#import "M2MoreAppsViewController.h"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
@interface MoreAppsData : NSObject
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *linkApp;
@end
@implementation MoreAppsData
@end
@interface M2MoreAppsViewController ()<UITableViewDataSource, UITableViewDataSource>{
    NSMutableArray *arrApps;
}
@property (strong, nonatomic) IBOutlet UITableView *contentView;

@end

@implementation M2MoreAppsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [GSTATE scoreBoardColor];
    arrApps = [NSMutableArray new];
    MoreAppsData *app = [MoreAppsData new];
    app.img = [UIImage imageNamed:@"ic_draw.png"];
    app.name = @"How To Draw Everything";
    app.desc = @"When you were a child, have you ever wished that you were an artist? Is you a fan of anime, picture and cartoon? Have you ever wished that you can draw those favorite actors?";
    app.linkApp = @"https://itunes.apple.com/sg/app/how-to-draw-everything-step/id948768878?mt=8";
    [arrApps addObject:app];
    
    app = [MoreAppsData new];
    app.img = [UIImage imageNamed:@"ic_origami.png"];
    app.name = @"Origami Paper Art";
    app.desc = @"Origami (折り紙?, from ori meaning \"folding\", and kami meaning \"paper\" (kami changes to gami due to rendaku) is the art of paper folding, which is often associated with Japanese culture.";
    app.linkApp = @"https://itunes.apple.com/sg/app/origami-paper-art-step-by-step/id951371381?mt=8";
    [arrApps addObject:app];
    
    app = [MoreAppsData new];
    app.img = [UIImage imageNamed:@"ic_pokemon.png"];
    app.name = @"Guide For Pokedex";
    app.desc = @"Pokedex Guide is one of my favorite apps. I have been loving Pokemon for ages, I even have some cards physically for my owns.";
    app.linkApp = @"https://itunes.apple.com/sg/app/guide-for-pokedex/id929955668?mt=8";
    [arrApps addObject:app];
    
    app = [MoreAppsData new];
    app.img = [UIImage imageNamed:@"ic_knots.png"];
    app.name = @"Animated Knots Art - 3D";
    app.desc = @"Nowadays some people are under the mistaken idea that if you can't tie a knot you should just tie a lot. As funny and clever as that sounds it's really not the case.";
    app.linkApp = @"https://itunes.apple.com/app/animated-knots-art-3d-guide/id967811250?mt=8";
    [arrApps addObject:app];

}
#pragma mark - TableViewControll Delegate + DataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrApps.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return IS_IPAD?100:70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    MoreAppsData *data = arrApps[indexPath.row];
    [cell.textLabel setText:data.name];
    [cell.detailTextLabel setText:data.desc];
    [cell.imageView setImage:data.img];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    MoreAppsData *data = arrApps[indexPath.row];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:data.linkApp]];
}
@end
