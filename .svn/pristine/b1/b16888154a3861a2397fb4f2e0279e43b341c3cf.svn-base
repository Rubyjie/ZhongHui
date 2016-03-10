//
//  DepartmentController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "DepartmentController.h"
#import "MainCell.h"
#import "AttachedCell.h"

@interface DepartmentController ()<UITableViewDataSource,UITableViewDelegate>


{
    NSMutableDictionary *dic;//存对应的数据
    NSMutableArray *selectedArr;//二级列表是否展开状态
    NSMutableArray *titleDataArray;
    NSArray *dataArray;//数据源，显示每个cell的数据
    NSMutableDictionary *stateDic;//三级列表是否展开状态
    NSMutableArray *grouparr0;
    NSMutableArray *grouparr1;
    NSMutableArray *grouparr2;
    NSMutableArray *grouparr3;
    NSMutableArray *grouparr4;
    NSMutableArray *grouparr5;
}

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation DepartmentController

-(UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT- 64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"部门";
    
    dic = [[NSMutableDictionary alloc] init];
    selectedArr = [[NSMutableArray alloc] init];
    dataArray = [[NSArray alloc] init];
    
    
    self.tableView.showsVerticalScrollIndicator = NO;
    //不要分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self initDataSource];

}


-(void)initDataSource
{
    titleDataArray = [[NSMutableArray alloc] initWithObjects:@"慧平",@"惠云", nil];
    
#pragma mark -不能有空值！！ 使用dictionaryWithObjectsAndKeys，第一个值为空时，后面的都取不到值
    NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"华南区",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"华北区",@"name",@"NO",@"state",nil];
    NSLog(@"mainCell is --- %@",nameAndStateDic2[@"name"]);
    
    NSMutableDictionary *nameAndStateDic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"华东区",@"name",@"NO",@"state",nil];
    
    grouparr0 = [[NSMutableArray alloc] initWithObjects:nameAndStateDic1,nameAndStateDic2,nameAndStateDic3, nil];
    
    NSMutableDictionary *nameAndStateDic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"众荟集团",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"慧云事业部",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"西南区",@"name",@"NO",@"state",nil];

    
    grouparr1 = [[NSMutableArray alloc]initWithObjects:nameAndStateDic4,nameAndStateDic5,nameAndStateDic6, nil];
    
    [dic setValue:grouparr0 forKey:@"0"];
    [dic setValue:grouparr1 forKey:@"1"];
}

#pragma mark----tableViewDelegate
//返回几个表头
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return titleDataArray.count;
}


//每一个表头下返回几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *string = [NSString stringWithFormat:@"%ld",section];
    
    NSLog(@"string -- %@",string);
    
    NSLog(@"selectedArr -- %@",selectedArr);
    
    if ([selectedArr containsObject:string]) {
        
        UIImageView *imageV = (UIImageView *)[self.tableView viewWithTag:20000+section];
        
        imageV.image = [UIImage imageNamed:@"buddy_header_arrow_down@2x.png"];
        
        NSArray *array1 = dic[string];
        
        NSLog(@"---%@",dic[string]);
        
        return array1.count;

    }
    return 0;
}


//设置表头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


//Section Footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.2;
}


