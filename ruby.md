# Notatki z Ruby, v2.3.1

## 1. Nil, true, false
```ruby
nil.class #=> NilClass
true.class #=> TrueClass
false.class #=> FalseClass

!nil   #=> true
!0     #=> false
```
## 2. String
```ruby
placeholder = 'use string interpolation'
"I can #{placeholder} when using double quoted strings"
#=> "I can use string interpolation when using double quoted strings"
```
### Combine strings, but not with numbers
```ruby
'hello ' + 'world'  #=> "hello world"
'hello ' + 3 #=> TypeError: can't convert Fixnum into String
'hello ' + 3.to_s #=> "hello 3"
```

### Combine strings and operators
```ruby
'hello ' * 3 #=> "hello hello hello "
```

#### Append to string
```ruby
'hello' << ' world' #=> "hello world"
```
### String output
```ruby
print # print
puts  # println
```

### By convention, use snake_case for variable names
```ruby
snake_case = true
```

## 3. Array

### Arrays can contain different types of items
```ruby
[1, 'hello', false] #=> [1, "hello", false]
```

### Arrays can be indexed
### From the front
```ruby
array[0] #=> 1
array.first #=> 1
array[12] #=> nil
```

### Like arithmetic, [var] access is just syntactic sugar for calling a method [] on an object
```ruby
array.[] 0 #=> 1
array.[] 12 #=> nil
```

### From the end
```ruby
array[-1] #=> 5
array.last #=> 5
```

### With a start index and length
```ruby
array[2, 3] #=> [3, 4, 5]
```

### Reverse an Array
```ruby
a=[1,2,3]
a.reverse! #=> [3,2,1]
```

### Or with a range
```ruby
array[1..3] #=> [2, 3, 4]
```

### Add to an array like this
```ruby
array << 6 #=> [1, 2, 3, 4, 5, 6]
```
### Or like this
```ruby
array.push(6) #=> [1, 2, 3, 4, 5, 6]
```

### Check if an item exists in an array
```ruby
array.include?(1) #=> true
```

## 4. Exception handling:
```ruby
begin
  # code here that might raise an exception
  raise NoMemoryError, 'You ran out of memory.'
rescue NoMemoryError => exception_variable
  puts 'NoMemoryError was raised', exception_variable
rescue RuntimeError => other_exception_variable
  puts 'RuntimeError was raised now'
else
  puts 'This runs if no exceptions were thrown at all'
ensure
  puts 'This code always runs no matter what'
end
```

## 5. Functions
```ruby
def double(x)
  x * 2
end
```
### Functions (and all blocks) implicitly return the value of the last statement
```ruby
double(2) #=> 4
```

### By convention, all methods that return booleans end with a question mark
```ruby
5.even? # false
5.odd? # true
```

### And if a method ends with an exclamation mark, it does something destructive like mutate the receiver. Many methods have a ! version to make a change, and a non-! version to just return a new changed version
```ruby
company_name = "Dunder Mifflin"
company_name.upcase #=> "DUNDER MIFFLIN"
company_name #=> "Dunder Mifflin"
company_name.upcase! # we're mutating company_name this time!
company_name #=> "DUNDER MIFFLIN"
```

## 6. Class

### Variables
```ruby
# Class variable
@@var
# Class instance variable
@var
```

### Use attr_accessor to create getters and setters
```ruby
attr_accessor :name
```

### Getter/setter methods can also be created individually like this
```ruby
attr_reader :name
attr_writer :name
```
