//
//  TagViewCell.m
//  SQButtonTagView
//
//  Created by yangsq on 2017/9/26.
//  Copyright © 2017年 yangsq. All rights reserved.
//

#import "TagViewCell.h"
#import "SQButtonTagView.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface TagViewCell ()

@property (nonatomic, strong) SQButtonTagView *tagView;
@end


@implementation TagViewCell

- (void)dealloc{
    _tagView = nil;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _tagView = [[SQButtonTagView alloc]initWithTotalTagsNum:30
                                                      viewWidth:ScreenWidth-20
                                                        eachNum:0
                                                        Hmargin:10
                                                        Vmargin:10
                                                      tagHeight:30
                                                    tagTextFont:[UIFont systemFontOfSize:14.f]
                                                   tagTextColor:[[UIColor redColor] colorWithAlphaComponent:0.5]
                                           selectedTagTextColor:[UIColor whiteColor]
                                        selectedBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];
        _tagView.maxSelectNum = 10;
        //要放到tagTexts设置的下面 在本页面下一个方法中
        //_tagView.defaultSelectedArr = @[@"哈哈",@"嗯嗯"];
        [self.contentView addSubview:_tagView];
        
        _tagView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_tagView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:10];
        
         NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:_tagView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
        
        
         NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_tagView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        
         NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_tagView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
        
        [self.contentView addConstraints:@[top,left,bottom,right]];
        
    }
    return self;
}


- (void)setTextArray:(NSArray *)textArray row:(NSInteger)row{
    if (row%2==0) {
        _tagView.eachNum = 0;
    }else{
        _tagView.eachNum = 3;
    }
    _tagView.tagTexts = textArray;
    _tagView.defaultSelectedArr = @[@"哈哈",@"嗯嗯"];
}


+ (CGFloat)cellHeightTextArray:(NSArray *)textArray Row:(NSInteger)row{
    CGFloat height;
    NSInteger eachNum;
    if (row%2==0) {
        eachNum = 0;
    }else{
        eachNum = 3;
    }
    
    height = [SQButtonTagView returnViewHeightWithTagTexts:textArray
                                                 viewWidth:ScreenWidth-20
                                                   eachNum:eachNum
                                                   Hmargin:10
                                                   Vmargin:10
                                                 tagHeight:30
                                               tagTextFont:[UIFont systemFontOfSize:14.f]];
    return height+20;
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
