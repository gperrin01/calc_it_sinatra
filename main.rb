require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do 
  @page = "*** Back to Basics ***"
  @first = params["first"].to_f
  @operator = params["operator"]
  @second = params["second"].to_f
  if @first && @second && @operator
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :home
end

get '/power' do 
  @page = "*** I got the Powa ***"
  @first_p = params["first_p"] 
  @power = params["power"]
  if @first_p && @power
    @result_p = @first_p.to_f ** @power.to_i 
  end
  erb :power
end

get '/sqrt' do 
  @page = "*** The Root of the problem ***"
  @first_sqrt = params["first_sqrt"]
  if @first_sqrt
    @result_sqrt = Math.sqrt(@first_sqrt.to_f).round(2)
  end
  erb :sqrt
end

get '/extra_one' do
  @page = "*** At the Eleventh hour ***"
  @first_extra = params["first_extra"] 
  if @first_extra
    @result_extra = @first_extra.to_f*11
  end
  erb :extra_one
end