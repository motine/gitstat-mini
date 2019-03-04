#!/usr/bin/env ruby
# frozen_string_literal: true

# run ./gitstat.rb 4 weeks ago

since = ARGV.join(' ')
if since == ""
  puts "Please pass a duration (e.g. 4 weeks ago) as argument."
  exit
end

authors = `git log --all --format="%an" --since="#{since}"`.split("\n").uniq

authors.each do |author|
  log = `git log --all --author="#{author}" --since="#{since}" --shortstat --format=""`.split("\n")
  commit_count = log.size
  files_changed, insertions, deletions = log.reduce([0, 0, 0]) do |acc, line|
    # line example: 1 file changed, 28 insertions(+), 6 deletions(-)
    fc = line.match(/(\d+) files? changed/)&.captures&.fetch(0).to_i || 0
    ins = line.match(/(\d+) insertions?/)&.captures&.fetch(0).to_i || 0
    del = line.match(/(\d+) deletions?/)&.captures&.fetch(0).to_i || 0
    next [acc[0] + fc, acc[1] + ins, acc[2] + del]
  end
  puts "#{author.ljust(35)} #{commit_count.to_s.rjust(4)} commits #{insertions.to_s.rjust(6)}+ #{deletions.to_s.rjust(6)}- #{files_changed.to_s.rjust(6)} files"
end
