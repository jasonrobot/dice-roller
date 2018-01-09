extern crate rand;
use rand::Rng;
use rand::distributions::{Range, IndependentSample};

fn roll_dice(amount: u32, sides: u32) -> Vec<u32> {
    let mut v: Vec<u32> = Vec::new();
    let mut rng = rand::thread_rng();
    for _ in 0..amount {
        v.push(rng.gen_range(1, sides-1));
    }
    v
}

fn main() {
    println!("basic method: {}", rand::random::<u64>());

    println!("using a range,");
    println!("d6: {:?}", roll_dice(1, 6));
    println!("2d12: {:?}", roll_dice(2, 12));
    println!("4d4: {:?}", roll_dice(4, 4));    
}
