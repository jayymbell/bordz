# Date
Date::DATE_FORMATS[:default] = "%m/%d/%Y" 

# Time
Time::DATE_FORMATS[:long_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize} %Y %l:%M %p") }