//
//  EditDemandPicker.h
//  Lemon
//

#import <UIKit/UIKit.h>
@class EditDemandPicker;
@protocol editPickDelegate <NSObject>

@optional

- (void)quxiao;
- (void)sureWithSelect:(NSString *)select pickview:(EditDemandPicker *)picker;

- (void)sureWithComponentOne:(NSString *)one componentTwo:(NSString *)two withRow:(NSInteger)row wihtComponent:(NSInteger)component;

- (void)selectComponent:(NSInteger)component row:(NSInteger)row;

@end
@interface EditDemandPicker : UIView <UIPickerViewDelegate,UIPickerViewDataSource>
{
    __weak id<editPickDelegate>_delegate;
    UIPickerView *_pickerView;
    NSMutableArray *_firstDataArray;
    NSMutableArray *_secondDataArray;

}
@property (nonatomic,weak) id <editPickDelegate>delegate;
@property (nonatomic,strong) NSMutableArray *firstDataArray;
@property (nonatomic,strong) NSMutableArray *secondDataArray;
@property (nonatomic,assign) NSInteger pickerTag;
@property (nonatomic,strong) UIPickerView *pickerView;

- (instancetype)initWithFrame:(CGRect)frame numberOfComponent:(NSInteger)number;
- (void)reloadMyView;
- (void)showPickerView;
- (void)hidenPickerView;




@end
