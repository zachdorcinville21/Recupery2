//
//  SurveyForm.m
//  Recupery2
//
//  Created by Zachary Dorcinville on 2/27/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "SurveyForm.h"

@implementation SurveyForm

#pragma mark - Yes/No questions

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
    return @{FXFormFieldHeader : title, // The title above the Yes/No control
             FXFormFieldTitle : @"", // Do not put any text in the field
             FXFormFieldOptions : @[@"Yes", @"No"], // The options are "Yes" and "No"
             FXFormFieldCell : [FXFormOptionSegmentsCell class], // They should be displayed with a segmented control
             FXFormFieldFooter : @"\n", // Put a new line after each field
             };
}

#pragma mark - Short answer

- (NSDictionary *)otherField {
  return @{FXFormFieldHeader : @"Is there anything else you would like us to know?",
           FXFormFieldTitle : @"",
           FXFormFieldType : FXFormFieldTypeLongText
           };
}

#pragma mark - Submit button

- (NSArray *)extraFields {
  return @[
           // this field doesn't correspond to any property of the form
           // it's just an action button. the action will be called on first
           // object in the responder chain that implements the submitForm
           // method
           @{FXFormFieldTitle: @"Submit",
             FXFormFieldHeader: @"",
             FXFormFieldAction: @"submitSurvey" // action to be called in SurveyViewController
             },
           ];
}

@end
