//
//  EditDemandPicker.m
//  Lemon
//
//

#import "EditDemandPicker.h"
#import "Header.h"

@implementation EditDemandPicker
{
    NSInteger _number;
}
@synthesize delegate = _delegate;

@synthesize pickerView;

- (instancetype)initWithFrame:(CGRect)frame numberOfComponent:(NSInteger)number
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _number = number;
        
        self.backgroundColor = [UIColor clearColor];
        
        UIControl *_mycontro = [[UIControl alloc]initWithFrame:self.bounds];
        _mycontro.backgroundColor = RRR(0.0);
        _mycontro.alpha = 0.5;
        [_mycontro addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_mycontro];
        
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, PHONE_UISCREEN_HEIGHT , PHONE_UISCREEN_WIDTH, 38+180)];
        view.tag = 66;
        view.backgroundColor = RRR(249.0);
        [self addSubview:view];
        
        UIButton *quxiao = [UIButton buttonWithType:UIButtonTypeCustom];
        quxiao.frame = CGRectMake(16, 10, 40, 20);
        quxiao.titleLabel.font = [UIFont systemFontOfSize:15];
        [quxiao setTitle:@"取消" forState:UIControlStateNormal];
        [quxiao setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [quxiao addTarget:self action:@selector(quxiaoAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:quxiao];
        
        UIButton *queding = [UIButton buttonWithType:UIButtonTypeCustom];
        queding.frame = CGRectMake(PHONE_UISCREEN_WIDTH-16-25-14, 10, 40, 20);
        queding.titleLabel.font = [UIFont systemFontOfSize:15];
        [queding setTitle:@"确定" forState:UIControlStateNormal];
        [queding setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [queding addTarget:self action:@selector(quedingAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:queding];

        
        CALayer *linelayer = [[CALayer alloc]init];
        linelayer.frame = CGRectMake(0, 39.5, PHONE_UISCREEN_WIDTH, 0.5);
        linelayer.backgroundColor = [UIColor blackColor].CGColor;
        [view.layer addSublayer:linelayer];
        
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, 180)];
        _pickerView.backgroundColor = [UIColor whiteColor];
        //    指定Delegate
        _pickerView.delegate= self;
        _pickerView.dataSource = self;
        _pickerView.tag = self.pickerTag;
        //    显示选中框
        _pickerView.showsSelectionIndicator=YES;
        [view addSubview:_pickerView];
        self.pickerView = _pickerView;
    }
    return  self;
}

- (void)setComponentWithNumber:(NSInteger)number
{
    _number = number;
    [_pickerView reloadAllComponents];
}

- (void)backPressed{
    
    [self hidenPickerView];
}

-(void)showPickerView
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    UIView *view = (UIView *)[self viewWithTag:66];

    [UIView animateWithDuration:0.3 animations:^{
        
        view.frame = CGRectMake(0, PHONE_UISCREEN_HEIGHT-220 , PHONE_UISCREEN_WIDTH, 38+180);
    }];
    
    [_pickerView selectRow:0 inComponent:0 animated:NO];
    
    if (_number == 2) {
        
        [_pickerView selectRow:0 inComponent:1 animated:NO];
    }
}

-(void)hidenPickerView
{
    UIView *view = (UIView *)[self viewWithTag:66];
    
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(0, PHONE_UISCREEN_HEIGHT , PHONE_UISCREEN_WIDTH, 38+180);
    }];
    
    [self performSelector:@selector(removeMyself) withObject:nil afterDelay:0.3];

}

-(void)removeMyself
{
    [self removeFromSuperview];
}

- (void)quxiaoAction:(UIButton *)sender
{
    [self hidenPickerView];
    [self.delegate quxiao];
}

- (void)quedingAction:(UIButton *)sender
{
    
    [self hidenPickerView];
    
    NSString *string;
    
    if (_number == 1) {
        
        NSInteger row =[_pickerView selectedRowInComponent:0];
        
        if (self.firstDataArray.count < 1) {
            return;
        }
        
        string = [self.firstDataArray objectAtIndex:row];
        [self.delegate sureWithSelect:string pickview:self];

    }else if (_number == 2){
        
//        NSInteger row1 =[_pickerView selectedRowInComponent:0];
        NSInteger row2 =[_pickerView selectedRowInComponent:1];
        string = [self.secondDataArray objectAtIndex:row2];
        [self.delegate sureWithSelect:[self.secondDataArray objectAtIndex:row2] pickview:self];
    }

}

- (NSMutableArray *)firstDataArray
{
    if (!_firstDataArray) {
        _firstDataArray = [[NSMutableArray alloc]initWithObjects:@"意见",@"原因", nil];
    }
    return _firstDataArray;
}
- (NSMutableArray *)secondDataArray
{
    if (!_secondDataArray) {
        
        _secondDataArray = [[NSMutableArray alloc]initWithArray:@[@"同意",@"不同意",@"符合标准",@"不符合"]];
    }
    return _secondDataArray;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return _number;
}

//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        
        return self.firstDataArray.count;
        
    }else if (_number == 2 && component == 1){
        
        return self.secondDataArray.count;
    }
    return 0;
}

#pragma mark Picker Delegate Methods
//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.firstDataArray objectAtIndex:row];
    }else if(component == 1){
        return [self.secondDataArray objectAtIndex:row];
    }
    return nil;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.delegate selectComponent:component row:row];
}

//-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//    return 40;
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    UILabel *myView = nil;
    
    if (component == 0) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 150, 30)];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.text = [self.firstDataArray objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:16];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    }else if (component == 1){
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 150, 30)];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.contentMode = UIViewContentModeScaleAspectFill;
        
        myView.text = [self.secondDataArray objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        myView.textColor = [UIColor redColor];
        myView.backgroundColor = [UIColor clearColor];
        
    }
    
    return myView;
    
}
- (void)reloadMyView{
    
    [_pickerView reloadAllComponents];

}
@end
