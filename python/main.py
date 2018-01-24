"""basically all code is here"""
from random import randint

class Dice:
    """represents dice to be thrown"""
    def __init__(self, amount, sides):
        self.amount = amount
        self.sides = sides

    @classmethod
    def from_string(cls, line):
        """creates a new Dice object from a string"""
        pair = cls._parse(line)
        return cls(pair[0], pair[1])

    def roll(self):
        """rolls the dice"""
        return self._roll(self.amount, self.sides)

    @staticmethod
    def _roll(amount, sides):
        """rolls a number of dice with a given amount of sides"""
        if sides < 2:
            raise InvalidDieError(sides)
        return [randint(1, sides) for _ in range(0, amount)]

    def parse(self, line):
        """parses a string into a dice object"""
        self.amount, self.sides = self._parse(line)

    @staticmethod
    def _parse(line):
        """parses xdy into (x, y)"""
        result = line.split('d')
        if result[0] == '':
            result[0] = 1
        if result[1] == '':
            raise InvalidDieError('unknown')
        return (int(result[0]), int(result[1]))

class InvalidDieError(Exception):
    """for if you try to roll something that isn't a sensible die"""
    def __init__(self, value):
        self.value = value
        self.message = "Tried to roll a die with {} sides.".format(value)

def main():
    """main function, reads from user, loops until quit"""
    will_quit = False
    while not will_quit:
        print('Welcome! \'q\' to quit.')
        command = input('Enter dice to roll: ')
        if command[0] == 'q':
            will_quit = True
        else:
            print(Dice.from_string(command).roll())

if __name__ == '__main__':
    main()
