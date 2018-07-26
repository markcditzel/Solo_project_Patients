require 'date'

@date = Date.today
@dob = Date.new(1974,8,4)

p difference = (@date - @dob).to_i/365

p @date
p @dob

p @dob2 = Date.parse('04-8-1974')
p difference = (@date - @dob2).to_i/365
