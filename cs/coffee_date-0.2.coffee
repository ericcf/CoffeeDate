window.CoffeeDate =
  ISO_8601:     /^\d{4}-[01]?\d-[0-3]?\d$/
  SHORT_MONTHS: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']

# Returns true if date is today, false otherwise.
Date.prototype.isToday = ->
  today = new Date
  @getFullYear() == today.getFullYear() &&
    @getMonth() == today.getMonth() &&
    @getDate() == today.getDate()

# Returns true if date is this calendar year, false otherwise.
Date.prototype.isThisYear = ->
  @getFullYear() == (new Date).getFullYear()

Date.prototype.toStr = (format) ->
  switch format
    when 'mon date'
      "#{CoffeeDate.SHORT_MONTHS[@getMonth()]} #{@getDate()}"
    when 'mon year'
      "#{CoffeeDate.SHORT_MONTHS[@getMonth()]} #{@getFullYear()}"

# Returns true if dateStr is in yyyy-mm-dd format.
CoffeeDate.isISO_8601 = (dateStr) ->
  typeof(dateStr) == "string" && dateStr.match(CoffeeDate.ISO_8601) != null

# Convert string from yyyy-mm-dd format to a Date object.
CoffeeDate.fromISO_8601 = (dateStr) ->
  return null unless CoffeeDate.isISO_8601(dateStr)
  parts = dateStr.split(/-/)
  new Date(parts[0], parts[1]-1, parts[2][0..1], 12)
