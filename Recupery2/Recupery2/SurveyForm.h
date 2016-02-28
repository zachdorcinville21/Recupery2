//
//  SurveyForm.h
//  Recupery2
//
//  Created by Zachary Dorcinville on 2/27/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"

@interface SurveyForm : NSObject <FXForm>
@property (nonatomic, copy) NSString *surveyIntro;
@property (nonatomic, assign) BOOL question1;
@property (nonatomic, assign) BOOL question2;
@property (nonatomic, assign) BOOL question3;
@property (nonatomic, copy) NSString *other;

@end
