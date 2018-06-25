//
//  ViewController.m
//  SQButtonTagView
//
//  Created by yangsq on 2017/9/26.
//  Copyright © 2017年 yangsq. All rights reserved.
//

#import "ViewController.h"
#import "TagViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)dealloc{
    _myTableView = nil;
    _dataArray = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@"东方闪电",@"大幅度",@"分隔符",@"规范",@"发的",@"规范的",@"法国第三方",@"搞得",@"让人",@"哈哈",@"等等",@"付费",@"丰富的",@"嗯嗯",@"试试",@"付费等等"];
    //@[@"kekenken",@"keken",@"knenenenk",@"kekeen",@"keken",@"knenenenkenkasdasd",@"ke",@"keken",@"knenenenkk",@"kekenken",@"ken0",@"knenenkenk",@"keken",@"kekenasdsadasd",@"knenenkk",@"kekenken",@"keken",@"knenenkenk",@"kekenken",@"keken",@"knenenkenk"];
    
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    [_myTableView registerClass:[TagViewCell class] forCellReuseIdentifier:NSStringFromClass(TagViewCell.class)];
        // Do any additional setup after loading the view, typically from a nib.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TagViewCell.class)];
    
    [cell setTextArray:_dataArray row:indexPath.section];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [TagViewCell cellHeightTextArray:_dataArray Row:indexPath.section];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
