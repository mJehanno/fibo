import gleam/result

pub type MathError {
  InvalidNumber
}

pub fn fib(n: Int) -> Result(Int, MathError) {
  case n {
    0 | 1 -> Ok(n)
    other if n > 0 ->
      result.try(fib(other - 1), fn(x: Int) {
        Ok(x + result.unwrap(fib(other - 2), 0))
      })
    _ -> Error(InvalidNumber)
  }
}
