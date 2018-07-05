//
//  TestTableViewCell.m
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/5.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.lab = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.lab.textColor = [UIColor blackColor];
        self.lab.layer.masksToBounds = YES;
        self.lab.layer.cornerRadius = 3.0f;
        [self.contentView addSubview:self.lab];
    }
    return self;
}


@end
