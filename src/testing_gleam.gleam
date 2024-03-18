import gleam/io
import collatz
import lizst

pub fn main() {
  collatz.collatz(420)
  |> io.debug

  let l =
    lizst.new_list()
    |> lizst.push_front(3)
    |> lizst.push_front(2)
    |> lizst.push_front(1)
  let assert Ok(#(value, popped)) = lizst.pop(l)
  io.println("popped value")
  io.debug(value)
  io.println("list after pop")
  io.debug(popped)
  lizst.for_each(l, fn(x) {
    io.debug(x)
    Nil
  })
  let new_list = lizst.map(l, fn(x) { x * 2 })
  io.println("doubled")
  io.debug(new_list)
  let filtered_list = lizst.filter(l, fn(x) { x % 2 == 0 })
  io.println("filtered list")
  io.debug(filtered_list)
  let reduced_list = lizst.reduce(l, fn(x, y) { x + y }, 0)
  io.println("reduced list")
  io.debug(reduced_list)
  let left =
    lizst.new_list()
    |> lizst.push_back(1)
    |> lizst.push_back(2)
    |> lizst.push_back(3)
  let right =
    lizst.new_list()
    |> lizst.push_back(4)
    |> lizst.push_back(5)
    |> lizst.push_back(6)
  let root =
    lizst.new_list()
    |> lizst.push_back(left)
    |> lizst.push_back(right)
  io.debug(root)
}
