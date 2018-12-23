//
//  MSOTableManager.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

@import UIKit;


@protocol MSOTableItemViewModelProtocol;


NS_ASSUME_NONNULL_BEGIN


@interface MSOTableManager : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)addItems:(NSArray<id<MSOTableItemViewModelProtocol>> *)items;


@end

NS_ASSUME_NONNULL_END
