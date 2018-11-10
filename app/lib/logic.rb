module Logic
  def self.change_params(req, name)

    Rack::Response.new do |response|
      response.set_cookie(name, req.cookies["#{name}"].to_i + 5)

      need = ($NEEDS - [name]).sample

      response.set_cookie(need, req.cookies["#{need}"].to_i - rand(5..10))
      response.set_cookie(need, 0) if req.cookies["#{need}"].to_i < 0
      response.set_cookie(need, 100) if req.cookies["#{need}"].to_i > 100

      response.redirect('/start')
    end
  end

  def self.megitation_params(req, name)

    Rack::Response.new do |responses|
      responses.set_cookie(name, req.cookies["#{name}"].to_i + 50)

      responses.redirect('/meditation')
    end
  end

end
