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

def slow_type string
    string.each_char do |char|
        print char
        sleep(0.05)
    end
    puts
end







random_array = [1, 2, 3]
door_combo = random_array.map {|num| rand(10)}
door_combo = door_combo.join("")

phonetic_alphabet = { a: 'alpha', b: 'bravo', c: 'charlie', d: 'delta', e: 'echo', f: 'foxtrot', g: 'golf', h: 'hotel', i: 'india', j: 'juliet', k: 'kilo', l: 'lima', m: 'mike', n: 'november', o: 'oscar', p: 'papa', q: 'quebec', r: 'romeo', s: 'sierra', t: 'tango', u: 'uniform', v: 'victor', w: 'whiskey', x: 'x-ray', y: 'yankee', z: 'zulu' }

alphabet_switch = false
alphabet_riddle = true
egg_switch = false
egg_riddle = true
phonetic_switch = false
phonetic_riddle = true
looked = false
locked = true
door = false

slow_type('What is your name?')
valid_name = false
until valid_name == true
    print 'User: '
    name = gets.chomp
    if name =~ /[^a-zA-Z]/
        slow_type ("Name cannot include numbers or symbols.")
    else
        valid_name = true
    end
end
phonetic_array = name.downcase.split("")
phonetic_array.map! do |letter|
    phonetic_alphabet[letter.to_sym]
end
phonetic_name = phonetic_array.join(" ")

slow_type("Welcome, #{name}! You are in an escape room. You must complete each of the riddles before you can leave. If you are unsure what to do, input commands for a list of potential actions.")

until locked == false
    print "#{name}: "
    command = gets.chomp.downcase
    case command
    when 'commands'
        if door == true && looked == true
            slow_type('commands')
            slow_type('look')
            slow_type('alphabet riddle')
            slow_type('egg riddle')
            slow_type('phonetic riddle')
            slow_type('open door')
            slow_type('unlock door')
        elsif door == true && looked == false
            slow_type('commands')
            slow_type('look')
            slow_type('open door')
            slow_type('unlock door')
        elsif looked == true && door == false
            slow_type('commands')
            slow_type('look')
            slow_type('alphabet riddle')
            slow_type('egg riddle')
            slow_type('phonetic riddle')
            slow_type('open door')
        else
            slow_type('commands')
            slow_type('look')
        end
    when 'look'
        slow_type("You are in a small room. Looking around, you can see a door. There are also a few different riddles to be solved. Choose a riddle to be solved: alphabet riddle, egg riddle, or phonetic riddle.")
        looked = true
    when 'alphabet riddle'
        if alphabet_riddle == true
            slow_type("How many letters are in 'the alphabet'?")
            print "#{name}: "
            answer = gets.chomp
            if answer == '11'
                slow_type('That answer is correct!')
                slow_type("You receive a slip of paper with the number #{door_combo[0]} on it.")
                alphabet_switch = true
                alphabet_riddle = false
            else
                slow_type('That answer is incorrect! Try again!')
            end
        else
            slow_type('You have already solved that riddle!')
        end
    when 'egg riddle'
        if egg_riddle == true
            slow_type('I have 6 eggs. I broke 2, cooked 2, and ate 2. How many eggs do I have?')
            print "#{name}: "
            answer = gets.chomp
            if answer == '6'
                slow_type('That answer is correct!')
                slow_type("You receive a slip of paper with the number #{door_combo[1]} on it.")
                egg_switch = true
                egg_riddle = false
            else
                slow_type('That answer is incorrect! Try again!')
            end
        else
            slow_type('You have already solved that riddle!')
        end
    when 'phonetic riddle'
        if phonetic_riddle == true
            slow_type('Whiskey hotel alpha tango  india sierra  yankee oscar uniform romeo  november alpha mike echo?')
            print "#{name}: "
            answer = gets.chomp
            if answer.downcase == phonetic_name
                slow_type('That answer is correct!')
                slow_type("You receive a slip of paper with the number #{door_combo[2]} on it.")
                phonetic_switch = true
                phonetic_riddle = false
            else
                slow_type('That answer is incorrect! Try again!')
            end
        else
            slow_type('You have already solved that riddle!')
        end
    when 'open door'
        door = true
        if locked == true
        slow_type('The door is locked with a three digit combination lock.')
        end
    when 'unlock door'
        print "#{name}: "
        answer = gets.chomp
        if answer == door_combo
            slow_type('You hear a soft clicking sound.')
            locked = false
        else
            slow_type('Nothing happens.')
        end
    else
        slow_type('That command cannot be executed.')
    end
end

slow_type("The door opens and you are now free to leave. Congratulations, #{name}! You have successfully escaped the room!")