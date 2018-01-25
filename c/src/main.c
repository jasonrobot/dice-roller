#include "stdio.h"
#include "stdlib.h"
#include "time.h"
#include "dice.h"
#include "string.h"

int main(void) {
    char input[BUFSIZ];
    int result[256];
    char resultString[BUFSIZ];

    int running = 1;

    while (running) {
        printf("Enter dice to roll (q to quit): ");
        if ( fgets(input, BUFSIZ, stdin) == NULL ) {
            break;
        }

        if (input[0] == 'q') {
            running = 0;
            break;
        }

        int amount = 0;
        int sides = 0;
        if (parse(input, &amount, &sides) != INVALID_DICE_STRING) {
            printf("rolling %dd%d\n", amount, sides);
            //results = roll(amount, sides);
            //rollAndPrint(amount, sides);
            roll(result, amount, sides);
            diceResultToString(resultString, result, amount);
            printf("%s\n", resultString);
        }
        else {
            printf("Unable to parse input: %s\n", input);
        }
    }

    return 0;
}