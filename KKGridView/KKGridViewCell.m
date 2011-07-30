//
//  KKGridViewCell.m
//  KKGridView
//
//  Created by Kolin Krewinkel on 7.24.11.
//  Copyright 2011 Giulio Petek, Jonathan Sterling, and Kolin Krewinkel. All rights reserved.
//

#import "KKGridViewCell.h"

@implementation KKGridViewCell

@synthesize reuseIdentifier = _reuseIdentifier;
@synthesize selected = _selected;
@synthesize selectedBackgroundView = _selectedBackgroundView;

#pragma mark - Designated Initializer

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithFrame:frame])) {
        self.reuseIdentifier = reuseIdentifier;
        
        _selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _selectedBackgroundView.backgroundColor = [UIColor blueColor];
        _selectedBackgroundView.hidden = YES;
        _selectedBackgroundView.alpha = 0.f;
        [self addSubview:_selectedBackgroundView];
    }
    
    return self;
}

#pragma mark - Setters

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    if (selected == YES) {
        _selectedBackgroundView.hidden = !selected;
    }
    
    if ([UIView areAnimationsEnabled]) {
        _selectedBackgroundView.alpha = selected ? 1.f : 0.f;
    } else {
        _selectedBackgroundView.hidden = !selected;
    }
    
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [UIView animateWithDuration:0.2 delay:0 options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAllowAnimatedContent) animations:^(void) {
        self.selected = selected;
    } completion:^(BOOL finished) {
        _selectedBackgroundView.hidden = !selected;
    }];
}

#pragma mark - Drawing

- (void)layoutSubviews
{
    _selectedBackgroundView.frame = self.bounds;
    [super layoutSubviews];
}

#pragma mark - Subclassers

- (void)prepareForReuse
{
    
}

#pragma mark - NSObject

- (void)dealloc
{
    [_reuseIdentifier release];
    [super dealloc];
}

@end
