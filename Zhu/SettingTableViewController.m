//
//  SettingTableViewController.m
//  Zhu
//
//  Created by 朱艳秋 on 14/6/17.
//
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) UIImageView *imageAvatar;

@end

@implementation SettingTableViewController

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50.0f;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellId;
    strCellId = [NSString stringWithFormat:@"SettingCell%i",indexPath.row];


    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellId];
    
    if (self.imageAvatar == nil && indexPath.row == 0 ) {
        self.imageAvatar = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 38, 38)];
        self.imageAvatar.image = [UIImage imageNamed:@"image1.png"];
        [cell addSubview:self.imageAvatar];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self showPhotoActionSheet];
    }
}



#pragma - mark photo


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
    
    self.imageAvatar.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];

}


@end
