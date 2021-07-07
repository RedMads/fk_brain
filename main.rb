=begin
-----------------------------------------------------------------------------------

Hello guys im RedMad :$ today [ 2021/7/7 ] i made this simple game written in ruby !

The idea of this game to train your f*cking dump Brain HAHAHA !

im just kidding The real idea of this game is to train the brain in the ability to remember.

FEATURES:

    - levels system [easy, normal, hard, insane]
    - score counting

CONTACT US:

    Github: https://github.com/RedMads/
    Email: redmads@protonmail.com


- RedMad :$

-----------------------------------------------------------------------------------
=end


# Game Class !
class Game

    attr_accessor :dif, :str_length



    def initialize(dif="easy", str_length=6)

        @dif = dif
        @str_length = str_length

        # settings !
        @sleep_for = 5
        @score = 0

        @score_avrage = 3

        @lose = false
        @trys = 5

    end

    # print the banner !
    def banner()

        file = File.open("resources/banner.txt", "r")

        puts file.read()

    end

    # This function to generate random string with different levels !
    def generate_string()

        # Easy level
        if @dif.downcase() == "easy"

            charset = Array("0".."9")
            string = Array.new(@str_length) { charset.sample }.join
            return string

        # Normal level
        elsif @dif.downcase() == "normal"

            charset = Array("0".."9") + Array("a".."z")
            string = Array.new(@str_length) { charset.sample }.join

            return string
        
        # Hard level
        elsif @dif.downcase() == "hard"

            charset = Array("0".."9") + Array("a".."z") + Array("A".."Z")
            string = Array.new(@str_length) { charset.sample }.join

            return string
        
        # insane level
        elsif @dif.downcase() == "insane"

            charset = Array("0".."9") + Array("a".."z") + Array("A".."Z") + [
                "!",
                "@",
                "#",
                "$",
                "%",
                "^",
                "&",
                "*",
                "?"
            ]

            string = Array.new(@str_length) { charset.sample }.join

            return string
        
        # display this message if level not defined 1
        else
            puts "[!] This diffculty is not defined ."
            exit()

        end

    end



    # Play function !
    def play()

        while !@lose

            system("clear") # clear the console !

            banner()

            string = generate_string()
    
            puts "Score: [ #{@score} ]\n\n"
    
            puts "Code: [ #{string} ]\n\n"

            for num in 1..5

                print num.to_s + " "
                sleep(1)

            end

            system("clear") # clear the console !

            banner()

            print "[ #{@trys} ] Enter the correct code: "

            inp = gets.chomp()

            if inp == string

                @score += @score_avrage

                puts "[$] Answer is correct !"; sleep(1.8)

            else

                @trys -= 1

                if @trys == 0

                    @lose = true 
    
                end

                puts "[!] Answer is incorrect ."; sleep(1.8)


            end
            
            if @score == 20

                @dif = "normal"

            elsif @score == 40

                @dif = "hard"

            elsif @score == 60

                @dif = "insane"

            else

                nil

            end

         end

        print "[?] Did you want play again (y/n): " 

        y_n = gets.chomp()

        while true

            if y_n.downcase() == "y" or y_n.downcase() == "yes"

                main()

            elsif y_n.downcase() == "n" or y_n.downcase() == "no"

                puts "Thanks you for playing !"; exit()


            else

                print "[?] Did you want play again (y/n): " 
                y_n = gets.chomp()
                
                

            end

        end

    end

end


# main function !
def main()

    g_obj = Game.new()

    system("clear")

    g_obj.banner()

    print "Press Enter to start..."

    x = gets.chomp()


    g_obj.play()
end

main()


# ---------- END OF THE SOURCE CODE ---------- #