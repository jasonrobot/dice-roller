#include "stdlib.h"
#include "time.h"
#include "dice.h"

int* roll(int amount, int sides) {
    int* results = malloc(sizeof(int) * amount);
    for (int i = 0; i < amount; i++) {
        results[i] = rollOne(sides);
    }
    return results;
}

int rollOne(int sides) {
    return (rand() % sides) + 1;
}
