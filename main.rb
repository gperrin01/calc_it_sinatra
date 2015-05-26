require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do 
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
  if @first && @power
    @first = params["first"].to_f
    @power = params["power"].to_i
    @result = @first ** @power 
  end
  erb :power
end

get '/sqrt' do 
  if @first
    @first = params["first"].to_f
    @result = Math.sqrt(@first)
  end
  erb :sqrt
end

get '/extra_one' do 
  if @first
    @first = params["first"].to_f
    @ result = @first*11
  end
  erb :extra_one
end