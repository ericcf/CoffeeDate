describe 'CoffeeDate', ->

  describe '#isToday', ->

    it 'returns true for today', ->
      expect((new Date).isToday()).toBeTruthy()

    it 'returns false for not today', ->
      expect((new Date(1000, 1, 1)).isToday()).toBeFalsy()

  describe '#isThisYear', ->

    it 'returns true for today', ->
      expect((new Date).isThisYear()).toBeTruthy()

    it 'returns false for last year', ->
      date = new Date
      date.setFullYear(date.getFullYear() - 1)
      expect(date.isThisYear()).toBeFalsy()

  describe '.fromISO_8601', ->

    it 'returns null for non-strings', ->
      expect(CoffeeDate.fromISO_8601(1)).toBeNull()
      
    it 'returns null for incorrectly formatted strings', ->
      expect(CoffeeDate.fromISO_8601('abcdef')).toBeNull()

    it 'returns a date for correctly formatted strings', ->
      date = CoffeeDate.fromISO_8601('1234-12-31')
      expect(date).not.toBeNull()
      expect(date.getFullYear()).toEqual(1234)
      expect(date.getMonth()).toEqual(11)
      expect(date.getDate()).toEqual(31)
