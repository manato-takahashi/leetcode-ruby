# @param {String} s
# @return {Integer}
def score_of_string(s)
  ans = 0
  arr = s.bytes
  for i in 0..arr.length-2 do
      ans += (arr[i] - arr[i+1]).abs
  end

  ans
end