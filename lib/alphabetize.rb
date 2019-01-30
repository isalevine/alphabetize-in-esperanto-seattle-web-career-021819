def alphabetize(arr)
  output_array = []

  arr.each do |esperanto_string|

    if output_array.empty?
      output_array.insert(0, esperanto_string)

    else
      index_place = letter_checker(esperanto_string, output_array)
      output_array.insert(index_place, esperanto_string)
    end

  end
output_array
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
    # can this case be deleted? - redundant due to Empty Array check in method 'alphabetize'


  else
    # CHECK NUMBER #1.5:
    # iterate over each item in array_output,
    # checking each for 1st letter match (then 2nd, then 3rd...)


    array_output.each do |sorted_phrase|
      letter_counter = 0
      sorted_phrase_checked = false
      while sorted_phrase_checked == false
        sorted_phrase.each_char do |sorted_phrase_letter|
          esperanto_string_number = esperanto_map[esperanto_string[letter_counter]]
          sorted_phrase_number = esperanto_map[sorted_phrase_letter]

          if esperanto_string_number < sorted_phrase_number
            # case 1: current letter is EARLIER in alphabet
            # insert (add before) the array.index[num]
            sorted_phrase_checked = true
            break insert_index_output

          elsif esperanto_string_number > sorted_phrase_number
            # case 2: current letter is LATER in alphabet
            # move to check next word in array_output
            insert_index_output += 1
            sorted_phrase_checked = true
            break insert_index_output

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
