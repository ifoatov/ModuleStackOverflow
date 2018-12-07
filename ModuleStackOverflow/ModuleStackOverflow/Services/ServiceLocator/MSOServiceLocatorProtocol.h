//
//  MSOServiceLocatorProtocol.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

@protocol MSOOnlineProviderProtocol;


@protocol MSOServiceLocatorProtocol

- (id<MSOOnlineProviderProtocol>)onlineProvider;

@end
