# @param {Integer} n
# @param {Integer} m
# @return {Integer}
def difference_of_sums(n, m)
  ans = 0
  for i in 1..n do
    if i % m != 0
      ans += i
    else
      ans -= i
    end
  end
  ans
end