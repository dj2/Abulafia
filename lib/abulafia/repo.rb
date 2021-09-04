# frozen_string_literal: true

require 'pathname'

module Abulafia
  # Information about a search result
  class SearchResult
    attr_reader :file, :line, :context

    def initialize(file, line, context)
      @file = file
      @line = line
      @context = context
    end
  end

  # The note repository. Provides access to the notes.
  class Repo
    GREP_FLAGS = '--recursive -S --colour=always --line-number ' \
                 "--binary-file=without-match --ignore-case --exclude-dir='.*'".freeze

    def initialize(dir)
      @dir = dir
    end

    def list
      Dir.glob("#{@dir}/**/*").collect { |p| cleanup_pathname(p) }.sort.reverse
    end

    def open(name, mode, &block)
      File.open(full_path(name), mode, &block)
    end

    def read(name)
      File.open(full_path(name)).read
    end

    def exist?(name)
      File.exist?(full_path(name))
    end

    def search(content)
      res = `grep #{GREP_FLAGS} #{content} #{@dir}`
      return if res.nil? || res.empty?

      res.split(/\n/).collect do |l|
        parts = l.split(/:/)
        next if parts.size < 2

        SearchResult.new(cleanup_pathname(parts.shift),
                         parts.shift.to_i, parts.join(':'))
      end
    end

    def full_path(name)
      "#{@dir}/#{name}.md"
    end

    def cleanup_pathname(name)
      prefix = Pathname.new(@dir)
      filename = Pathname.new(name).relative_path_from(prefix).to_s
      filename.gsub(/\.md$/, '')
    end
  end
end
