class Validate
	constructor: (@string, @result = yes) ->

	notEmpty: ->
		return @ unless @result
		@result = no unless @string
		@

	isEmail: ->
		return @ unless @result
		# email has @ and dot
		@result = no unless /^.+@.+\..+$/.test @string
		@

	isInt: ->
		return @ unless @result
		@result = no unless /^-?\d+$/.test @string
		@

	lessThen: (length) ->
		return @ unless @result
		@result = no if @string.length >= length
		@

	moreThen: (length) ->
		return @ unless @result
		@result = no if @string.length <= length
		@

	end: -> @result


module.exports = (string) ->
	throw new Error('Parameter must be a string') if typeof string isnt 'string'
	return new Validate string
