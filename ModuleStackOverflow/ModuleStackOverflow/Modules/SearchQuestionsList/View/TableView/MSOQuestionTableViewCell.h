//
//  MSOQuestionTableViewCell.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSOTableManagerCellProtocol.h"


@class MSOQuestion;
@protocol MSOTableItemViewModelProtocol;


NS_ASSUME_NONNULL_BEGIN


@interface MSOQuestionTableViewCell : UITableViewCell <MSOTableManagerCellProtocol>

@property (weak, nonatomic) IBOutlet UILabel *voutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *answersLaber;
@property (weak, nonatomic) IBOutlet UILabel *viewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
