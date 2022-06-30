require "csv"

input_number = ""

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

while input_number == ""
  memo_type = gets.to_s
  input_value = memo_type.chomp
  if ["1", "2"].include?(input_value)
    input_number = input_value
  else
    puts "1か2の数字を入力して下さい。"
  end
end

if input_number == "1"
    puts "拡張子を除いたファイル名を入力して下さい。"
    file_name = gets.chomp

    puts "メモしたい内容を入力して下さい。（Ctrl+Dで保存）"
    input_memo_new = STDIN.read
    CSV.open("#{file_name}.csv", "w") do |csv|
       csv << ["#{input_memo_new}"]
    end

elsif input_number == "2"
    puts "編集するファイルの名前を入力して下さい。"
    edit_file_name = gets.chomp

    puts "メモしたい内容を入力して下さい。（Ctrl+Dで保存）"
    input_memo_edit = STDIN.read
    CSV.open("#{edit_file_name}.csv", "a") do |csv|
       csv << ["#{input_memo_edit}"]
    end

else
    puts "1か2の数字を入力して下さい"
    memo_type = gets.to_s
    input_number = memo_type.chomp
end
