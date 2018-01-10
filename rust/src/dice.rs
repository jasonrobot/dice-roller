extern crate rand;

use self::rand::Rng;
// use self::rand::distributions::{Range, IndependentSample};

pub fn roll_dice(amount: u32, sides: u32) -> Vec<u32> {
    let mut v: Vec<u32> = Vec::new();
    let mut rng = rand::thread_rng();

    for _ in 0..amount {
        v.push(rng.gen_range(1, sides+1));
    }
    v
}


#[cfg(test)]
mod tests {
    use dice;
    #[test]
    fn samle_test() {
        assert_eq!(2 + 2, 4);
        assert!( dice::roll_dice(3, 4).len() == 3 );
    }
}