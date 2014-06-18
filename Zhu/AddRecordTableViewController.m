//
//  AddRecordTableViewController.m
//  Zhu
//
//  Created by 朱艳秋 on 14/6/17.
//
//

#import "AddRecordTableViewController.h"

@interface AddRecordTableViewController ()<UIScrollViewDelegate, UITextViewDelegate,UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UITapGestureRecognizer *tap;

@property (nonatomic, strong) UIButton *btnPhoto;
@end

@implementation AddRecordTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)navbarDoneClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 268.0f;
    }
    return 43.0f;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellId;
    strCellId = [NSString stringWithFormat:@"AddRecordCell%i",indexPath.row];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellId];
    if (indexPath.row == 2 && self.btnPhoto == nil) {
        self.btnPhoto = [[UIButton alloc]initWithFrame:CGRectMake(22, 3, 276, 205)];
        [self.btnPhoto setBackgroundImage:[UIImage imageNamed:@"10pic2"] forState:UIControlStateNormal];
        [self.btnPhoto addTarget:self action:@selector(btnPhotoClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:self.btnPhoto];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void) textViewDidBeginEditing:(UITextView *)textView
{
    if (self.tap == nil) {
        self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    }
    [self.tableView addGestureRecognizer:self.tap];
}

- (void) tapAction
{
    [self hideKeyBoard];
}

- (void) textViewDidEndEditing:(UITextView *)textView

{
    if (self.tap) {
        [self.tableView removeGestureRecognizer:self.tap];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideKeyBoard];
}


- (void) hideKeyBoard
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}




#pragma - mark photo

- (IBAction)btnPhotoClick:(id)sender
{
    [self showPhotoActionSheet];
}


//照片
- (void) showPhotoActionSheet
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]init];
    actionSheet.delegate = self;
    
    [actionSheet addButtonWithTitle:@"相册选取"];
    [actionSheet addButtonWithTitle:@"相机拍摄"];
    [actionSheet addButtonWithTitle:@"取消"];
    
    [actionSheet setCancelButtonIndex:2];
    [actionSheet showInView:self.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    switch (buttonIndex) {
        case 0:
        {
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
            break;
        case 1:
        {
#if TARGET_IPHONE_SIMULATOR
            return;
#endif
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        }
            break;
        case 2:
        {
            return;
        }
            break;
            
        default:
            break;
    }
    [self presentViewController:picker animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image = [info objectForKey: UIImagePickerControllerOriginalImage];
    [self.btnPhoto setBackgroundImage:image forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


@end
