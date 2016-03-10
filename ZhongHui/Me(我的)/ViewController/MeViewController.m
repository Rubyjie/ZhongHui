//
//  MeViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MeViewController.h"

//#pragma mark 第二种选择图片的样式
//#import "UzysAssetsPickerController.h"
//#import <AVFoundation/AVFoundation.h>

#import "RegisterViewController.h"  //修改密码
#import "MainAddressController.h"   //通讯录
#import "MainMeTaskController.h"    //我接受的任务
#import "MainFeiPenTaskController.h"//我分配的任务
#import "MainApplicantController.h" //我的申请
#import "MainCollectionController.h"//我的收款
#import "ScheduleViewController.h"  //我的日程
#import "PersonFileViewController.h"
#import "HeaderView.h"
#import "MeCell.h"
#import "ActionView.h"
#import "PopupView.h"

#import "UIButton+WebCache.h"
#import "UserDefault.h"
#import "AFNetworking.h"

#import "PersonBaseClass.h"
#import "PersonData.h"


#import "HttpTool.h"
#import "SendphotosView.h" // 上传多张图片的view

@interface MeViewController () <UITableViewDataSource,UITableViewDelegate,passWordButtonDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ActionViewDelegate,PopviewDelegate>

{
    NSArray *firstArray;
    NSArray *secnodArray;
}

@property (nonatomic, strong)UITableView *meTable;
@property (nonatomic, strong)PersonBaseClass *baseModel;

@property (nonatomic, strong)HeaderView *header ;

@property (nonatomic, strong)ActionView *action;

@property (nonatomic, strong)PopupView *meTaskTypePopView;

@property (nonatomic, strong)NSArray *taskArray;

@end

@implementation MeViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(PopupView *)meTaskTypePopView
{
    if (!_meTaskTypePopView) {
        
        self.taskArray = @[@"我接受的",@"我分配的"];
        _meTaskTypePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.taskArray];
        _meTaskTypePopView.delegate = self;
        _meTaskTypePopView.tag = 111;
    }
    return _meTaskTypePopView;
}


-(UITableView *)meTable
{
    if (!_meTable) {
        
        _meTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 49-10)style:UITableViewStyleGrouped];
    }
    return _meTable;
}

- (ActionView *)action
{
    if (!_action) {
        _action = [[ActionView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArr:@[@"拍照",@"从手机相册选择",@"取消"] colorArr:nil];
        _action.delegate = self;
    }
    return _action;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[Session sharedSession].loadView StopLoading];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = RGB(227, 227, 227);
    self.meTable.dataSource = self;
    self.meTable.delegate = self;
    
    firstArray  = @[@"通讯录",@"我的日程"];
    secnodArray = @[@"我的任务",@"我的申请"];
    
#pragma mark - 修改个人档案成功的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(upDataPersonFile) name:@"CHANGEFILE" object:nil];
    

    
    // 获取个人档案信息
    [self getPersonFileData];


    self.header = [[HeaderView alloc]initWithFrame:CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, 100)];
    self.header.delegate  = self;
    self.meTable.tableHeaderView = self.header;
    [self.view addSubview:self.meTable];
}

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
            
            self.header.phoneLabel.text = self.baseModel.data.mobile;
            self.header.nameLabel.text = self.baseModel.data.employeeName;
        }
        
        [self.meTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2 || section == 3) {
        return 1;
    }
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"meCellIdentfier";
    
    MeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[MeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];

    }
    
    NSString *iconName = nil;
    
    if (indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.titleLabel.text = [firstArray objectAtIndex:indexPath.row];
        iconName = indexPath.row == 0 ? @"通讯录" : @"我的日程";

    }else if (indexPath.section == 1){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.titleLabel.text = [secnodArray objectAtIndex:indexPath.row];
        iconName = indexPath.row == 0 ? @"我的任务" : @"我的申请";

    }else if (indexPath.section == 2){
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.titleLabel.text = @"我的收款";
        iconName = @"我的收款";
        
    }else{
    
        cell.titleLabel.text = @"退出登录";
        cell.IconImage.frame = CGRectMake((PHONE_UISCREEN_WIDTH - 110)/2, 16, 20, 20);
        cell.titleLabel.frame = CGRectMake(CGRectGetMaxX(cell.IconImage.frame)+10, 0, 80, 50);
        iconName = @"Power";
    }
    
    cell.IconImage.image = [UIImage imageNamed:iconName];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            MainAddressController *address = [[MainAddressController alloc]init];
            address.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:address animated:YES];
            
        }else if (indexPath.row == 1) {
        
            ScheduleViewController *schedule = [[ScheduleViewController alloc]init];
            schedule.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:schedule animated:YES];
        }
        
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            
            [self.meTaskTypePopView showAlert];
            
        }else if (indexPath.row == 1){
        
            MainApplicantController *applicant = [[MainApplicantController alloc]init];
            applicant.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:applicant animated:YES];

        }
    
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            
            MainCollectionController *collection = [[MainCollectionController alloc]init];
            collection.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:collection animated:YES];
        }
    }else if (indexPath.section == 3){
    
        if (indexPath.row == 0) {
            //退出时调用
            [[Session sharedSession] cleanForLogout];

            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"确定退出登录吗？" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            alertView.tag = 10;
            alertView.delegate = self;
            
            [alertView show];
        }
    
    }
}


