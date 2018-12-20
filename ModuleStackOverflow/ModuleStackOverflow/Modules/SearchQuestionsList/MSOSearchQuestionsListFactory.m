//
//  MSOSearchQuestionsListFactory.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 20/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOSearchQuestionsListFactory.h"
#import "MSOSearchQuestionsListPresentor.h"
#import "MSOSearchQuestionsListOnlineInteractor.h"
#import "MSOSearchQuestionsListOfflineInteractor.h"
#import "MSOSearchQuestionsListViewController.h"
#import "MSOSearchQuestionsListRouter.h"

@implementation MSOSearchQuestionsListFactory

+ (UIViewController *)onlineModule
{
	MSOSearchQuestionsListViewController *viewController = [[MSOSearchQuestionsListViewController alloc] init];
	
	return viewController;
}

@end
