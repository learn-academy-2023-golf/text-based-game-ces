# Text-based Game Challenge
# Escape room 
#
# Riddles
    #How many letters are in "the alphabet"=11
    #I have 6 eggs. broke 2, cooked2, and ate 2. How many eggs do I have
    #spell name using phonetic alphabet
    #possible time limit

#Pseudo Code:
#have command to show input possibilities
#You are in an escape room solve # riddles to escape
# give user option to choose riddle
    # print out riddle
    # give user choice to engage riddle skip hint
    # if chooses to engage 
        # user input .gets
    #case when user input = correct
        #solved mesage
    #case when user input != correct
        #try again

# method for each riddle
# true/false switch for copleted tasks

#when all switches are completed door opens

def escape_room_description
    p "You are in a small room. Looking around, you can see a few various riddles to be solved. Choose a riddle to be solved: alphabet riddle, egg riddle, or phonetic riddle."
end

phonetic_alphabet = { a: 'alpha', b: 'bravo', c: 'charlie', d: 'delta', e: 'echo', f: 'foxtrot', g: 'golf', h: 'hotel', i: 'india', j: 'juliet', k: 'kilo', l: 'lima', m: 'mike', n: 'november', o: 'oscar', p: 'papa', q: 'quebec', r: 'romeo', s: 'sierra', t: 'tango', u: 'uniform', v: 'victor', w: 'whiskey', x: 'x-ray', y: 'yankee', z: 'zulu' }

game_win = false

alphabet_riddle = true
egg_riddle = true
phonetic_riddle = true

p 'What is your name?'
name = gets.chomp

phonetic_array = name.downcase.split("")
phonetic_array.map! do |letter|
    phonetic_alphabet[letter.to_sym]
end
phonetic_name = phonetic_array.join(" ")

p "Welcome, #{name}! You are in an escape room. You must complete each of the riddles before you can leave. If you are unsure what to do, input commands for a list of potential actions."

until game_win == true
    command = gets.chomp.downcase
    case command
    when 'phonetic name'
        p phonetic_name
    when 'look'
        escape_room_description
    when 'alphabet riddle'
        if alphabet_riddle == true
            p "How many letters are in 'the alphabet'?"
            answer = gets.chomp
            if answer == '11'
                p 'That answer is correct!'
                alphabet_switch = true
                alphabet_riddle = false
            else
                p 'That answer is incorrect! Try again!'
            end
        else
            p 'You have already solved that riddle!'
        end
    when 'egg riddle'
        if egg_riddle == true
            p 'I have 6 eggs. I broke 2, cooked 2, and ate 2. How many eggs do I have?'
            answer = gets.chomp
            if answer == '6'
                p 'That answer is correct!'
                egg_switch = true
                egg_riddle = false
            else
                p 'That answer is incorrect! Try again!'
            end
        else
            p 'You have already solved that riddle!'
        end
    when 'telephone riddle'
        if phonetic_riddle == true
            p 'Spell your name using the telephone alphabet.'
        else
            p 'You have already solved that riddle!'
        end
    end
end