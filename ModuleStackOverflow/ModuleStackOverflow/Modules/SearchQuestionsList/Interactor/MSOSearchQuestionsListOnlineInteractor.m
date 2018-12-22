//
//  MSOSearchQuestionsListInteractor.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 20/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOSearchQuestionsListOnlineInteractor.h"
#import "MSOOnlineProviderProtocol.h"
#import "MSOSearchQuestionsListPresentorProtocol.h"


@interface MSOSearchQuestionsListOnlineInteractor ()

@property (nonatomic, weak) id<MSOOnlineProviderProtocol> provider;

@end

@implementation MSOSearchQuestionsListOnlineInteractor

@synthesize presentor;

- (instancetype)initWithProvider:(id<MSOOnlineProviderProtocol>)provider
{
	self = [super init];
	if (self)
	{
		_provider = provider;
	}
	return self;
}

- (void)getQuestionsWithTag:(NSString *)tag
{
	__weak MSOSearchQuestionsListOnlineInteractor *welf = self;
	[self.provider getQuestionsWithTag:tag
							complition:^(NSString * _Nonnull tag, NSArray<MSOQuestion *> * _Nullable questions, NSError * _Nullable error) {
								dispatch_async(dispatch_get_main_queue(), ^{
									if (error)
									{
										//TODO handle the error
									}
									else
									{
										[welf.presentor addQuestions:questions];
									}
								});
							}];
}

@end
