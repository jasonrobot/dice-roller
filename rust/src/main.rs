mod dice;

fn main() {
    // println!("basic method: {}", rand::random::<u64>());

    println!("using a range,");
    println!("d6: {:?}", dice::roll_dice(1, 6));
    println!("2d12: {:?}", dice::roll_dice(2, 12));
    println!("4d4: {:?}", dice::roll_dice(4, 4));    
}