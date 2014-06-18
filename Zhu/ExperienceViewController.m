//
//  ExperienceViewController.m
//  Zhu
//
//  Created by Albert Mao on 6/18/14.
//
//

#import "ExperienceViewController.h"
#import "RecordView.h"
@interface ExperienceViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollContainer;

@end

@implementation ExperienceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
 8pic3
 VOL.4
 24
 
 
 8pic4
 VOL.3
 23

 
 8pic5
 VOL.2
 22
 MAY,2014

 
 8pic6
 VOL.1
 21
 MAY,2014

 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *arrImages = @[@"8pic1",@"8pic3",@"8pic4",@"8pic5",@"8pic6"];
    NSArray *arrExp = @[@"戒油炸！戒碳酸！戒甜食！戒宵夜！戒零食！戒淀粉！戒油腻！戒不运动！",
                        @"为什么要减肥？因为肥，因为肥。因为走路都无力，所以总是跟不上大家。因为胖子没人爱！！！因为穿不了漂亮的花裙裙。",
                        @" “妈咪！给我钱买新裤子！”“不是刚买了一条新的吗？”“是啊！但是，又磨破了！”“你个败家子！赶紧！减肥！”",
                        @" 所有事都是这样吧。要么接受，要么改变。要么接受你是个胖子，要么努力减肥！",
                        @" 亲，想瘦吗？你只需要一个体重是你一半的室友，并把你的一半饭给她。"
                        ];
    
    NSArray *arrDay = @[@"25",@"24",@"23",@"22",@"21"];
    int i = 0;
    for (; i < arrImages.count; i ++) {
        RecordView *record = [[RecordView alloc]init];
        [record setFrame:CGRectMake(i * record.frame.size.width, -64, record.frame.size.width, record.frame.size.height)];
        [record setSourceNo:i imageName:[arrImages objectAtIndex:i] day:[arrDay objectAtIndex:i] experience:[arrExp objectAtIndex:i]];
        [self.scrollContainer addSubview:record];
    }
    
    [self.scrollContainer setContentSize:CGSizeMake(i * self.scrollContainer.frame.size.width,0)];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
