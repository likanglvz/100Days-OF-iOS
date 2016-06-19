//
//  NameAndGenderCell.m
//  customTableCell
//
//  Created by 李康 on 16/4/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "NameAndGenderCell.h"

@interface NameAndGenderCell()
@property(strong,nonatomic)UILabel *nameLabel;
@property(strong,nonatomic)UILabel *genderLaber;


@end


@implementation NameAndGenderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameMarker = [[UILabel alloc]initWithFrame:nameLabelRect];
        nameMarker.textAlignment = NSTextAlignmentRight;
        nameMarker.text = @"姓名:";
        nameMarker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:nameMarker];
        
        
        CGRect genderLaberRect = CGRectMake(0, 26, 70, 15);
        UILabel * genderMarker = [[UILabel alloc]initWithFrame:genderLaberRect];
        genderMarker.textAlignment = NSTextAlignmentRight;
        genderMarker.text = @"性别:";
        genderMarker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:genderMarker];
        
        
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 200, 15)];
        [self.contentView addSubview:self.nameLabel];
        
        self.genderLaber= [[UILabel alloc]initWithFrame:CGRectMake(80, 26, 200, 15)];
        [self.contentView addSubview:self.genderLaber];
        
        
        
    }
    
    return self;
}
-(void)setName:(NSString *)n{
    if (![n isEqualToString:_name]) {
        _name=[n copy];
    }
    self.nameLabel.text= _name;
    
}
-(void)setGender:(NSString *)g{
    if (![g isEqualToString:_gender]) {
        _gender=[g copy];
    }
    self.genderLaber.text = _gender;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