#pragma mark alertViewDelegate 点击按钮触发的方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 10) {
        
        if (alertView.cancelButtonIndex == buttonIndex) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:CHANGEROOTCONTROLLER object:@"1"];
            
            //退出时清除信息
            [UserDefault removeDataObjectForKey:@"logInName"];
            [UserDefault removeDataObjectForKey:@"managerID"];
            [UserDefault removeDataObjectForKey:@"managerToken"];
            
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - 修改密码
-(void)swithButtonChangePassWord
{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    registerVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:registerVC animated:YES];
}

-(void)swithButtonModifyPersonFile
{
    PersonFileViewController *personFile = [[PersonFileViewController alloc]init];
    personFile.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:personFile animated:YES];
}

-(void)choosePhotoUpDataWithTag:(NSInteger)tag
{
    if (tag == 120) {
    
        [self.action showAlert];

    }
}


#pragma mark - ActionViewDelegate选择图库和相机
- (void)selectWhichToPush:(NSInteger)tag
{
    if (tag == 1000) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
        picker.delegate = self;
        picker.allowsEditing = NO;//设置可编辑
        picker.sourceType = sourceType;
        [self.navigationController presentViewController:picker animated:YES completion:^{
            
        }];

    }else if (tag == 1001) {
    
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        }
        
        pickerImage.delegate = self;
        pickerImage.navigationBar.tintColor = [UIColor blackColor];
        pickerImage.allowsEditing = NO;
        [self.navigationController presentViewController:pickerImage animated:YES completion:^{
            
        }];
    }

}

#pragma mark - 选完图片后调用这个方法(封装的)微博项目里发微博的
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[Session sharedSession].loadView StartLoading];
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"wechat/my/upload"];
    NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
    NSDictionary *dict = @{@"empId":userId};

    // 封装请求参数
    NSMutableArray *fromDataArray = [NSMutableArray array];
    SendphotosView *photoView = [[SendphotosView alloc]init];
    NSArray *images = [photoView totalImages];
    for (UIImage *image in images) {
        FromData *fromData = [[FromData alloc]init];
        fromData.data = UIImageJPEGRepresentation(image, 0.5);
        fromData.name = @"img1";  //@"参数名"
        fromData.filename = @"";
        fromData.mimeType = @"image/jpeg";
        
        [fromDataArray addObject:fromData];
        
        NSLog(@"-----%lu",(unsigned long)fromDataArray.count);
        
    }

    // 3.发送请求
    [HttpTool postWithUrl:url params:dict fromDataArray:fromDataArray success:^(id json) {
        
        NSLog(@"发送成功");
        
        NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
        NSString *photoUrl = [NSString stringWithFormat:@"%@%@%@",MAINURL,@"attachment/view?id=",userId];
        [self.header.iconImage sd_setImageWithURL:[NSURL URLWithString:photoUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"Man"]];
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]];

        [self.header.iconImage setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];

        [[Session sharedSession].tpView presentMessageTips:@"上传成功"];

        [picker dismissViewControllerAnimated:YES completion:nil];

    } failure:^(NSError *error) {
        
        NSLog(@"发送失败");
    }];
    
}




#pragma mark - 选完图片后调用这个方法 
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    
//    [[Session sharedSession].loadView StartLoading];
//    
//    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"wechat/my/upload"];
//    
//    NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
//    
//    NSDictionary *dict = @{@"empId":userId};
//    
//    
//    AFHTTPRequestOperationManager *mymanager = [AFHTTPRequestOperationManager manager];
//    
//    [mymanager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        
//
//        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//        
//        float scale = [self imageWithImageSimple:portraitImg];
//        NSData *eachImgData = UIImageJPEGRepresentation(portraitImg, scale);
//        
//        [formData appendPartWithFileData:eachImgData name:@"img1" fileName:@"img2.jpg" mimeType:@"image/jpeg"];
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"----%@",[responseObject JSONString]);
//        
//        [[Session sharedSession].loadView StopLoading];
//        
//        if ([responseObject objectForKey:@"success"]) {
//            
//            NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
//            NSString *photoUrl = [NSString stringWithFormat:@"%@%@%@",MAINURL,@"attachment/view?id=",userId];
//            [self.header.iconImage sd_setImageWithURL:[NSURL URLWithString:photoUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"Man"]];
//            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]];
//            
//            [self.header.iconImage setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
//            
//            [[Session sharedSession].tpView presentMessageTips:@"上传成功"];
//            
//            [picker dismissViewControllerAnimated:YES completion:nil];
//
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//       
//        NSLog(@"---%@",error);
//        
//        [[Session sharedSession].loadView StopLoading];
//
//    }];
//    
//    
//}

- (float )imageWithImageSimple:(UIImage*)image
{
    
    NSData * imageData = UIImageJPEGRepresentation(image,1);
    float length = [imageData length]/1024;
#pragma mark - 1000压缩后70kb
    if (length > 1000) {
        return 0.2;
    }else{
        return 0.5;
    }
}

#pragma mark - PopviewDelegate
-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    if (tag == 100) {
        
        MainMeTaskController *meJieShouTask = [[MainMeTaskController alloc]init];
        meJieShouTask.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:meJieShouTask animated:YES];

    }else if (tag == 101) {
    
        MainFeiPenTaskController *feiPenTask = [[MainFeiPenTaskController alloc]init];
        feiPenTask.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:feiPenTask animated:YES];

    }
    
}


@end
