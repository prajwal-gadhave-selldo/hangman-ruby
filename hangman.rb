class Hangman
    WINNING_ANIMATIONS = hangman_graphics = [
        '''
         ------
         |    |
              |
              |
              |
              |
              |
        --------
        ''',  # 0 wrong guesses
        '''
         ------
         |    |
         O    |
              |
              |
              |
              |
        --------
        ''',  # 1 wrong guess
        '''
         ------
         |    |
         O    |
         |    |
              |
              |
              |
        --------
        ''',  # 2 wrong guesses
        '''
         ------
         |    |
         O    |
        /|    |
              |
              |
              |
        --------
        ''',  # 3 wrong guesses
        '''
         ------
         |    |
         O    |
        /|\\   |
              |
              |
              |
        --------
        ''',  # 4 wrong guesses
        '''
         ------
         |    |
         O    |
        /|\\   |
        /     |
              |
              |
        --------
        ''',  # 5 wrong guesses
        '''
         ------
         |    |
         O    |
        /|\\   |
        / \\   |
              |
              |
        --------
        '''   # 6 wrong guesses
    ]
    
    
    def initialize
        @word = "People".downcase    
        @attempt = 0
        @max_attempts = 7
        @guessed_letter = []
    end  
 
    def start
        while @attempt < @max_attempts
            puts "Current word: #{display_word}"
            puts "Enter the Letter: "
            s = gets.chomp
            check(s)
            
            if won?
                puts "Congrats you guessed the word '#{@word}'!"
                return
            end
        end  
        
        puts "Game Over! The word was '#{@word}'."
    end
 
    def display_word
        display = @word.chars.map { |char| @guessed_letter.include?(char) ? char : '_' }
        display.join(' ')
    end
 
    def check(str)
        str = str.downcase
 
        if str.length != 1 || !str.match?(/[a-z]/)
            puts "Enter a valid Char"
            return
        end
 
        if @guessed_letter.include?(str)
            puts "You already entered this Char earlier"
            return
        end
 
        @guessed_letter << str
 
        if @word.include?(str)
            puts "Correct guess!"
        else
            @attempt += 1
            puts WINNING_ANIMATIONS[@attempt - 1]
            puts "Incorrect guess! You have #{@max_attempts - @attempt} left"
        end
    end
 
    def won?
        @word.chars.all? { |char| @guessed_letter.include?(char) }
    end
end
 
game = Hangman.new
game.start