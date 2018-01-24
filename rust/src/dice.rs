extern crate rand;
extern crate regex;

use self::rand::Rng;
use self::regex::Regex;

// use self::rand::distributions::{Range, IndependentSample};
#[derive(Debug)]
pub struct Dice {
    amount: i32,
    sides: i32,
}

impl Dice {
    #![allow(dead_code)]
    pub fn new(amount: i32, sides: i32) -> Dice {
        Dice {amount, sides}
    }

    pub fn from_string(line: &str) -> Dice {
        let (amount, sides) = parse(line);
        Dice {amount, sides}
    }

    pub fn roll(&self) -> Vec<i32> {
        do_roll(self.amount, self.sides)
    }
}

fn do_roll(amount: i32, sides: i32) -> Vec<i32> {
    let mut v: Vec<i32> = Vec::new();
    let mut rng = rand::thread_rng();

    for _ in 0..amount {
        v.push(rng.gen_range(1, sides+1));
    }
    v
}

fn parse(line: &str) -> (i32, i32) {
    let pattern = Regex::new(r"(\d*)d(\d+)").unwrap();
    let caps = pattern.captures(line).unwrap();
    let mut result = vec![];
    for item in caps.iter() {
        let cap_text = item.unwrap().as_str();
        println!("{}", cap_text);
        if cap_text.contains("d") {
            continue;
        }
        if cap_text == "" {
            result.push(1);
        }
        else {
            println!("parsing {}", cap_text);
            result.push(cap_text.parse::<i32>().unwrap())
        }
    }
    (result[0], result[1])
}

// Tests here!

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn sample_test() {
        assert_eq!(2 + 2, 4);
        assert!( do_roll(3, 4).len() == 3 );
        let d = parse("2d12");
        println!("{:?}", do_roll(d.0, d.1));
    }

    #[test]
    fn test_parse() {
        let result = parse("3d6");
        assert_eq!(result, (3, 6));
    }

    // what this is meant to test is that the RNG is being constrained properly
    // like a d4 should roll 1, 2, 3, or 4, never 0 or 5
    #[test]
    fn test_roll() {
        let r = do_roll(100, 3);
        for value in r.into_iter() {
            assert!(value > 0 && value <= 3);
        }
    }

    #[test]
    fn test_use_dice() {
        let d = Dice::new(6, 6);
        d.roll();
    }

    #[test]
    fn test_parse_does_not_allow_negative_values() {
        let result = parse("-3d4");
        println!("{:?}", result);
        assert!(result.0 != -3);
    }

    #[test]
    fn test_parse_assumes_amount_1() {
        let result = parse("d20");
        assert_eq!(result.0, 1);
    }
}