//设置view，将替代titleForHeaderInSection方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.tableView.frame.size.width-20, 30)];
    titleLabel.text = [titleDataArray objectAtIndex:section];
    [view addSubview:titleLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 12, 15, 15)];
    imageView.tag = 20000+section;
    
    //判断是不是选中状态
    NSString *string = [NSString stringWithFormat:@"%ld",(long)section];
    
    if ([selectedArr containsObject:string]) {
        imageView.image = [UIImage imageNamed:@"buddy_header_arrow_down@2x.png"];
    }
    else
    {
        imageView.image = [UIImage imageNamed:@"buddy_header_arrow_right@2x.png"];
    }
    [view addSubview:imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40);
    button.tag = 100+section;
    [button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 39, 320, 1)];
    lineImage.image = [UIImage imageNamed:@"line.png"];
    [view addSubview:lineImage];
    
    return view;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *indexStr = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    
    if ([dic[indexStr][indexPath.row][@"cell"] isEqualToString:@"MainCell"])
    {
        return 60;
        
    }else {
#pragma mark - 最后的cell的高度
        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当前是第几个表头
    NSString *indexStr = [NSString stringWithFormat:@"%ld",indexPath.section];
    
    if ([dic[indexStr][indexPath.row][@"cell"] isEqualToString:@"MainCell"]) {
        
        static NSString *CellIdentifier = @"MainCell";
        MainCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            
            cell = [[MainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
        
        if ([selectedArr containsObject:indexStr]) {
            
            cell.nameLabel.text = dic[indexStr][indexPath.row][@"name"];
            cell.IntroductionLabel.text = @"他开着你的花，在每一个晚霞，靠着你的肩膀绣着枝桠";

        }
        if (indexPath.row == dataArray.count-1) {
            cell.imageLine.image = nil;
        }else {
            cell.imageLine.image = [UIImage imageNamed:@"line.png"];
        }
        return cell;
        
    }else if ([dic[indexStr][indexPath.row][@"cell"]isEqualToString:@"AttachedCell"]) {
    
        static NSString *cellId = @"AttachedCell";
        
        AttachedCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            
            cell = [[AttachedCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.imageLine.image = [UIImage imageNamed:@"line.png"];

        }
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *indexStr = [NSString stringWithFormat:@"%ld",indexPath.section];
    
    NSIndexPath *path = nil;
    
    if ([dic[indexStr][indexPath.row][@"cell"]isEqualToString:@"MainCell"]) {
        
        path = [NSIndexPath indexPathForItem:(indexPath.row+1) inSection:indexPath.section];
    }else {
    
        path = indexPath;
    }

    if ([dic[indexStr][indexPath.row][@"state"]boolValue]) {
        
        // 关闭附加cell
        NSMutableDictionary *dd = dic[indexStr][indexPath.row];
        NSString *name = dd[@"name"];
        NSMutableDictionary *nameAndStateDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",name,@"name",@"NO",@"state",nil];
        switch (indexPath.section) {
            case 0:
            {
                grouparr0[(path.row - 1)] = nameAndStateDict;
                [grouparr0 removeObjectAtIndex:path.row];
            }
                break;
             case 1:
            {
                grouparr1[(path.row - 1)] = nameAndStateDict;
                [grouparr1 removeObjectAtIndex:path.row];

            
            }
                
            default:
                break;
        }
        
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[path]  withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView endUpdates];

    }else {
    
        // 打开附加cell
        NSMutableDictionary *dd = dic[indexStr][indexPath.row];
        NSString *name = dd[@"name"];
        
        NSMutableDictionary *nameAndStateDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",name,@"name",@"YES",@"state",nil];
        
        NSLog(@"11111-----%@",nameAndStateDic);
        
        switch (indexPath.section) {
            case 0:
            {
                grouparr0[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                
                NSLog(@"22222-----%@",nameAndStateDic1);

                [grouparr0 insertObject:nameAndStateDic1 atIndex:path.row];
            }
                break;
            case 1:
            {
                grouparr1[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                [grouparr1 insertObject:nameAndStateDic1 atIndex:path.row];
            }

        }
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView endUpdates];

    }
    
}

-(void)doButton:(UIButton *)sender
{
    NSString *string = [NSString stringWithFormat:@"%ld",sender.tag-100];
    
    //数组selectedArr里面存的数据和表头想对应，方便以后做比较
    if ([selectedArr containsObject:string])
    {
        [selectedArr removeObject:string];
    }
    else
    {
        [selectedArr addObject:string];
    }
    
    [self.tableView reloadData];
}


/*
 beginUpdates方法和endUpdates方法是什么呢？
 这两个方法，是配合起来使用的，标记了一个tableView的动画块。
 分别代表动画的开始开始和结束。
 两者成对出现，可以嵌套使用。
 一般，在添加，删除，选择 tableView中使用，并实现动画效果。
 在动画块内，不建议使用reloadData方法，如果使用，会影响动画。
 
 一般什么时候使用这么一个动画块呢？
 一般在UITableView执行：删除行，插入行，删除分组，插入分组时，使用！用来协调UITableView的动画效果。
 插入指定的行，
 在执行该方法时，会对数据源进行访问（分组数据和行数据），并更新可见行。所以，在调用该方法前，应该先更新数据源
 - (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
 插入分组到制定位置
 - (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
 插入一个特定的分组。如果，指定的位置上已经存在了分组，那么原来的分组向后移动一个位置。
 删除制定位置的分组
 - (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
 删除一个制定位置的分组，其后面的分组向前移动一个位置。
 移动分组
 - (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection
 移动原来的分组从一个位置移动到一个新的位置。如果，新位置上若存在某个分组，那这某个分组将会向上（下）移动到临近一个位置。该方法，没有动画参数。会直接移动。并且一次只能移动一个分组。

 */


@end
