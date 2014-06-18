//
//  LoginViewController.m
//  Zhu
//
//  Created by Albert Mao on 6/17/14.
//
//

#import "LoginViewController.h"
#import "LoginCenter.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollContainer;
@property(nonatomic, assign) BOOL wcrRegister;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollContainer.contentSize = CGSizeMake(640, self.scrollContainer.frame.size.height);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnLoginClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[LoginCenter sharedInstance] login];
}
- (IBAction)btnToRegisterClick:(id)sender {
    [self.scrollContainer setContentOffset:CGPointMake(320.0f, 0) animated:YES];
    self.wcrRegister = YES;
}

- (IBAction)btnBackLoginClick:(id)sender {
    [self.scrollContainer setContentOffset:CGPointMake(0.0f, 0) animated:YES];
    self.wcrRegister = NO;
}

- (IBAction)btnRegisterClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateKeyframesWithDuration:0.2 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.view.frame = CGRectMake(self.view.frame.origin.x,self.wcrRegister ? -200 : -130, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyBoard];
    [self animationBack];
    return YES;
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
}

- (void) animationBack
{
    [UIView animateKeyframesWithDuration:0.2 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.view.frame = CGRectMake(self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];

}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideKeyBoard];
    [self animationBack];
}

- (void) hideKeyBoard
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end
