#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "time.h"
#include "dice.h"

/**
 * Roll a number of dice and store the results in an array.
 * 
 * @param result the int array to store the results in
 * @param amount how many dice to roll
 * @param sides how many sides the dice have
 * 
 * @return int the number of dice rolled
 */
int roll(int* result, int amount, int sides) {
    int i = 0;
    for (; i < amount; i++) {
        //printf("rolling a d%d\n", sides);
        result[i] = rollOne(sides);
    }
    return i;
}

/**
 * Rolls a die
 * 
 * @param sides how many sides the die has
 * 
 * @return the result of the roll
 */
int rollOne(int sides) {
    return (rand() % sides) + 1;
}

/**
 * Helper method for resetting a string to '\0'
 */
void clearString(char* str) {
    memset(str, '\0', strlen(str));    
}

/**
 * Parses the dice roll string into amount and sides.
 * 
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
 * formats an array of ints into a string
 * 
 * @param str the string to store the results in
 * @param result the dice roll results array to take from
 * @param amount how many items in the result array
 * 
 * @return the number of characters written to str
 */
int diceResultToString(char* str, int* result, int amount) {
    char* start = str;
    str += sprintf(str, "[");
    for (int i = 0; i < amount; i++) {
        str += sprintf(str, "%d", result[i]);
        if ((i + 1 - amount) != 0) {
            str += sprintf(str, ", ");
        }
    }
    str += sprintf(str, "]");
    return (int)(str - start);
}
