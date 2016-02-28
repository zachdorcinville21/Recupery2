//
//  SurveyForm.m
//  Recupery2
//
//  Created by Zachary Dorcinville on 2/27/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "SurveyForm.h"

@implementation SurveyForm
- (NSDictionary *)question1Field {
    return [self surveyFieldWithTitle:@"1) Do you feel like you're in danger of hurting yourself or others?"];
}
- (NSDictionary *)question2Field {
    return [self surveyFieldWithTitle:@"2) Do you have a steady relationship with your family and friends?"];
}
- (NSDictionary *)question3Field {
    return [self surveyFieldWithTitle:@"3) Are you motivated to achieve your future goals?"];
}
- (NSDictionary *)surveyFieldWithTitle:(NSString *)title {
    return @{FXFormFieldTitle: title,
             FXFormFieldType : FXFormFieldTypeOption,
             FXFormFieldOptions: @[@"Yes", @"No"],
             @"textLabel.numberOfLines": @0};

}

@end
