//
//  SurveyViewController.m
//  Recupery2
//
//  Created by Zachary Dorcinville on 2/27/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "SurveyViewController.h"
#import "SurveyForm.h"
#import "CommunicationOptionsViewController.h"

@interface SurveyViewController ()<FXFormControllerDelegate>

@end

@implementation SurveyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.formController.form = [[SurveyForm alloc] init];
  self.formController.delegate = self;
}

- (void)submitSurvey {
    CommunicationOptionsViewController *nextPage = [[CommunicationOptionsViewController alloc]init];
    [self.navigationController pushViewController:nextPage animated:YES];
  
}

@end
