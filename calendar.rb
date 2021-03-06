# frozen_string_literal: true

require 'date'
require 'optparse'
opt = OptionParser.new

# コマンドライン引数の取得
year = ''
month = ''
opt.on('-m', '--month MONTH', 'indicate month') { |v| month = v }
opt.on('-y', '--year YEAR', 'indicate year') { |v| year = v }
opt.parse(ARGV)

# コマンドライン引数で年月の指定がない場合は今日の年月を設定
today = Date.today
month = today.strftime('%-m') if month == ''
year = today.strftime('%Y') if year == ''

# 月の開始日、終了日、開始曜日の取得
d = Date.parse("#{year}/#{month}/1") # 文字列を日付型に変換
start_day = d
end_day = d.next_month - 1
end_day_num = end_day.strftime('%d').to_i # 月の終了日
week_num = start_day.strftime('%w').to_i # 開始曜日

# カレンダーの表示
puts '      ' + month + '月 ' + year
puts '日 月 火 水 木 金 土'
print '   ' * week_num # 開始位置の設定

(1..end_day_num).each do |date_num|
  if date_num < 10
    print " #{date_num} "
  else
    print "#{date_num} "
  end
  puts "\n" if (week_num + date_num) % 7 == 0 # 改行
end
puts "\n"
