//
//  CommunicationOptionsViewController.m
//  Recupery2
//
//  Created by Zachary Dorcinville on 2/28/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "CommunicationOptionsViewController.h"
@import CircleMenu;

@interface CommunicationOptionsViewController ()
@property (nonatomic) CircleMenu *circleMenu;

@end

@implementation CommunicationOptionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  self.circleMenu = [[CircleMenu alloc]initWithFrame:CGRectMake(200, 200, 50, 50)
                                          normalIcon:@"icon_menu"
                                        selectedIcon:@"icon_close"
                                        buttonsCount:4
                                            duration:4
                                            distance:150];
  [self.view addSubview:self.circleMenu];
  self.circleMenu.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
