require "json"

class Dog
attr_accessor :name, :race
    def initialize(name,race)
        @name = name
        @race = race
    end



    def to_json
    JSON.dump({
        :name=>@name,
        :breed=>@race
    })
    end


end 

        ppr = Dog.new(["P","e","p","p","e","r"],"mixto")
    

    save_dog = File.new("saved_dog.json","w")
    
    save_dog = File.open("saved_dog.json","r+")

    save_dog.write(ppr.to_json)

    save_dog.rewind

    save_dog.readlines do |line|
        puts line
     end

    saved = File.read("saved_dog.json")
    loaded = JSON.parse(saved)
    #loaded["name"] = "Boli_Pepper"
    #ppr.name = loaded["name"]
    p ppr
