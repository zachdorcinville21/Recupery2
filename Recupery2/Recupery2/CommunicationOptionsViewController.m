//
//  CommunicationOptionsViewController.m
//  Recupery2
//
//  Created by Zachary Dorcinville on 2/28/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "CommunicationOptionsViewController.h"
@import CircleMenu;

@interface CommunicationOptionsViewController ()<CircleMenuDelegate>
@property (nonatomic) CircleMenu *circleMenu;

@end

@implementation CommunicationOptionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0 blue:0.2 alpha:1];
  self.circleMenu = [[CircleMenu alloc]initWithFrame:CGRectMake(200, 200, 50, 50)
                                          normalIcon:@"icon_menu"
                                        selectedIcon:@"icon_close"
                                        buttonsCount:4
                                            duration:2
                                            distance:150];
  [self.view addSubview:self.circleMenu];
  self.circleMenu.center = self.view.center;
  self.circleMenu.delegate = self;
}

- (void)circleMenu:(CircleMenu *)circleMenu
       willDisplay:(CircleMenuButton *)button
           atIndex:(NSInteger)atIndex {
  UIImage *image;
  switch (atIndex) {
    case 0:
      button.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
      image = [UIImage imageNamed:@"phone_icon"];
      break;
    case 1:
      button.backgroundColor = [UIColor blueColor];
      image = [UIImage imageNamed:@"video_icon"];
      break;
    case 2:
      button.backgroundColor = [UIColor redColor];
      image = [UIImage imageNamed:@"person_icon"];
      break;
    case 3:
      button.backgroundColor = [UIColor orangeColor];
      image = [UIImage imageNamed:@"text_icon"];
    default:
      break;
  }
  [button setImage:image forState:UIControlStateNormal];
}

@end
