# frozen_string_literal: true

require 'pathname'

module Abulafia
  # The note repository. Provides access to the notes.
  class Repo
    def initialize(dir)
      @dir = dir
    end

    def list
      prefix = Pathname.new(@dir)
      files = Dir.glob("#{@dir}/**/*").collect do |p|
        name = Pathname.new(p).relative_path_from(prefix).to_s
        name.gsub(/\.md$/, '')
      end
      files.sort.reverse
    end

    def exists?(name)
      File.exist?(full_path(name))
    end

    def full_path(name)
      "#{@dir}/#{name}.md"
    end
  end
end
