mod dice;
extern crate regex;

#[macro_use] extern crate log;

use std::io;
use std::io::prelude::*;
use std::string::String;
use regex::Regex;

//use dice::Dice;

fn main() {
    debug!("basic method: {}", rand::random::<u64>());

    debug!("using the real thing,");
    let d = dice::Dice::from_string("20d6").unwrap();
    debug!("d6: {:?}", d.roll());
    let d = dice::Dice::from_string("20d12").unwrap();
    debug!("2d12: {:?}", d.roll());
    let d = dice::Dice::from_string("20d100").unwrap();
    debug!("4d4: {:?}", d.roll());
    debug!("");

    let mut quit = false;

    while !quit {
        let mut input = get_input().unwrap_or(String::new());
        input = String::from(input.trim());
        if Regex::new(r"(q|Q)").unwrap().is_match(&input) {
            quit = true;
            println!("Quitting!");
        }
        else {
            match dice::Dice::from_string(&input) {
                None => println!("Sorry, dont know how to roll a {}.", &input),
                Some(d) => {
                    info!("rolling: {:?}", d);
                    println!("{:?}", d.roll());
                }
            }
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