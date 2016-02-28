//
//  CommunicationOptionsViewController.m
//  Recupery2
//
//  Created by Zachary Dorcinville on 2/28/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "CommunicationOptionsViewController.h"
#import "ImageViewController.h"
@import CircleMenu;

@interface CommunicationOptionsViewController ()<CircleMenuDelegate>
@property (nonatomic) CircleMenu *circleMenu;
@property(nonatomic) UILabel *communicationLabel;
@end

@implementation CommunicationOptionsViewController

typedef NS_ENUM(NSUInteger, CommunicationMethod) {
    CommunicationMethodPhone,
    CommunicationMethodVideo,
    CommunicationMethodPerson,
    CommunicationMethodText
};

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0 blue:0.2 alpha:1];
  self.circleMenu = [[CircleMenu alloc]initWithFrame:CGRectMake(200, 200, 50, 50)
                                          normalIcon:@"icon_menu"
                                        selectedIcon:@"icon_close"
                                        buttonsCount:4
                                            duration:1
                                            distance:150];
  [self.view addSubview:self.circleMenu];
  self.circleMenu.center = self.view.center;
  self.circleMenu.delegate = self;

  self.communicationLabel = [[UILabel alloc] init];
  self.communicationLabel.textColor = [UIColor whiteColor];
  self.communicationLabel.text = @"What is your preferred method of communication?";
  self.communicationLabel.frame = CGRectMake(100, 100, 350, 200);
  self.communicationLabel.textAlignment = NSTextAlignmentCenter;
  self.communicationLabel.center = CGPointMake(self.view.center.x, 130);
  self.communicationLabel.numberOfLines = 0;
  [self.view addSubview:self.communicationLabel];
}

- (void)circleMenu:(CircleMenu *)circleMenu
       willDisplay:(CircleMenuButton *)button
           atIndex:(NSInteger)atIndex {
  UIImage *image;
  switch (atIndex) {
    case CommunicationMethodPhone:
      button.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
      image = [UIImage imageNamed:@"phone_icon"];
      break;
    case CommunicationMethodVideo:
      button.backgroundColor = [UIColor blueColor];
      image = [UIImage imageNamed:@"video_icon"];
      break;
    case CommunicationMethodPerson:
      button.backgroundColor = [UIColor redColor];
      image = [UIImage imageNamed:@"person_icon"];
      break;
    case CommunicationMethodText:
      button.backgroundColor = [UIColor orangeColor];
      image = [UIImage imageNamed:@"text_icon"];
    default:
      break;
  }
  [button setImage:image forState:UIControlStateNormal];
}

- (void)circleMenu:(CircleMenu *)circleMenu
 buttonDidSelected:(CircleMenuButton *)button
           atIndex:(NSInteger)atIndex {
  UIImage *image;
  switch (atIndex) {
    case CommunicationMethodPhone:
      button.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
      image = [UIImage imageNamed:@"phone_icon"];
      break;
    case CommunicationMethodVideo:
      button.backgroundColor = [UIColor blueColor];
      image = [UIImage imageNamed:@"video_icon"];
      break;
    case CommunicationMethodPerson:
      button.backgroundColor = [UIColor redColor];
      image = [UIImage imageNamed:@"person_icon"];
      break;
    case CommunicationMethodText:
      button.backgroundColor = [UIColor orangeColor];
      image = [UIImage imageNamed:@"text_icon"];
    default:
      break;
  }
  ImageViewController *imageViewController = [[ImageViewController alloc] initWithImage:image];
  [self.navigationController pushViewController:imageViewController animated:YES];
}

@end
