//
//  M2ViewController.h
//  m2048
//

//  Copyright (c) 2014 Danqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface M2ViewController : UIViewController <GADInterstitialDelegate>
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property(nonatomic, strong) GADInterstitial *interstitial;

- (void)updateScore:(NSInteger)score;

- (void)endGame:(BOOL)won;

@end
