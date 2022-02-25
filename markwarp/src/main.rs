use std::io;
use std::io::Read;

const WIDTH: i64 = 80;
const LINES: i64 = 15;

fn main() {
    let mut output = String::new();
    let mut input = String::new();
    let mut sem: i64 = 0;
    let mut count: i64 = 0;
    let mut lines: i64 = 0;
    io::stdin().read_to_string(&mut input);
    for c in input.chars() {
        match c {
            '{' => sem += 1,
            '}' => sem -= 1,
            _ => (),
        }
        if sem <= 0 {
            sem = 0;
            count += 1;
        }
        if count >= WIDTH && c.is_whitespace() {
            output.push('\n');
            output.push('…');
            output.push(' ');
            output.push(' ');
            output.push(' ');
            lines += 1;
            count = 0;
        } else {
            if c == '\n' {
                lines += 1;
            }
            output.push(c);
        }
        if lines > LINES {
            break;
        }
    }
    println!("{}", output);
}
