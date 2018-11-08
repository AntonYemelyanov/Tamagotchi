module Logic
  def self.change_params(req, name)

    Rack::Response.new do |response|
      response.set_cookie(name, req.cookies["#{name}"].to_i + 10)

      need = ($NEEDS - [name]).sample

      response.set_cookie(need, req.cookies["#{need}"].to_i - rand(30..65))
      response.set_cookie(need, 0) if req.cookies["#{need}"].to_i < 0

      response.redirect('/start')
    end
  end
end
