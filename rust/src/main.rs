mod dice;
extern crate regex;

#[macro_use] extern crate log;

use std::io;
use std::io::prelude::*;
use std::string::String;
use regex::Regex;

use dice::Dice;

fn main() {
    debug!("using the real thing,");
    let d = Dice::from_string("20d6").unwrap();
    debug!("d6: {:?}", d.roll());
    let d = Dice::from_string("20d12").unwrap();
    debug!("2d12: {:?}", d.roll());
    let d = Dice::from_string("20d100").unwrap();
    debug!("4d4: {:?}", d.roll());
    debug!("");

    let mut quit = false;

    while !quit {
        let input = match get_input() {
            Ok(line) => String::from(line.trim()),
            Err(_) => String::new(),
        };
        if Regex::new(r"(q|Q)").unwrap().is_match(&input) {
            quit = true;
            println!("Quitting!");
        }
        else {
            roll_dice(&input);
        }
    }
}

fn roll_dice(input: &str) {
    match Dice::from_string(&input) {
        None => println!("Sorry, dont know how to roll a {}.", &input),
        Some(d) => {
            info!("rolling: {:?}", d);
            println!("{:?}", d.roll());
        }
    }    
}

fn get_input() -> Result<String, io::Error> {
    let stdin = io::stdin();    
    let mut input = String::new();

    print!("Enter dice to roll ('q' to quit): ");
    try!(io::stdout().flush());

    try!(stdin.lock().read_line(&mut input));
    Ok(input)
}