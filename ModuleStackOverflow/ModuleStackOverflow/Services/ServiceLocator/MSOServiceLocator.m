//
//  MSOServiceLocator.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOServiceLocator.h"
#import "MSOOnlineProvider.h"
#import "MSODataBase.h"


@interface MSOServiceLocator ()

@property (nonatomic, strong) id<MSOOnlineProviderProtocol> onlineProvider;
@property (nonatomic, strong) id<MSODataBaseProtocol> dataBase;

@end


@implementation MSOServiceLocator

+ (MSOServiceLocator *)shared
{
	static MSOServiceLocator *serviceLocator = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		serviceLocator = [MSOServiceLocator new];
	});
	return serviceLocator;
}

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_dataBase = [[MSODataBase alloc] init];
	}
	return self;
}

- (id<MSOOnlineProviderProtocol>)onlineProvider
{
	if (!_onlineProvider)
	{
		_onlineProvider = [MSOOnlineProvider new];
	}
	return _onlineProvider;
}

@end
