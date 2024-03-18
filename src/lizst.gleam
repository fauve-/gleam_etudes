pub type Lizst(val) {
  Next(val, Lizst(val))
  Empty
}

pub fn new_list() -> Lizst(val) {
  Empty
}

pub fn push_front(list: Lizst(val), v: val) -> Lizst(val) {
  Next(v, list)
}

pub fn pop(list: Lizst(val)) -> Result(#(val, Lizst(val)), Nil) {
  case list {
    Next(_, Next(val, Empty)) -> Ok(#(val, list))
    Next(_, lizst) -> pop(lizst)
    Empty -> Error(Nil)
  }
}

pub fn push_back(list: Lizst(val), v: val) -> Lizst(val) {
  case list {
    Empty -> Next(v, Empty)
    Next(val, next) -> Next(val, push_back(next, v))
  }
}

pub fn for_each(list: Lizst(val), f: fn(val) -> Nil) {
  case list {
    Empty -> Nil
    Next(val, next) -> {
      f(val)
      for_each(next, f)
    }
  }
}

pub fn map(list: Lizst(val), f: fn(val) -> other) -> Lizst(other) {
  case list {
    Empty -> Empty
    Next(val, next) -> Next(f(val), map(next, f))
  }
}

pub fn filter(list: Lizst(val), f: fn(val) -> Bool) -> Lizst(val) {
  filter_inner(list, f, new_list())
}

fn filter_inner(
  list: Lizst(val),
  f: fn(val) -> Bool,
  acc: Lizst(val),
) -> Lizst(val) {
  case list {
    Empty -> acc
    Next(val, next) -> {
      case f(val) {
        True -> {
          let new_acc = push_back(acc, val)
          filter_inner(next, f, new_acc)
        }
        False -> filter_inner(next, f, acc)
      }
    }
  }
}

pub fn reduce(
  list: Lizst(val),
  f: fn(val, other) -> other,
  initial_value: other,
) -> other {
  case list {
    Next(val, next) -> {
      reduce(next, f, f(val, initial_value))
    }
    Empty -> initial_value
  }
}
