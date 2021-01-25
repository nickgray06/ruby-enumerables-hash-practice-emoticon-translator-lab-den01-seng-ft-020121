# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  # code goes here
  emote = YAML.load_file(file_path)
  final_emote = {}
  emote.each do |name, emoji_array|
    final_emote[name] = {:english => {}, :japanese => {}}
    emoji_array.each_with_index do |emoji, index|
      if index == 0 
        final_emote[name][:english] = emoji
      elsif index == 1
        final_emote[name][:japanese] = emoji
      end
    end
  end
  final_emote
end

def get_japanese_emoticon(file_path, emoji)
  # code goes here
  dictionary = load_library(file_path)
  japanese_emoji = ""
  dictionary.each do |name, value|
    if emoji == value[:english]
      return japanese_emoji = value[:japanese]
    else
      japanese_emoji = "Sorry, that emoticon was not found"
    end
  end
  japanese_emoji
end

def get_english_meaning(file_path, emoji)
  # code goes here
  dictionary = load_library(file_path)
  eng_name = ""
  dictionary.each do |name, value|
    if emoji == value[:japanese]
      return eng_name = name
    else
      eng_name = "Sorry, that emoticon was not found"
    end
  end
  eng_name
end

