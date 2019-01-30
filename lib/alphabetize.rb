require 'pry'


def alphabetize(arr)
  array_output = []
  arr.each do |esperanto_string|
    index_place = letter_checker esperanto_string, array_output
    array_output.insert(index_place, esperanto_string)
  end
  array_output
end


def letter_checker(esperanto_string, array)
  array_output = array
  alphabet = " abcĉdefgĝhĥijĵklmnoprsŝtuŭvz"
  esperanto_map = alphabet.each_char.with_index.to_a.to_h
  insert_index_output = 0

  # CHECK NUMBER #1:
  # check if array_output is empty -
  # if so, make insert_index_output = 0 (add first item)
  if array_output.empty?

  else
    # CHECK NUMBER #1.5:
    # iterate over each item in array_output,
    # checking each for 1st letter match (then 2nd, then 3rd...)

    array_output.each do |sorted_phrase|
      sorted_phrase_string = sorted_phrase.to_s
      letter_counter = 0
      sorted_phrase_checked = false
      while sorted_phrase_checked == false
        sorted_phrase_string.each_char do |sorted_phrase_letter|
          esperanto_string_number = esperanto_map[esperanto_string[letter_counter]]
          sorted_phrase_number = esperanto_map[sorted_phrase_letter]

          if esperanto_string_number < sorted_phrase_number
            # case 1: current letter is EARLIER in alphabet
            # insert (add before) the array.index[num]
            break insert_index_output

          elsif esperanto_string_number > sorted_phrase_number
            # case 2: current letter is LATER in alphabet
            # move to check next word in array_output
            insert_index_output += 1
            sorted_phrase_checked = true

          elsif esperanto_string_number == sorted_phrase_number
            # case 3: current letter matches number of array_word
            # move on to check next letter in esperanto_string
            letter_counter += 1

          end
        end



      end
    end
  end
  insert_index_output
end


#def alphabetize(arr)
#  array_output = []
#  hash_temp = {}
#  alphabet = "abcĉdefgĝhĥijĵklmnoprsŝtuŭvz"
#  esperanto_map = alphabet.each_char.with_index.to_a.to_h
#  arr.each do |esperanto_string|
#    # create a hash value containing first letter's index number
#    hash_temp[esperanto_string] = esperanto_map[esperanto_string[0]]
#    array_output[hash_temp[esperanto_string]] = esperanto_string
#  end
#array_output.compact
#end
