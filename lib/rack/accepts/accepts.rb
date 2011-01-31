module Rack
  class Accepts
    def initialize(app)  
      @app = app  
    end  

    def call(env)  
      if some_bad_accepts_headers?
        Rack::Response.new([], 406).finish
      else
        @app.call(env)
      end
    end

    private

    def some_bad_accepts_headers
      headers["Accepts"].include? "***"  
    end
  end
end