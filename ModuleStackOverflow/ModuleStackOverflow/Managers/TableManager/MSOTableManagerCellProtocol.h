//
//  MSOTableManagerCellProtocol.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

@protocol MSOTableItemViewModelProtocol;


@protocol MSOTableManagerCellProtocol

- (void)configureWithViewModel:(id<MSOTableItemViewModelProtocol>)viewModel;

@end
