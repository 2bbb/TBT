//
//  TBVector.h
//
//  Created by ISHII 2bit on 2013/09/10.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

typedef CGPoint TBVector;

#define TBGetVector(from, to) ((TBVector){.x = to.x - from.x, .y = to.y - from.y})
#define TBCalcDistance(p, q) (sqrtf((p.x - q.x) * (p.x - q.x) + (p.y - q.y) * (p.y - q.y))
#define TBGetRadius(p) sqrtf(p.x * p.x + p.y * p.y))
#define TBNormalizeVector(p) ((TBVector){.x = p.x / TBGetRadius(p), .y = p.y / TBGetRadius(p)})
#define TBCalcLerp(from, to, amount) ((TBVector){.x = (1.0f - amount) * from.x + amount * to.x, .y = (1.0f - amount) * from.y + amount * to.y})
#define TBGetHalfPoint(p, q) (TBCalcLerp(p, q, 0.5f))