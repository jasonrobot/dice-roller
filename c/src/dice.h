#ifndef DICE_H
#define DICE_H

#include "stdlib.h"
#include "time.h"

#define INVALID_DICE_STRING 1

int rollOne(int);
int roll(int*, int, int);
int parse(char*, int*, int*);
int diceResultToString(char*, int*, int);

#endif