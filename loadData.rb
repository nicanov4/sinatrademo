require 'pg'

begin
  con = PG.connect :dbname => 'cakedb', :user => 'nico',
                   :password => 'password'
  @cakes = File.open("cake.list", "r")
  i = 0
  @cakes.each_line do |line|
    sql = "INSERT INTO cakes (id,name) VALUES (#{i}, '#{line}')"
    con.exec(sql)
    i+=1
  end
end
