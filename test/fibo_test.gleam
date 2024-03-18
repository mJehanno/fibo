import gleeunit
import gleeunit/should
import gleam/list
import fibo

pub fn main() {
  gleeunit.main()
}

pub type Test {
  TestData(val: Int, expected: Result(Int, fibo.MathError))
}

// gleeunit test functions end in `_test`
pub fn fibo_test() {
  let data = [
    TestData(-5, Error(fibo.InvalidNumber)),
    TestData(0, Ok(0)),
    TestData(1, Ok(1)),
    TestData(5, Ok(5)),
    TestData(10, Ok(55)),
  ]

  list.each(data, fn(d) { should.equal(fibo.fib(d.val), d.expected) })
}
