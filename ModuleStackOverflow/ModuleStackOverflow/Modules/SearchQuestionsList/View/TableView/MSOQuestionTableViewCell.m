//
//  MSOQuestionTableViewCell.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOQuestionTableViewCell.h"
#import "MSOQuestion.h"


@implementation MSOQuestionTableViewCell

- (void)setupWithQuestion:(MSOQuestion *)question
{
	[self reset];
	
	self.titleLabel.text = question.title;
	
	if (question.score > 0)
	{
		self.voutesLabel.text = [NSString stringWithFormat:@"%li", question.score];
		self.voutesLabel.textColor = UIColor.blueColor;
	}
	
	if (question.answerCount > 0)
	{
		self.answersLaber.text = [NSString stringWithFormat:@"%li", question.answerCount];
		self.answersLaber.textColor = UIColor.blueColor;
	}
	
	if (question.viewCount > 0)
	{
		self.viewsLabel.text = [NSString stringWithFormat:@"%li", question.answerCount];
		self.viewsLabel.textColor = UIColor.blueColor;
	}
}

- (void)reset
{
	self.voutesLabel.text = @"0";
	self.voutesLabel.textColor = UIColor.darkTextColor;
	
	self.answersLaber.text = @"0";
	self.answersLaber.textColor = UIColor.darkTextColor;
	
	self.viewsLabel.text = @"0";
	self.viewsLabel.textColor =  UIColor.darkTextColor;
}

@end
