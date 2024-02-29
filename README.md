# FactoryClone

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/factory_clone`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

* Execute command `bundle exec rake install` to install factory functionality locally.
* To test factory run `bin/console` and `extend FactoryClone`.

## Usage
* Define one class and factory for the same.
- E.g:
```ruby
class Info
  attr_accessor :name, :gender
end

factory :info do
  name { 'Adam' }
  gender { :male }
end
```
* Create instance of `Info` using below helper method:
```ruby
create(:info, name: 'John') # Create Info instance with attributes name(John) and gender(Male).
create(:info, gender: :male) # Create Info instance with attributes name(Adam) and gender(Male).
create(:info, name: 'Elly', gender: :female) # Create Info instance with attributes name(Elly) and gender(Female).
```

## Future Enhancement
* Integration with rails & Other ruby frameworks
1. As of now, this gem supports only ruby classes. However, we can add functionality to integrate it with ruby frameworks to support active records.
2. We can extend generator to generate different instances depending upon the frameworks used.