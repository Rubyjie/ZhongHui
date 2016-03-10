//
//  PersonFileViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PersonFileViewController.h"
#import "ChooseFileController.h"

#import "ProrsonFileCell.h"
#import "ImageCell.h"

#import "AFNetworking.h"
#import "UserDefault.h"
#import "UIImageView+WebCache.h"

#import "PersonBaseClass.h"
#import "PersonData.h"

@interface PersonFileViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *personFileTabel;
@property (nonatomic, strong)PersonBaseClass *baseModel;
@property (nonatomic, strong)NSArray *titleArray;

@property (nonatomic, strong)UIImageView *photoImage;

@end

@implementation PersonFileViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(UITableView *)personFileTabel
{
    if (!_personFileTabel) {
        
        _personFileTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _personFileTabel.dataSource = self;
        _personFileTabel.delegate = self;
    }
    return _personFileTabel;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"个人档案";
    self.titleArray = @[@"姓名",@"工号",@"性别",@"所属机构",@"移动电话",@"邮件",@"职务",@"职位",@"事业部",@"备注",@"状态"];;
    [self.view addSubview:self.personFileTabel];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editData)];
    
    // 获取个人档案信息
    [self getPersonFileData];
    
#pragma mark - 修改个人档案成功的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(upDataPersonFile) name:@"CHANGEFILE" object:nil];
    
}

#pragma mark - 修改个人档案成功的通知
-(void)upDataPersonFile
{
    // 获取个人档案信息
    [self getPersonFileData];
}

-(void)getPersonFileData
{
    
    NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
    NSString *url = [NSString stringWithFormat:@"%@%@%@",MAINURL,@"base/employee/get/",userId];
    NSLog(@"------%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        self.baseModel = [[PersonBaseClass alloc]initWithDictionary:responseObject];
        
        if (self.baseModel.success) {
            
        }
        [self.personFileTabel reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        static NSString *ImagecellId = @"ImageCellIdentfier";
        
        ImageCell *touXiangCell = [tableView dequeueReusableCellWithIdentifier:ImagecellId];
        
        if (touXiangCell == nil) {
            
            touXiangCell = [[ImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ImagecellId];

        }
        
        touXiangCell.touXiang.text = @"头像";

        NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
        NSString *photoUrl = [NSString stringWithFormat:@"%@%@%@",MAINURL,@"attachment/view?id=",userId];
        [touXiangCell.photoImage sd_setImageWithURL:[NSURL URLWithString:photoUrl] placeholderImage:[UIImage imageNamed:@"Man"]];
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]];
        touXiangCell.photoImage.image = [UIImage imageWithData:data];
        self.photoImage = touXiangCell.photoImage;
        self.photoImage.layer.cornerRadius = 20;
        self.photoImage.layer.masksToBounds = YES;

        return touXiangCell;
        
    }else{
    
        static NSString *cellId = @"personFileCellIdentfier";
        ProrsonFileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (!cell) {
            
            cell = [[ProrsonFileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        
        if ([self.baseModel.data.gender isEqualToString:@"BP_MAN"]) {
            
            self.baseModel.data.gender = @"先生";
            
        }else if ([self.baseModel.data.gender isEqualToString:@"BP_LADY"]) {
        
            self.baseModel.data.gender = @"女士";
            
        }else if ([self.baseModel.data.gender isEqualToString:@"BP_OTHER"]) {
        
            self.baseModel.data.gender = @"其他";
        }
        
        
        cell.titleLabel.text = [self.titleArray objectAtIndex:indexPath.row];
        self.titleArray = @[@"头像",@"姓名",@"工号",@"性别",@"所属机构",@"移动电话",@"邮件",@"职务",@"职位",@"事业部",@"备注",@"状态"];;

        switch (indexPath.row) {
            case 1:
                cell.contentLabel.text = self.baseModel.data.employeeName;
                break;
            case 2:
                cell.contentLabel.text = self.baseModel.data.employeeCode;
                break;
            case 3:
                cell.contentLabel.text = self.baseModel.data.gender;
                break;
            case 4:
                cell.contentLabel.text = self.baseModel.data.organizationName;
                break;
            case 5:
                cell.contentLabel.text = self.baseModel.data.mobile;
                break;
            case 6:
                cell.contentLabel.text = self.baseModel.data.email;
                break;
            case 7:
                cell.contentLabel.text = self.baseModel.data.duty;
                break;
            case 8:
                cell.contentLabel.text = self.baseModel.data.position;
                break;
            case 9:
                cell.contentLabel.text = self.baseModel.data.yeTaiName;
                break;
            case 10:
                cell.contentLabel.text = self.baseModel.data.dataDescription;
                break;
            case 11:
                cell.contentLabel.text = self.baseModel.data.status;
            default:
                break;
        }
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)editData
{
    ChooseFileController *chooseVC = [[ChooseFileController alloc]init];
    chooseVC.imageView = self.photoImage;
    chooseVC.name = self.baseModel.data.employeeName;
    chooseVC.number = self.baseModel.data.employeeCode;
    chooseVC.sex = self.baseModel.data.gender;
    chooseVC.jiGou = self.baseModel.data.organizationName;
    chooseVC.phone = self.baseModel.data.mobile;
    chooseVC.email = self.baseModel.data.email;
    chooseVC.zhiWu = self.baseModel.data.duty;
    chooseVC.position = self.baseModel.data.position;
    chooseVC.shiYe = self.baseModel.data.yeTaiName;
    chooseVC.beiZhu = self.baseModel.data.dataDescription;
    chooseVC.status = self.baseModel.data.status;
    [self.navigationController pushViewController:chooseVC animated:YES];
}


@end
