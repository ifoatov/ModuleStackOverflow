//
//  MSOQuestionViewModel.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 23/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

@import UIKit;
#import "MSOQuestion.h"
#import "MSOQuestionViewModel.h"
#import "MSOQuestionTableViewCell.h"


@interface MSOQuestionViewModel ()

@property (nonatomic, strong) MSOQuestion *question;

@end

@implementation MSOQuestionViewModel

- (NSString *)tableViewCellReusableKey
{
	return @"MSOQuestionViewModelKey";
}

- (instancetype)initWithQuestion:(MSOQuestion *)question
{
	self = [super init];
	{
		_question = question;
	}
	return self;
}

@end
