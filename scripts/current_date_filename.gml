///current_date_filename()
//returns current date as a standard date filename

var t; t=date_current_datetime()

return string_pad(date_get_day(t),2)+
   "-"+string_pad(date_get_month(t),2)+
   "-"+string(date_get_year(t))+
   "_"+string_pad(date_get_hour(t),2)+
   "."+string_pad(date_get_minute(t),2)+
   "."+string_pad(date_get_second(t),2)
