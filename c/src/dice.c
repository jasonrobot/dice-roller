#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "time.h"
#include "dice.h"

typedef struct {
    int amount;
    int sides;
} Dice;

int* roll(int amount, int sides) {
    int* results = malloc(sizeof(int) * amount);
    for (int i = 0; i < amount; i++) {
        //printf("rolling a d%d\n", sides);
        results[i] = rollOne(sides);
    }
    return results;
}

int rollOne(int sides) {
    return (rand() % sides) + 1;
}

void clearString(char* str) {
    memset(str, '\0', strlen(str));    
}

/**
 * Parses the dice roll string into amount and sides.
 * @param amount pointer to where the amount will be stored
 * @param sides pointer to where sides gets stores
 * 
 * @return non-zero on parse error
 */
int parse(char* string, int* amount, int* sides) {
    char* d_char = NULL;
    d_char = strchr(string, 'd');
    if (d_char == NULL) {
        return INVALID_DICE_STRING;
    }
    int amountStringLength = d_char - string;
    //printf("amountStringLength: %d\n", amountStringLength);

    char temp[BUFSIZ];

    strncpy(temp, string, amountStringLength);
    *amount = atoi(temp);
    clearString(temp);

    strcpy(temp, d_char + 1);
    *sides = atoi(temp);
    clearString(temp);

    return 0;
}

/**
 * Not used
 */
Dice* diceFromString(char* string) {
    int a;
    int s;
    int result = 0;
    if (parse(string, &a, &s) == INVALID_DICE_STRING) {
        return NULL;
    }
    Dice* d = malloc(sizeof(Dice));
    d->amount = a;
    d->sides = s;
    return d;
}