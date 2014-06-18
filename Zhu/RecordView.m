//
//  RecordView.m
//  Zhu
//
//  Created by Albert Mao on 6/18/14.
//
//

#import "RecordView.h"
@interface RecordView ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UIImageView *imageBg;
@property (nonatomic, strong) UILabel *labelT;
@property (nonatomic, strong) UILabel *labelNo;
@property (nonatomic, strong) UILabel *labelDay;
@property (nonatomic, strong) UILabel *labelDate;

@end
@implementation RecordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) init
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 299)];
    if (self) {
        self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(11, 20, 298, 202)];
        [self addSubview:self.imageV];
        
        self.imageBg = [[UIImageView alloc]initWithFrame:CGRectMake(62, 228, 245, 54)];
        self.imageBg.image = [UIImage imageNamed:@"bule2"];
        [self addSubview:self.imageBg];
        
        self.labelT = [[UILabel alloc]initWithFrame:CGRectMake(72, 235, 216, 39)];
        self.labelT.textColor = [UIColor whiteColor];
        self.labelT.numberOfLines = 3;
        self.labelT.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:self.labelT];
        
        
        self.labelNo = [[UILabel alloc]initWithFrame:CGRectMake(11, 5, 29, 12)];
        self.labelNo.font = [UIFont systemFontOfSize:10.0f];
        self.labelNo.textColor = [UIColor lightGrayColor];
        [self addSubview:self.labelNo];
        
        self.labelDay = [[UILabel alloc]initWithFrame:CGRectMake(11, 225, 41, 45)];
        self.labelDay.textColor = UIColorFromRGB(0x19A5F9);
        self.labelDay.font = [UIFont systemFontOfSize:37.0f];
        [self addSubview:self.labelDay];
        
        self.labelDate = [[UILabel alloc]initWithFrame:CGRectMake(10, 267, 47, 12)];
        self.labelDate.textColor = [UIColor lightGrayColor];
        self.labelDate.font = [UIFont systemFontOfSize:10.0f];
        [self addSubview:self.labelDate];
    }
    return self;
}

- (void) setSourceNo:(NSInteger)no imageName:(NSString *)imageName day:(NSString *)day experience:(NSString *)experience
{
    self.labelNo.text = [NSString stringWithFormat:@"VOL.%i",no];
    
    self.imageV.image = [UIImage imageNamed:imageName];
    
    self.labelDay.text = day;
    
    self.labelDate.text = @"MAY,2014";
    
    self.labelT.text = experience;
    [self.labelT sizeToFit];
}

@end
