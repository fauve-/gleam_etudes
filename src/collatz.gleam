pub fn collatz(number: Int) -> Int {
  collatz_inner(number, 0)
}

fn collatz_inner(number: Int, steps: Int) -> Int {
  let is_even = number % 2 == 0
  case number {
    1 -> steps
    number if is_even ->
      number
      |> collatz_even
      |> collatz_inner(steps + 1)
    number ->
      number
      |> collatz_odd
      |> collatz_inner(steps + 1)
  }
}

fn collatz_odd(number: Int) -> Int {
  3 * number + 1
}

fn collatz_even(number: Int) -> Int {
  number / 2
}
