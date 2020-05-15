require "date"
require 'optparse'
opt = OptionParser.new

# コマンドライン引数の取得
year = ""
month = ""
# opt.on('-m', '--month MONTH', 'indicate month') {|v| puts v}
opt.on('-m', '--month MONTH', 'indicate month') {|v| month = v}
opt.on('-y', '--year YIAR', 'indicate year') {|v| year = v}
opt.parse(ARGV)

# コマンドライン引数で年月の指定がない場合は今日の年月を設定
today = Date.today
month = today.strftime("%-m") if month == ""
year = today.strftime("%Y") if year == "" 

# 月の開始日、終了日、開始曜日の取得
d = Date.parse("#{year}/#{month}/1") # 文字列を日付型に変換
s_day = d
e_day = d.next_month - 1
s_int = s_day.strftime("%d").to_i # 月の開始日
e_int = e_day.strftime("%d").to_i # 月の終了日
w_int = s_day.strftime("%w").to_i # 開始曜日
p w_int

# カレンダーの表示
puts "     " + month + "月 "+ year
puts "日  月  火  水  木  金  土"
print "    " * w_int    # 開始位置の設定
n = 1
while n <= e_int do
    if n < 10
        print " #{n}  "
    else
        print "#{n}  "
    end
    if (w_int + n).modulo(7) == 0 # 改行
        puts "\n"
    end
    n += 1

end
puts "\n" * 2


