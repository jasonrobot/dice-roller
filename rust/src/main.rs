mod dice;

fn main() {
    // println!("basic method: {}", rand::random::<u64>());

    println!("using the real thing,");
    let d = dice::Dice::from_string("20d6");
    println!("d6: {:?}", d.roll());
    let d = dice::Dice::from_string("20d12");
    println!("2d12: {:?}", d.roll());
    let d = dice::Dice::from_string("20d100");
    println!("4d4: {:?}", d.roll());
}