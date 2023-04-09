@students = []

@cohorts = [
  "january",
  "february",
  "march",
  "april",
  "may",
  "june",
  "july",
  "august",
  "september",
  "october",
  "november",
  "december"
]

def print_cohorts
  puts @cohorts.to_s
end

puts File.read(__FILE__)